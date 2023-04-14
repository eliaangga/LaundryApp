import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_signup/pages/login/login.dart';
import 'package:flutter_svg/svg.dart';

import '../../app_style.dart';

  enum Gender { lakiLaki, perempuan}
  Gender? _gender;

class Signup extends StatelessWidget {
  static String id = "/signup";
  const Signup({super.key});

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
                  style: const TextStyle(color: kLightTextColor),
                  decoration: InputDecoration(
                    hintText: "Nomor Seluler",
                    prefixIcon: IconButton(
                      onPressed: null,
                      icon: SvgPicture.asset(noIcon),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.016),
                TextField(
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
                const Text(
                  "Jenis Kelamin : ", 
                  style: TextStyle(
                    color: kLightTextColor, 
                    fontSize: 16
                    )
                  ),
                SizedBox(height: size.height * 0.016),
                RadioListTile(
                    title: const Text(
                      "Laki-laki", 
                      style: TextStyle(
                        color: kLightTextColor, 
                        fontSize: 16
                      ),
                    ),
                    value: "lakiLaki", 
                    groupValue: _gender, 
                    onChanged: (value){
                      (() {

                      });
                    },
                ),
                RadioListTile(
                    title: const Text(
                      "Perempuan", 
                      style: TextStyle(
                        color: kLightTextColor, 
                        fontSize: 16
                      ),
                    ),
                    value: "perempuan", 
                    groupValue: _gender, 
                    onChanged: (value){
                      (() {

                      });
                    },
                ),
                SizedBox(height: size.height * 0.016),
                TextField(
                  style: const TextStyle(color: kLightTextColor),
                  decoration: InputDecoration(
                    hintText: "Alamat",
                    prefixIcon: IconButton(
                      onPressed: null,
                      icon: SvgPicture.asset(userIcon),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.025),
                ElevatedButton(
                  onPressed: () {},
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

