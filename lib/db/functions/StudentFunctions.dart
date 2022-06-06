// ignore_for_file: prefer_const_constructors, invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member, prefer_interpolation_to_compose_strings, duplicate_ignore, file_names

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:week5project/db/model/StudentData.dart';

ValueNotifier<List<StudentData>> dataList = ValueNotifier([]);
addStudentDetails(StudentData data) async {
  //dataList.value.add(data)
  final studentDB = await Hive.openBox<StudentData>('student_db');
  int idReturned = await studentDB.add(data);
  data.id = idReturned;
  // ignore: invalid_use_of_visible_for_testing_member
  dataList.notifyListeners();
}
void deleteRecord(int id) async {
  final studentDB = await Hive.openBox<StudentData>('student_db');
  await studentDB.deleteAt(id);
  getAllStudents();
  dataList.notifyListeners();
}

Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<StudentData>('student_db');
  dataList.value.clear();
  dataList.value.addAll(studentDB.values);
  dataList.notifyListeners();
}

editStudentDetails({required StudentData data, required int index}) async {
  //dataList.value.add(data)
  final studentDB = await Hive.openBox<StudentData>('student_db');
  await studentDB.putAt(index, data);
  // ignore: invalid_use_of_visible_for_testing_member
  dataList.notifyListeners();
  getAllStudents();
}


