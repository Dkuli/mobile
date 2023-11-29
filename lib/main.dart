import 'package:figma/cart_asli.dart';
import 'package:figma/splash_screen.dart';
import 'package:flutter/material.dart';

 // Sesuaikan dengan path yang benar

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
