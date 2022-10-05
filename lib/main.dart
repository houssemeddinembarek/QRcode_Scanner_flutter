import 'package:EducationPourTous/features/scanner/presentation/pages/qr_scanner_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:EducationPourTous/features/scanner/presentation/bloc/qr_bloc.dart';
// import 'package:qrcode2/features/scanner/presentation/bloc/qr_bloc.dart';
// import 'package:qrcode2/features/scanner/presentation/pages/qr_scanner_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QrBloc()..add(const GetCoursesEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Education Pour Tous',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const QrScannerScreen(),
      ),
    );
  }
}
