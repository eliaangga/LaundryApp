import 'package:flutter/material.dart';
import 'package:flutter_login_signup/pages/login/login.dart';
import 'package:flutter_login_signup/pages/signup/signup.dart';
import 'app_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter UI Tutorial',
      theme: appTheme,
      routes: {
        // "/":(context) => const home(),
        Signup.id: (context) => const Signup(),
        Login.id: (context) => const Login(),
      },
      home: const Login(),
    );
  }
}
