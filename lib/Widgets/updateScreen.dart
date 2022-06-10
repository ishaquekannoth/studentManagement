// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:week5project/Widgets/EditData.dart';
import 'package:week5project/db/model/StudentData.dart';

class UpdateScreen extends StatelessWidget {
 final  StudentData data;
  final int index;
  const UpdateScreen({required this.data,required this.index});
  
  @override
  Widget build(BuildContext context) {
    {
      return (Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text('Details For ${data.firstName} is ')),
        body: Center(
          child: (Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              CircleAvatar(radius: 60,backgroundImage: MemoryImage(Base64Decoder().convert(data.image.toString())),),

                SizedBox(height: 10,),

              Card(
                semanticContainer: true,
                shadowColor: Colors.blue,
                child: Text(data.firstName,style: TextStyle(fontSize: 30)),
              ),
               Card(
                child: Text(data.lastName,style: TextStyle(fontSize: 30)),
              ),
            
              Text(style: TextStyle(fontSize: 30), 'Age : ${data.age}'),
               Card(
                child: Text(data.profession,style: TextStyle(fontSize: 30)),
              ),
                  // ignore: unnecessary_this
                  ElevatedButton(onPressed:()=>goHome(context, this.data, index),child:Text('Edit'))
            ],
          )),
        ),
      ));
    }
  }

void goHome(BuildContext context,StudentData data,int index) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: ((context) {
    return (EditData(data: data,index: index,));
  })), (route) => false);
}
}
