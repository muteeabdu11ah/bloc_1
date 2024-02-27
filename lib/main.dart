import 'package:bloc_1/features/home/UI/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(new myapp());


class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}