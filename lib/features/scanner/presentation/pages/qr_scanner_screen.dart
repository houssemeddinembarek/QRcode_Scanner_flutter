// ignore_for_file: use_build_context_synchronously

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrcode2/features/scanner/presentation/bloc/qr_bloc.dart';

class QrScannerScreen extends StatelessWidget {
  const QrScannerScreen({Key? key}) : super(key: key);

  Future<void> _scanQR(BuildContext context) async {
    ScanResult qrScanResult = await BarcodeScanner.scan();
    final res = qrScanResult.rawContent;
    BlocProvider.of<QrBloc>(context).add(GetCourseEvent(ref: res));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QrBloc, QrState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("QR Scanner"),
          ),
          body: ListView(
            padding: const EdgeInsets.only(top: 32, bottom: 80),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.course?.descriptionAr ?? '',
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            icon: const Icon(Icons.camera_alt),
            label: const Text("Scan"),
            onPressed: () {
              if (!state.loading) {
                _scanQR(context);
              }
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}
