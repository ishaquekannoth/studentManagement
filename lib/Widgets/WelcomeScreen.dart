// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:week5project/Widgets/FormScreen.dart';
import 'package:week5project/Widgets/MainScreen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  
  int _selectedIndex = 0;
  final _pages = [
    MainScreen(),
     FormScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (ind) {
        setState(() {
          _selectedIndex = ind;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'AddData'),
             
      ],
    ));
  }

void goHome(BuildContext context) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: ((context) {
    return (WelcomeScreen());
  })), (route) => false);
}






}