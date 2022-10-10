import 'package:EducationPourTous/features/scanner/presentation/bloc/qr_bloc.dart';
import 'package:EducationPourTous/features/scanner/presentation/pages/text_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class QrScannerScreen extends StatelessWidget {
  const QrScannerScreen({Key? key}) : super(key: key);

   Future<void> _scanQR(BuildContext context) async {
     String qrScanResult = await FlutterBarcodeScanner.scanBarcode(
         '#ff6666', '', false, ScanMode.QR);
     final res = qrScanResult;

     BlocProvider.of<QrBloc>(context).add(GetCourseEvent(ref: res));
     Navigator.push(context, MaterialPageRoute(builder: (context) => TextScreen(res: res)));
   }

  @override
  Widget build(BuildContext context) {
      BlocProvider.of<QrBloc>(context).add(GetCoursesEvent());

    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.camera_alt),
        label: const Text("Scan"),
        onPressed: () {
           _scanQR(context); 
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
