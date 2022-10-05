import 'package:EducationPourTous/features/scanner/presentation/bloc/qr_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextScreen extends StatelessWidget {
const TextScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return  BlocBuilder<QrBloc, QrState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(""),
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
        );
      },
    );
  }
}