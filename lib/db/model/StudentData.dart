// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:hive_flutter/hive_flutter.dart';
part 'StudentData.g.dart';
@HiveType(typeId: 1)
class StudentData {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String firstName;
  @HiveField(2)
  String lastName;
  @HiveField(3)
  String age;
  @HiveField(4)
  String profession;
  @HiveField(5)
  String? image;


  StudentData(
      {required this.firstName,
      required this.lastName,
      required this.age,
      required this.profession,
      required this.image,
      this.id});
}
