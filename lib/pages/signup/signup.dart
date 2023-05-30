import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_signup/pages/login/login.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import '../../app_style.dart';
import '../landingpage/landingpage.dart';
import '../user/User.dart';

  enum Gender { pria, wanita}
  Gender? _gender;

class Signup extends StatefulWidget {
  static String id = "/signup";
  const Signup({super.key});
  @override
  State<Signup> createState() => _SignupState();

}

class _SignupState extends State<Signup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  Gender? genderController = _gender;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> register() async {
    final String username = usernameController.text;
    final String password = passwordController.text;
    final String confirmPassword = confirmPasswordController.text;
    final String name = nameController.text;
    final String email = emailController.text;
    final String address = addressController.text;
    final String gender =
    genderController == Gender.pria ? "Pria" : "Wanita";
    final String phoneNumber = phoneNumberController.text;
    // Ganti URL_API dengan URL API yang sesuai
    final String apiUrl =
        'https://candycrushlaundry.000webhostapp.com/ApiCC/register';
  bool isPasswordMatch() {
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    return password == confirmPassword;
  }
    if (!isPasswordMatch()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Registration Failed'),
          content: Text('Passwords do not match.', style: TextStyle(color: Colors.black),),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        "nama": name,
        "username": username,
        "jenis_kelamin": gender,
        "alamat": address,
        "email": email,
        "no_telp": phoneNumber,
        "password": password
      }),
    );

    if (response.statusCode == 200) {
      Navigator.of(context).pushNamedAndRemoveUntil(Login.id, (route) => false);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Registration Failed'),
          content: Text('Invalid response data.', style: TextStyle(color: Colors.black)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
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
              vertical: size.height * 0.035,
            ),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.005),
                Text(
                  "Buat Akun Baru",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: size.height * 0.024),
                const Divider(color: Colors.black, thickness: 2,),
                SizedBox(height: size.height * 0.010),
                TextField(
                  controller: nameController,
                  style: const TextStyle(color: kLightTextColor),
                  decoration: InputDecoration(
                    hintText: "Nama Lengkap",
                    prefixIcon: IconButton(
                      onPressed: null,
                      icon: SvgPicture.asset(userIcon),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.016),
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
                  controller: emailController,
                  style: const TextStyle(color: kLightTextColor),
                  decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: IconButton(
                      onPressed: null,
                      icon: SvgPicture.asset(emailIcon),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.016),
                TextField(
                  controller: phoneNumberController,
                  style: const TextStyle(color: kLightTextColor),
                  decoration: InputDecoration(
                    hintText: "Nomor Seluler",
                    prefixIcon: IconButton(
                      onPressed: null,
                      icon: SvgPicture.asset(telephoneIcon),
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
                SizedBox(height: size.height * 0.016),
                TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  style: const TextStyle(color: kLightTextColor),
                  decoration: InputDecoration(
                    hintText: "Ulang Kata Sandi",
                    prefixIcon: IconButton(
                      onPressed: null,
                      icon: SvgPicture.asset(lockIcon),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.016),
                TextField(
                  controller: addressController,
                  style: const TextStyle(color: kLightTextColor),
                  decoration: InputDecoration(
                    hintText: "Alamat",
                    prefixIcon: IconButton(
                      onPressed: null,
                      icon: SvgPicture.asset(locationIcon),
                    ),
                  ),
                  maxLines: 5, // <-- SEE HERE
                  minLines: 1,
                ),
                SizedBox(height: size.height * 0.016),
                const Text(
                  "Jenis Kelamin : ", 
                  style: TextStyle(
                    color: kLightTextColor, 
                    fontSize: 16
                    )
                  ),
                SizedBox(height: size.height * 0.016),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: const Text(
                          "Pria", 
                          style: TextStyle(
                            color: kLightTextColor, 
                            fontSize: 16
                          ),
                        ),
                        leading: Radio<Gender> (
                          value: Gender.pria, 
                          groupValue: _gender, 
                          onChanged: (Gender? value){
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text(
                          "Wanita", 
                          style: TextStyle(
                            color: kLightTextColor, 
                            fontSize: 16
                          ),
                        ),
                        leading: Radio<Gender> (
                          value: Gender.wanita, 
                          groupValue: _gender,                     
                          onChanged: (Gender? value){
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),                
                SizedBox(height: size.height * 0.025),
                ElevatedButton(
                  onPressed: () {
                    register();
                  },
                  child: Text(
                    "Sign Up",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                SizedBox(height: size.height * 0.015),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already member ?\t",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            Login.id, (route) => false);
                      },
                      child: Text(
                        "Sign In",
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

