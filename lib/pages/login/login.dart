import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_signup/app_style.dart';
import 'package:flutter_login_signup/pages/signup/signup.dart';
import 'package:flutter_login_signup/pages/user/CreateOrder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

import '../user/CreateOrder.dart';

class Login extends StatefulWidget {
  static String id = "/login";
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool check = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

void login() async {
  final String apiUrl = 'https://candycrushlaundry.000webhostapp.com/ApiCC/login'; // Ganti ip sesuai dengan ip pc anda

  Map<String, dynamic> body = {
    'username': usernameController.text,
    'password': passwordController.text,
  };

  var response = await http.post(Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body));

  if (response.statusCode == 200) {
    Navigator.pushNamedAndRemoveUntil(context, CreateOrder.id, (route) => false);
  } else {
    // Jika login gagal, tampilkan pesan error
    var data = jsonDecode(response.body);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Gagal'),
          content: Text(data['pesan']),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.1,   
              vertical: size.width * 0.1           
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    logoImage,
                  ),
                ),                                         
                TextField(
                  controller: usernameController,
                  style: const TextStyle(color: kLightTextColor),
                  decoration: InputDecoration(
                    hintText: "Username",
                    prefixIcon: IconButton(
                      onPressed: null,
                      icon: SvgPicture.asset(userIcon),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.016),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  style: const TextStyle(color: kLightTextColor),
                  decoration: InputDecoration(
                    hintText: "Kata Sandi",
                    prefixIcon: IconButton(
                      onPressed: null,
                      icon: SvgPicture.asset(lockIcon),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.021),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Lupa Kata Sandi?",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: kTextColor),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: check,
                      activeColor: kLightTextColor,
                      onChanged: (bool? value) {
                        setState(() {
                          check = value!;
                        });
                      },
                    ),
                    Text(
                      "Ingat saya dan biarkan saya tetap masuk",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.029),
                ElevatedButton(
                  onPressed: login,
                  // () {
                  //   Navigator.of(context).pushNamedAndRemoveUntil(
                  //     CreateOrder.id, (route) => false);
                  // },
                  child: Text(
                    "Masuk",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                SizedBox(height: size.height * 0.029),                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Belum punya akun?\t",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            Signup.id, (route) => false);
                      },
                      child: Text(
                        "Daftar Sekarang",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: kTextColor),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
