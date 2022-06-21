import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:proyek3_tutorfinder/constant.dart';
import 'package:http/http.dart' as http;
import 'package:proyek3_tutorfinder/screen/auth_services.dart';
import 'package:proyek3_tutorfinder/screen/globals.dart';
import 'package:proyek3_tutorfinder/screen/auth_services.dart';


import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  
  final _formKey = GlobalKey<FormState>();
   final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  var _confirmController = TextEditingController();

  Future<void> createAccountPressed() async {
    bool emailValid = RegExp('').hasMatch(_emailController.text);
    if (emailValid) {
      // http.Response response = await AuthServices.register(
      //     _confirmController.text,
      //     _usernameController.text,
      //     _emailController.text,
      //     _passwordController.text);
      var response = await http.post(
        Uri.parse('http://192.168.0.109:8000/api/register'),
        body: {
          "name": _nameController.text,
          "username": _usernameController.text,
          "email": _emailController.text,
          "password": _passwordController.text,
          "KOnfirmasi": _confirmController.text
        },
      );
      // print(response);
      // Map responseMap = jsonDecode(response.body);
      // Get.offAllNamed(Routes.LoginScreen);
      // if (response.statusCode == 200) {
      // } else {
      //   errorSnackBar(context, responseMap.values.first[0]);
      // }
    } else {
      errorSnackBar(context, 'Email tidak valid');
    }
  }
  // var emailTextController = TextEditingController();
  // var passwordTextController = TextEditingController();
  // var confirmpasswordTextController = TextEditingController();
  // var firstName = TextEditingController();
  // var lastName = TextEditingController();
  // bool isvisible = true;
  // bool confirmisvisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15.0),
                      decoration: BoxDecoration(
                        color: kGrayColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextFormField(
                        controller:  _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Email";
                          }
                          //now we use email validator package
                          final bool _isvalid =
                              EmailValidator.validate( _emailController.text,);
                          if (!_isvalid) {
                            return "Email was entered incorrectly";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.email_outlined),
                          hintText: "Email",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15.0),
                      decoration: BoxDecoration(
                        color: kGrayColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextFormField(
                        controller: _usernameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Username";
                          }

                          return null;
                        },
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.person_outline),
                          hintText: "Username",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15.0),
                      decoration: BoxDecoration(
                        color: kGrayColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextFormField(
                        controller: _nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Nama";
                          }

                          return null;
                        },
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.person_outline),
                          hintText: "Nama",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    //password field
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15.0),
                      decoration: BoxDecoration(
                        color: kGrayColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextFormField(
                        // obscureText: isvisible,
                        obscureText: true,
                        controller:_passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Password";
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          // suffixIcon: IconButton(
                          //   onPressed: () {
                          //     setState(() {
                          //       isvisible = !isvisible;
                          //     });
                          //   },
                          //   icon: isvisible == true
                          //       ? const Icon(Icons.visibility)
                          //       : const Icon(Icons.visibility_off),
                          //   color: isvisible == true
                          //       ? kTextGrayColor
                          //       : kPrimaryColor,
                          // ),
                          hintText: "Password",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    //confirm password field
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15.0),
                      decoration: BoxDecoration(
                        color: kGrayColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextFormField(
                        // obscureText: confirmisvisible,
                        controller: _confirmController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Password";
                          }
                          // if (_passwordController, !=
                          //     _confirmController) {
                          //   return "Password not Matched";
                          // }

                          return null;
                        },
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                var confirmController = _confirmController;
                                // _confirmController = !confirmController;
                              });
                            },
                            icon: _confirmController == true
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            color: _confirmController == true
                                ? kTextGrayColor
                                : kPrimaryColor,
                          ),
                          hintText: "Re-Enter Password",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //sign Up Button
                    MaterialButton(
                      color: kPrimaryColor,
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: 50,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already a member ?",
                          style: TextStyle(
                            color: kTextGrayColor,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: const Text(
                            "Log in",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
