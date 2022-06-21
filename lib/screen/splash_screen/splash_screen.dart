import 'package:flutter/material.dart';
import 'package:proyek3_tutorfinder/constant.dart';
import 'package:proyek3_tutorfinder/screen/registration_screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentpage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              //replace clippath to clipshadow
//images scroll
              flex: 1,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(0))),
                child: Column(
                  children: [
                    Expanded(child: Image.asset("assets/images/logo.png"))
                  ],
                ),
              )),
          Expanded(
            child: Column(
              children: [
                const Spacer(),
                const Text(
                  "Cari dan temukan mentor les privat untuk menemanimu belajar!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor),
                ),
                const Spacer(),
                //dottScrool
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => dotContainer(index: index),
                  ),
                ),
                const Spacer(),
                //Next Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    minWidth: double.infinity,
                    height: 50,
                    color: kPrimaryColor,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const Spacer(),
                //Skip Button
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

//dotContainer
  Container dotContainer({int? index}) {
    return Container(
      margin: const EdgeInsets.only(left: 5),
      height: 6,
      width: currentpage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentpage == index ? kPrimaryColor : kSecondaryColor,
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
