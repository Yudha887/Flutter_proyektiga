import 'package:flutter/material.dart';
import 'package:proyek3_tutorfinder/screen/Home/components/sidebar.dart';

import '../../../constant.dart';
import '../../profile/profile.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, top: 10.0),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
              },
              icon: const Icon(
                Icons.menu_rounded,
              )),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.15,
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(left: 10.0),
            height: 35,
            decoration: BoxDecoration(
              color: kGrayColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(fontSize: 13),
                    decoration: const InputDecoration(
                      hintText: "Cari Mentor ?",
                      hintStyle: TextStyle(
                        fontSize: 13,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  height: 35,
                  width: 60,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(
                    Icons.search,
                    color: kWhiteColor,
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
