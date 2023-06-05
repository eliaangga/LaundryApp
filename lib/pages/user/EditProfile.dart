import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login_signup/pages/landingpage/landingpage.dart';
import 'CreateOrder.dart';
import '../user/User.dart';
import 'package:http/http.dart' as http;

class EditProfile extends StatefulWidget {
  static const String id = "/editprofile";
  final User? userData;
  
  const EditProfile({super.key, required  this.userData});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
// variable untuk menyimpan data dari database nanti
  User? loggedInUser;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;
  

  Future<void> updateData() async {
    String url = 'https://candycrushlaundry.000webhostapp.com/ApiCC/update';
    http.Response response = await http.post(
      Uri.parse(url),
      body: jsonEncode(<String, String>{
        "id": widget.userData!.id,
        "nama": nameController.text,
        "username": usernameController.text,
        "jenis_kelamin": widget.userData!.gender,
        "alamat": addressController.text,
        "email": emailController.text,
        "no_telp": numberController.text,
        "password": passwordController.text
      }),
      headers: {'Content-Type': 'application/json'},
    );

      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LandingPage(userData: widget.userData),
          ),
        );
      } else {
        showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Updating data Failed'),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF6464),
        title: const Text("Edit Profile"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LandingPage(userData: widget.userData),
              ),
            );        
          },
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    buildTextField("Username", widget.userData!.username, false, usernameController, enabled: false),
                    buildTextField("Email", widget.userData!.email, false, emailController, enabled: false),
                    buildTextField("Nomor Seluler", widget.userData!.phoneNumber, false, numberController, enabled: false),
                    buildTextField("Nama Lengkap", widget.userData!.name, false, nameController, ),
                    buildMultilineTextField("Alamat", widget.userData!.address, addressController),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Change Password'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    buildTextField("New Password", "", true, passwordController),
                                    buildTextField("Confirm Password", "", true, confirmPasswordController),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text('Save'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }, 
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Ubah Password', 
                          style: TextStyle(decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LandingPage(userData: widget.userData),
                        ),
                      );       
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 2,
                        color: Colors.black,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 35,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LandingPage(userData: widget.userData),
                          ),
                        );
                      },
                      child: Text("Save", style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 2,
                        color: Colors.white
                      )),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 100, 100),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField, TextEditingController controller, {bool enabled = true}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 30),
    child: TextField(
      style: TextStyle(color: Colors.grey,),
      enabled: enabled,
      controller: controller,
      obscureText: isPasswordTextField ? isObscurePassword : false,
      decoration: InputDecoration(
        suffixIcon: isPasswordTextField
          ? IconButton(
        icon: Icon(
          isObscurePassword ? Icons.visibility : Icons.visibility_off,
          color: Colors.grey,
        ),
        onPressed: () {
          isPasswordTextField
              ? setState(() {
                  isObscurePassword = !isObscurePassword;
                })
              : null;
        },
      )
          : null,

        contentPadding: const EdgeInsets.only(bottom: 5, left:  10),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    ),
  );
}
}

Widget buildMultilineTextField(String labelText, String placeholder, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: TextField(
      style: TextStyle(color: Colors.grey,),
      maxLines: 5,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(bottom: 5, left:  10),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,
        hintStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    ),
  );
}
