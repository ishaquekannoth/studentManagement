// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:week5project/Widgets/updateScreen.dart';
import 'package:week5project/db/functions/StudentFunctions.dart';
import 'package:week5project/db/model/StudentData.dart';

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return (IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: dataList,
      builder:
          (BuildContext ctx, List<StudentData> newStudentList, Widget? child) {
        return ListView.separated(
          itemBuilder: (context, index) {
            final data = newStudentList[index];
            if (data.firstName.toLowerCase().contains(query)) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 28,
                  backgroundImage: MemoryImage(const Base64Decoder().convert(data.image.toString())),

                ),
                onTap: () {
                  close(context, null);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          UpdateScreen(data: data, index: index)));
                },
                title: Text(data.firstName),
                subtitle: Text(data.lastName),
              );
            } else {
              return Container();
            }
          },
          separatorBuilder: (ctx, index) {
            return const SizedBox();
          },
          itemCount: newStudentList.length,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: dataList,
      builder:
          (BuildContext ctx, List<StudentData> newStudentList, Widget? child) {
        return ListView.separated(
          itemBuilder: (context, index) {
            final data = newStudentList[index];
            if (data.firstName.toLowerCase().contains(query)) {
              return ListTile(
                leading:  CircleAvatar(
                  radius: 28,
                  backgroundImage: MemoryImage(const Base64Decoder().convert(data.image.toString())),
                ),
                onTap: () {
                  close(context, null);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          UpdateScreen(data: data, index: index)));
                },
                title: Text(data.firstName),
                subtitle: Text(data.lastName),
              );
            } else {
              return Container();
            }
          },
          separatorBuilder: (ctx, index) {
            return const SizedBox();
          },
          itemCount: newStudentList.length,
        );
      },
    );
  }
}
