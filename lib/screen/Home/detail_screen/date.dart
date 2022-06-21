import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// import 'kegiatan_view.dart';
// import 'navigation_drawer.dart';

class FormAddKegiatan extends StatefulWidget {
  const FormAddKegiatan({Key? key}) : super(key: key);

  @override
  _FormAddKegiatanState createState() => _FormAddKegiatanState();
}

class _FormAddKegiatanState extends State<FormAddKegiatan> {
  // final _formKey = GlobalKey<FormState>();
  // TextEditingController _nameController = TextEditingController();
  // TextEditingController _slugController = TextEditingController();
  // TextEditingController _tglController = TextEditingController();
  // TextEditingController _descriptionController = TextEditingController();
  // TextEditingController _uploadController = TextEditingController();
  // TextEditingController _ukmidController = TextEditingController();
  // // const FormAddKegiatan({Key? key}) : super(key: key);

  // Future saveKegiatan() async {
  //   final response =
  //       await http.post(Uri.parse("http://10.0.2.2:8000/api/kegiatan"), body: {
  //     "nama_kegiatan": _nameController.text,
  //     "slug": _slugController.text,
  //     "tgl_kegiatan": _tglController.text,
  //     "deskripsi": _descriptionController.text,
  //     "file": _uploadController.text,
  //     "ukm_id":_ukmidController.text,
  //   });
  //   print(response.body);
  //   return json.decode(response.body);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        backgroundColor: Color(0xDEDEDEDE),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator?.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFF22215B)),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: Color(0xFF22215B)),
          ),
          // IconButton(
          //   onPressed: () {
          //     Navigator.push(context,
          //       MaterialPageRoute(builder: (context) => const NavigationDrawer()));
          //   },
          //   icon: Icon(Icons.menu, color: Color(0xFF22215B)),
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
        // key: _formKey,
            child: Container(
            height: 2000,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Container(
                  height: 700,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Color(0xDEDEDEDE),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow:[ 
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5), //color of shadow
                          spreadRadius: 5, //spread radius
                          blurRadius: 7, // blur radius
                          offset: Offset(0, 2), // changes position of shadow
                          //first paramerter of offset is left-right
                          //second parameter is top to down
                      ),
                      //you can set more BoxShadow() here
                    ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 30),
                        Text("Tambah Kegiatan",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Padding(
                            //   padding: EdgeInsets.only(left: 10),
                            // ),
                            // TextField(
                            //   controller: _nameukm
                            // ),
                            // Text("Tanggal Kegiatan")
                            ]),
                        SizedBox(height: 5),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            // controller: _nameController,
                            decoration: InputDecoration(
                              labelText: 'Nama Kegiatan', 
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                          // controller: _slugController,
                            decoration: InputDecoration(
                              labelText: 'Slug', 
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: DateTimeField(
                              // controller: _tglController,
                              decoration: InputDecoration(labelText: "Tanggal Kegiatan"),
                              format: DateFormat('yyyy-MM-dd'),
                              onShowPicker: (BuildContext context, DateTime? currentValue) {
                                return showDatePicker(
                                    context: context,
                                    initialDate: currentValue ?? DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100));
                              },
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            // maxLines: 3,
                            // controller: _descriptionController,
                            decoration: InputDecoration(
                              labelText: 'Deskripsi', 
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            // controller: _uploadController,
                            decoration: InputDecoration(
                              labelText: 'File', 
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            // controller: _ukmidController,
                            decoration: InputDecoration(
                              labelText: 'UKM ID', 
                            ),
                          ),
                        ),

                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      ],
                    ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}