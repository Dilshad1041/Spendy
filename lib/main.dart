import 'package:flutter/material.dart';
import 'package:spendy/core/themes.dart';
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
      title: 'Flutter Demo',
      theme: Themes.primaryTheme,
      home: const ScreenLogin(),
    );
  }
}
