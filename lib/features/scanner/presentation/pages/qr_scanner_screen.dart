// ignore_for_file: use_build_context_synchronously

import 'package:EducationPourTous/features/scanner/presentation/pages/text_screen.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:EducationPourTous/features/scanner/presentation/bloc/qr_bloc.dart';
import 'package:get/get.dart';
// import 'package:qrcode2/features/scanner/presentation/bloc/qr_bloc.dart';

class QrScannerScreen extends StatelessWidget {
  const QrScannerScreen({Key? key}) : super(key: key);

  Future<void> _scanQR(BuildContext context) async {
     ScanResult qrScanResult = await BarcodeScanner.scan();
     final res = qrScanResult.rawContent;
    BlocProvider.of<QrBloc>(context).add(GetCourseEvent(ref: res));
    Navigator.push(context, MaterialPageRoute(builder: (context)=>TextScreen()));    
    //Get.to(TextScreen());
  }

  @override
  Widget build(BuildContext context) {
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
