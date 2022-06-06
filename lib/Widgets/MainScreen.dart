// ignore_for_file: prefer_const_constructors, file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:week5project/Widgets/searchDelegate.dart';
import 'package:week5project/Widgets/updateScreen.dart';
import 'package:week5project/db/functions/StudentFunctions.dart';
import 'package:week5project/db/model/StudentData.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      appBar: AppBar(
        title: Text('Click to Search'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Search());
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: ValueListenableBuilder(
          valueListenable: dataList,
          builder:
              (BuildContext ctx, List<StudentData> studData, Widget? child) {
            return (ListView.separated(
                itemBuilder: ((context, index) {
                  final data = studData[index];
                  return ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return UpdateScreen(data: data, index: index);
                      }));
                    },
                    title: Text(data.firstName),
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      backgroundImage: MemoryImage(
                        Base64Decoder().convert(data.image.toString())
                      ), 
                    ),
                    subtitle: Text(data.lastName),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        deleteRecord(index);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(20),
                          backgroundColor: Colors.red,
                          content: Text(
                            'Removed Successfully',
                            textAlign: TextAlign.center,
                          ),
                          duration: Duration(seconds: 2),
                        ));
                      },
                    ),
                  );
                }),
                separatorBuilder: (ctx, indx) {
                  return const Divider();
                },
                itemCount: studData.length));
          }),
    );
  }
}
