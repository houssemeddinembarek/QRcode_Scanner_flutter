import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({Key? key}) : super(key: key);

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  AudioPlayer advancedPlayer = new AudioPlayer();
  Duration _duration = new Duration();
  Duration _position = new Duration();
  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    final audioCache = AudioCache();
    AudioPlayer advancedPlayer = new AudioPlayer();
    String? localFilePath;
    Duration _duration = new Duration();
    Duration _position = new Duration();
    var playerState;

    advancedPlayer.onDurationChanged.listen((Duration d) {
      print('Max duration: $d');
      setState(() => _duration = d);
    });
  }

  Widget _tab(List<Widget> children) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: children
              .map((w) => Container(child: w, padding: EdgeInsets.all(6.0)))
              .toList(),
        ),
      ),
    );
  }

  Widget _btn(String txt, VoidCallback onPressed) {
    return ButtonTheme(
        minWidth: 48.0,
        child: FloatingActionButton(child: Text(txt), onPressed: onPressed));
  }

  Widget localAsset() {
    return _tab([
      // Text('Play Local Asset \'audio.mp3\':'),
      _btn('Play',
          () => advancedPlayer.play(AssetSource(qrcodeText.toString()))),
      _btn('Pause', () => advancedPlayer.pause()),
      _btn('Stop', () => advancedPlayer.stop())
    ]);
  }

  String qrcodeText = "";

  Future<void> _scanQR(BuildContext context) async {
    String qrScanResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', '', false, ScanMode.QR);
    final res = qrScanResult;
    print(res.toString());

    setState(() {
      qrcodeText = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Education Pour Tous')),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/tree.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text('Scan'),
                    onPressed: () {
                      _scanQR(context);
                      advancedPlayer.stop();
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _btn(
                    'Play',
                    () => advancedPlayer
                        .play(AssetSource(qrcodeText.toString()))),
                SizedBox(
                  width: 10,
                ),
                _btn('Pause', () => advancedPlayer.pause()),
                SizedBox(
                  width: 10,
                ),
                _btn('Stop', () => advancedPlayer.stop())
              ],
            ),
          ],
        ),
      ),
    );
  }

  void dispose() {
    super.dispose();
    advancedPlayer.dispose();
  }
}
