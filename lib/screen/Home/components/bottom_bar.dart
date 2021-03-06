import 'package:flutter/material.dart';
import 'package:proyek3_tutorfinder/constant.dart';
import 'package:proyek3_tutorfinder/screen/Home/home_screen.dart';
import 'package:proyek3_tutorfinder/screen/cart/cart_screen.dart';
import 'package:proyek3_tutorfinder/screen/favourite/favourite_screen.dart';
import 'package:proyek3_tutorfinder/screen/profile/profile.dart';

import 'enum.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    Key? key,
    required this.selectMenu,
  }) : super(key: key);
  final MenuState selectMenu;
//now we build favourite screen
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 2.0,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            icon: Icon(
              Icons.home_outlined,
              color: MenuState.home == selectMenu
                  ? const Color(0xff09b44d)
                  : Colors.grey,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavouriteScreen()));
            },
            icon: Icon(
              Icons.favorite_outline,
              color: MenuState.favourite == selectMenu
                  ? const Color(0xff09b44d)
                  : Colors.grey,
              size: 30,
            ),
          ),
          //after restarting our app error is solved
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartScreen()));
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: MenuState.cart == selectMenu
                  ? const Color(0xff09b44d)
                  : Colors.grey,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()));
            },
            icon: Icon(
              Icons.person_outline,
              color: MenuState.profile == selectMenu
                  ? const Color(0xff09b44d)
                  : Colors.grey,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
