import 'package:flutter/material.dart';
import 'package:proyek3_tutorfinder/constant.dart';
import 'package:proyek3_tutorfinder/screen/Home/components/bottom_bar.dart';
import 'package:proyek3_tutorfinder/screen/Home/components/enum.dart';
import 'package:proyek3_tutorfinder/screen/Home/home_screen.dart';
import 'package:proyek3_tutorfinder/screen/registration_screens/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("My Profile",
            style: TextStyle(
              color: kTextGrayColor,
            )),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      bottomNavigationBar: const CustomBottomBar(selectMenu: MenuState.profile),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/images/profile.png",
                  height: 120,
                  width: 120,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Bintang Mahardhika",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                ButtonCard(
                  press: () {},
                  title: 'Edit Profile',
                ),
                ButtonCard(
                  press: () {},
                  title: 'Edit Kata Sandi',
                ),
                ButtonCard(
                  press: () {},
                  title: 'Mencari Mentor',
                ),
                ButtonCard(
                  press: () {},
                  title: 'Pesan',
                ),
                ButtonCard(
                  press: () {},
                  title: 'Menilai Mentor',
                ),
                ButtonCard(
                  press: () {},
                  title: 'Hasil Evaluasi',
                ),

                ElevatedButton(
          child: const Text('Keluar'),
          onPressed: () 
          async {
            // SharedPreferences pref = await SharedPreferences.getInstance();
            // perfs.remove('password');
            Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const LoginScreen(),
            ));},
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
              padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
              textStyle:
                  MaterialStateProperty.all(const TextStyle(fontSize: 15))),
        ),
               
            //       press: () {
            //         Navigator.push(
            // context,
            // MaterialPageRoute(
            //   builder: (BuildContext context) => const LoginScreen(),
            // ));
            //       },
            
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String title;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: kGrayColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 17.0),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              )
            ],
          ),
        ),
      ),
    );
  }
}
