import 'package:flutter/material.dart';
import 'package:proyek3_tutorfinder/constant.dart';
import 'package:proyek3_tutorfinder/model/mentor_model.dart';
import 'package:proyek3_tutorfinder/screen/Home/components/bottom_bar.dart';
import 'package:proyek3_tutorfinder/screen/Home/components/enum.dart';
import 'package:proyek3_tutorfinder/screen/cart/cart_screen.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';


class DetailScreen extends StatefulWidget {
  final Mentor mentorDetail;
  const DetailScreen({Key? key, required this.mentorDetail}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();

    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor.withOpacity(0.3),
        title: Text(widget.mentorDetail.title,
            style: const TextStyle(
              color: kTextGrayColor,
            )),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      bottomNavigationBar: const CustomBottomBar(selectMenu: MenuState.home),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.3),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  )),
              child: Image.asset(
                widget.mentorDetail.image,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: Column(
                children: [
                  Text(widget.mentorDetail.description,
                      style: TextStyle(
                        color: Colors.green[800],
                        fontSize: 15,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.mentorDetail.title2,
                        style: const TextStyle(
                            color: kTextGrayColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
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
                        "${widget.mentorDetail.rating}",
                        style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                   SizedBox(height: 5),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: DateTimeField(
                              // controller: _tglController,
                              decoration: InputDecoration(labelText: "Pilih Tanggal"),
                              format: DateFormat('yyyy-MM-dd'),
                              onShowPicker: (BuildContext context, DateTime? currentValue) {
                                return showDatePicker(
                                    context: context,
                                    initialDate: currentValue ?? DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100));
                              },
                          ),
                        ),ElevatedButton(
          child: const Text('Pesan Mentor'),
          onPressed: () 
          async {
            // SharedPreferences pref = await SharedPreferences.getInstance();
            // perfs.remove('password');
            Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const CartScreen(),
            ));},
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(kPrimaryColor),
              padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
              textStyle:
                  MaterialStateProperty.all(const TextStyle(fontSize: 15))),
        ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

 
}
