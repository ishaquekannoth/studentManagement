// ignore_for_file: prefer_const_constructors, file_names, use_key_in_widget_constructors, must_be_immutable

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:week5project/Widgets/WelcomeScreen.dart';
import 'package:week5project/db/model/StudentData.dart';

import '../db/functions/StudentFunctions.dart';

class EditData extends StatefulWidget {
  StudentData data;
  int index;
  EditData({required this.data, required this.index});

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  final _nameController = TextEditingController();

  final _lastnameController = TextEditingController();

  final _ageController = TextEditingController();

  final _professionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = widget.data.firstName;
    _lastnameController.text = widget.data.lastName;
    _ageController.text = widget.data.age;
    _professionController.text = widget.data.profession;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Text('Edit your Details Here'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                pickimage();
              },
              child: pathEncoded.isEmpty? CircleAvatar(
                radius: 60,
                backgroundImage: MemoryImage(
                    Base64Decoder().convert(widget.data.image.toString())),
              ):CircleAvatar(
                radius: 60,backgroundImage: MemoryImage(Base64Decoder().convert(pathEncoded)),
              )    ,

            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: (BorderRadius.all(Radius.circular(25)))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _lastnameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: (BorderRadius.all(Radius.circular(25)))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _ageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: (BorderRadius.all(Radius.circular(25)))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _professionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: (BorderRadius.all(Radius.circular(25)))),
              ),
            ),
            ElevatedButton.icon(
                onPressed: () {
                  confirmChanges();
                  goHome(context);
                },
                icon: Icon(Icons.done),
                label: Text('Confirm'))
          ],
        ));
  }

  void confirmChanges() {
    String firstName = _nameController.text.trim();
    String lastName = _lastnameController.text.trim();
    String age = _ageController.text.trim();
    String profession = _professionController.text.trim();
    StudentData data = StudentData(
        firstName: firstName,
        lastName: lastName,
        age: age,
        profession: profession,
        image: pathEncoded);

    if (firstName.isEmpty ||
        lastName.isEmpty ||
        age.isEmpty ||
        profession.isEmpty) {
      return;
    } else {
      editStudentDetails(data: data, index: widget.index);
    }
  }

  String pathEncoded = '';
  pickimage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final bytes = File(image!.path).readAsBytesSync();
    pathEncoded = base64Encode(bytes);
    setState(() {});
  }
}

void goHome(BuildContext context) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: ((context) {
    return (WelcomeScreen());
  })), (route) => false);
}
