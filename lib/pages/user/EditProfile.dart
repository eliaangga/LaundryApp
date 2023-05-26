import 'package:flutter/material.dart';
import 'CreateOrder.dart';

class EditProfile extends StatefulWidget {
  static const String id = "/editprofile";
  
  const EditProfile({super.key});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
// variable untuk menyimpan data dari database nanti

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;
  
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
            Navigator.of(context).pushNamedAndRemoveUntil(
              CreateOrder.id, (route) => false);        
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
                    buildTextField("Username", "Username", false, usernameController, enabled: false),
                    buildTextField("Email", "user@gmail.com", false, emailController, enabled: false),
                    buildTextField("Nomor Seluler", "088002280629", false, numberController, enabled: false),
                    buildTextField("Nama Lengkap", "", false, nameController, ),
                    buildMultilineTextField("Alamat", "", addressController),
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
                      Navigator.of(context).pushNamedAndRemoveUntil(
                      CreateOrder.id, (route) => false);        
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
                      onPressed: (){},
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
