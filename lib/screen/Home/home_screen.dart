import 'package:flutter/material.dart';
import 'package:proyek3_tutorfinder/constant.dart';
import 'package:proyek3_tutorfinder/screen/Home/components/bottom_bar.dart';
import 'package:proyek3_tutorfinder/screen/Home/components/custom_appbar.dart';
import 'package:proyek3_tutorfinder/screen/Home/components/enum.dart';
import 'package:proyek3_tutorfinder/screen/Home/components/mentor_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      bottomNavigationBar: const CustomBottomBar(
        selectMenu: MenuState.home,
      ),
      body: SafeArea(
        child: ListView(
          children: const [
            //appbar
            CustomAppbar(),
            SizedBox(
              height: 20,
            ),
            //CategoryCard(),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Find Your Desired\nMentor",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            //now we create model of our app food products and we import all images
            MentorCard(),
          ],
        ),
      ),
    );
  }
}
