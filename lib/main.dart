import 'package:api1/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: homescreen(),
    );
  }
}
