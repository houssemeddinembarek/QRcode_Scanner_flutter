import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextScreen extends StatelessWidget {
  const TextScreen({
    Key? key,
    required this.res,
  }) : super(key: key);
  final String res;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
