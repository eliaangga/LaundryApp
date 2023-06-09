import 'package:flutter/material.dart';
import 'package:flutter_login_signup/pages/landingpage/landingpage.dart';
import 'package:flutter_login_signup/pages/login/login.dart';
import 'package:flutter_login_signup/pages/signup/signup.dart';
import 'package:flutter_login_signup/pages/user/CreateOrder.dart';
import 'package:flutter_login_signup/pages/user/EditProfile.dart';
import 'package:flutter_login_signup/pages/user/HistoryOrder.dart';
import 'package:flutter_login_signup/pages/user/TrackOrder.dart';
import 'app_style.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Candy Crush Laundry',
      theme: appTheme,
      routes: {
        // "/":(context) => const home(),
        Signup.id: (context) => const Signup(),
        Login.id: (context) => const Login(),
        CreateOrder.id: (context) => CreateOrder(userData: null),
        EditProfile.id: (context) => EditProfile(userData: null),
        HistoryOrder.id: (context) => HistoryOrder(userData: null),
        TrackOrder.id: (context) => TrackOrder(userData: null),
        LandingPage.id: (context) => LandingPage(userData: null,)
      },
      home: const Login(),
    );
  }
}
