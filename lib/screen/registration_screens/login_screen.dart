
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:email_validator/email_validator.dart';
import 'package:proyek3_tutorfinder/constant.dart';
import 'package:proyek3_tutorfinder/screen/Home/home_screen.dart';
import 'package:proyek3_tutorfinder/screen/auth_services.dart';
import 'package:proyek3_tutorfinder/screen/globals.dart';
import 'package:proyek3_tutorfinder/screen/registration_screens/forgot_password.dart';
import 'package:proyek3_tutorfinder/screen/registration_screens/signup_screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

// now it is responsive
//now we make our app home screen
class _LoginScreenState extends State<LoginScreen> {


  String _username = '';
  String _password = '';
  
  loginPressed() async {
    if (_username.isNotEmpty && _password.isNotEmpty) {
      http.Response response = 
          // Harus diubah dengan sama pada auth_services.dart
          await AuthServices.login(_username, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen(),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first);
      }
    } else {
      errorSnackBar(context, 'enter all required fields');
    }
  }


  bool _isHidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: Text(
          "Halaman Login",
          style: TextStyle(color: kWhiteColor),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          SizedBox(height: 20),
          Center(
            child: Text(
              "Mentor Qu",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Text(
              "Find Your Desired Mentor",
              style: TextStyle(
                color: Color.fromARGB(255, 63, 63, 63),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 45),
          Container(
            alignment: Alignment.topCenter,
            height: 200,
            child: Image.asset(
              "assets/images/hitam.png",
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 25),
          Text(
            "Username:",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          TextFormField(
            keyboardType: TextInputType.text,
            autocorrect: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: kSecondaryColor,
              hintText: "Username",
            ),
            onChanged: (value) {
              _username = value;
            },
          ),
          SizedBox(height: 25),
          Text(
            "Password:",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          TextFormField(
            obscureText: _isHidePassword,
            autofocus: false,
            initialValue: '',
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintText: "Enter your Password",
              filled: true,
              fillColor: kSecondaryColor,
              suffixIcon: GestureDetector(
                onTap: () {
                  _togglePasswordVisibility();
                },
                child: Icon(
                  _isHidePassword ? Icons.visibility_off : Icons.visibility,
                  color: _isHidePassword
                      ? Color.fromARGB(255, 63, 63, 63)
                      : kPrimaryColor,
                ),
              ),
              isDense: true,
            ),
            onChanged: (value) {
              _password = value;
            },
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () => loginPressed(),
            child: Text(
              "MASUK",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: kPrimaryColor,
              fixedSize: Size(150, 50),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
            ),
          ),
    //       WidgetsFlutterBinding.ensureInitialized();
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var password = prefs.getString('password');
    // print(password);
    // runApp(MaterialApp(home: password == null ? HomeScreen()() : LoginScreen()));
        ],
      ),
      
    );
  }
}


//   @override
//   Widget build(BuildContext context) {
//     Size _size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: kWhiteColor,
//       body: SafeArea(
//         child: SizedBox(
//           width: double.infinity,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: _size.height * 0.1,
//                   ),
//                   const Text(
//                     "Log in",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   const TextFields(),
//                   SizedBox(
//                     height: _size.height * 0.1,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text(
//                         "Not a member ?",
//                         style: TextStyle(
//                           color: kTextGrayColor,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const SignUpScreen()));
//                         },
//                         child: const Text(
//                           "Join now",
//                           style: TextStyle(
//                               color: kPrimaryColor,
//                               fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: _size.height * 0.1,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class TextFields extends StatefulWidget {
//   const TextFields({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<TextFields> createState() => _TextFieldsState();
// }

// class _TextFieldsState extends State<TextFields> {
//   final _formKey = GlobalKey<FormState>();
//   var emailTextController = TextEditingController();
//   var passwordTextController = TextEditingController();
//   bool isvisible = true;
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           //email
//           Container(
//             padding: const EdgeInsets.only(left: 15.0),
//             decoration: BoxDecoration(
//               color: kGrayColor,
//               borderRadius: BorderRadius.circular(50),
//             ),
//             child: TextFormField(
//               controller: emailTextController,
//               keyboardType: TextInputType.emailAddress,
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return "Enter Email";
//                 }
//                 //now we use email validator package
//                 final bool _isvalid =
//                     EmailValidator.validate(emailTextController.text);
//                 if (!_isvalid) {
//                   return "Email was entered incorrectly";
//                 }
//                 return null;
//               },
//               decoration: const InputDecoration(
//                 suffixIcon: Icon(Icons.email_outlined),
//                 hintText: "Email",
//                 enabledBorder: InputBorder.none,
//                 focusedBorder: InputBorder.none,
//               ),
//             ),
//           ),
//           //password field
//           const SizedBox(
//             height: 20,
//           ),
//           Container(
//             padding: const EdgeInsets.only(left: 15.0),
//             decoration: BoxDecoration(
//               color: kGrayColor,
//               borderRadius: BorderRadius.circular(50),
//             ),
//             child: TextFormField(
//               obscureText: isvisible,
//               controller: passwordTextController,
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return "Enter Password";
//                 }

//                 return null;
//               },
//               decoration: InputDecoration(
//                 suffixIcon: IconButton(
//                   onPressed: () {
//                     setState(() {
//                       isvisible = !isvisible;
//                     });
//                   },
//                   icon: isvisible == true
//                       ? const Icon(Icons.visibility)
//                       : const Icon(Icons.visibility_off),
//                   color: isvisible == true ? kTextGrayColor : kPrimaryColor,
//                 ),
//                 hintText: "Password",
//                 enabledBorder: InputBorder.none,
//                 focusedBorder: InputBorder.none,
//               ),
//             ),
//           ),
//           //forgot button
//           TextButton(
//             onPressed: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const ForgotPassword()));
//             },
//             child: const Text(
//               "Forgot Password ?",
//               style: TextStyle(
//                   fontSize: 14,
//                   color: kPrimaryColor,
//                   fontWeight: FontWeight.w600),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           //login button
//           MaterialButton(
//             color: kPrimaryColor,
//             minWidth: double.infinity,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(50),
//             ),
//             height: 50,
//             onPressed: () {
//               if (_formKey.currentState!.validate()) {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const HomeScreen()));
//               }
//             },
//             child: const Text(
//               "Login",
//               style: TextStyle(
//                 color: kWhiteColor,
//                 fontSize: 16,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
