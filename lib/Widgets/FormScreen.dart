// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, file_names

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:week5project/db/functions/StudentFunctions.dart';
import 'package:week5project/db/model/StudentData.dart';

class FormScreen extends StatefulWidget {
  FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _nameController = TextEditingController();

  final _ageController = TextEditingController();

  final _lastnameController = TextEditingController();

  final _professionController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              pickimage();
            },
            child: pathEncoded.isEmpty ? CircleAvatar(
              radius: 60,
              backgroundColor: Color.fromARGB(255, 77, 7, 2),
            ) : CircleAvatar(
              radius: 60,
              backgroundImage: MemoryImage(Base64Decoder().convert(pathEncoded)),
            ) ,
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: (BorderRadius.all(Radius.circular(25)))),
                hintText: 'Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Invalid Data';
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _lastnameController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: (BorderRadius.all(Radius.circular(25)))),
                hintText: 'Last Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Invalid Data';
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _ageController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: (BorderRadius.all(Radius.circular(25)))),
                hintText: 'Age'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Invalid Data';
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _professionController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: (BorderRadius.all(Radius.circular(25)))),
                hintText: 'Profession'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Invalid Data';
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 15),
          ElevatedButton.icon(
              onPressed: () {
                formKey.currentState!.validate();
                submitItems();
                clearContollers();
              },
              icon: (Icon(Icons.add)),
              label: Text('ADD'))
        ],
      ),
    );
  }

  void submitItems() {
    String firstName = _nameController.text.trim();
    String lastName = _lastnameController.text.trim();
    String age = _ageController.text.trim();
    String profession = _professionController.text.trim();

    if (firstName.isEmpty ||
        lastName.isEmpty ||
        age.isEmpty ||
        profession.isEmpty) {
      return;
    } else {
      addStudentDetails(StudentData(
          firstName: firstName,
          lastName: lastName,
          age: age,
          profession: profession,
          image: pathEncoded));

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(20),
        backgroundColor: Color.fromARGB(255, 3, 6, 180),
        content: Text(
          'Added Successfully',
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 2),
      ));
    }
  }

  void clearContollers() {
    _ageController.clear();
    _nameController.clear();
    _lastnameController.clear();
    _professionController.clear();
  }

  String pathEncoded = '';
  pickimage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final bytes = File(image!.path).readAsBytesSync();
    pathEncoded = base64Encode(bytes);
    setState(() {});
  }
}
