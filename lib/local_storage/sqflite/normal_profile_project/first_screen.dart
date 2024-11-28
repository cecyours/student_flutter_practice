import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:maulesh_flutter_practice/local_storage/sqflite/normal_profile_project/db_helper.dart';
import 'package:maulesh_flutter_practice/local_storage/sqflite/normal_profile_project/second_screen.dart';
import 'package:maulesh_flutter_practice/local_storage/sqflite/normal_profile_project/struct_model.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {


  String name = 'Mahesh';
  String add = 'Vatva';
  String bod = '18-5-2012';
  String village = 'village';
  final _dbHelper = DatabaseHelp();


  void insertProfile(){
    Struct1 load = Struct1(name: name, address: add, bod: bod, village: village);

    _dbHelper.insertProfile(load);

  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        children: [
          FilledButton(onPressed: () {
            insertProfile();
          }, child: Text("Add Now")),
          FilledButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> SecondScreen()),);
          }, child: Text("Show Profile")),
        ],
      ),
    );
  }
}
