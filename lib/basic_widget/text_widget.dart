import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Halo nama saya Anas, sedang belajar flutter",
      style: TextStyle(color: Colors.red, fontSize: 14),
      textAlign: TextAlign.center,
    );
  }
}