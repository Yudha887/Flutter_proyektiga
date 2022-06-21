import 'package:flutter/material.dart';
import 'package:proyek3_tutorfinder/constant.dart';
import 'package:proyek3_tutorfinder/model/mentor_model.dart';
import 'package:proyek3_tutorfinder/screen/Home/detail_screen/detail_screen.dart';

class MentorCard extends StatelessWidget {
  const MentorCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: listMentor.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          itemBuilder: (context, index) => ListMentor(
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreen(
                                mentorDetail: listMentor[index],
                              )));
                },
                product: listMentor[index],
              )),
    );
  }
}

class ListMentor extends StatelessWidget {
  const ListMentor({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);
  final Mentor product;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: kSecondaryColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.image),
            Text(
              product.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                const Spacer(),
                const SizedBox(
                  height: 10.0,
                ),
                const Icon(
                  Icons.star,
                  size: 20,
                  color: kPrimaryColor,
                ),
                Text(
                  "${product.rating}",
                  style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 14,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
