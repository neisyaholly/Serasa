import 'package:flutter/material.dart';
// import 'package:serasa/pages/navbar.dart';
import 'package:serasa/pages/loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
        ),
      ),
      home: const LoadingPage(),
    );
  }
}