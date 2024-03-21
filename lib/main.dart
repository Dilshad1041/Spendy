import 'package:flutter/material.dart';
import 'package:spendy/view/Login/screen_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 4, 40, 24)),
          primaryColor: const Color.fromARGB(255, 4, 40, 24)),
      home: const ScreenLogin(),
    );
  }
}
