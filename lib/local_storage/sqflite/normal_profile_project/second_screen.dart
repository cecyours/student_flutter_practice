import 'package:flutter/material.dart';
import 'package:maulesh_flutter_practice/local_storage/sqflite/normal_profile_project/db_helper.dart';
import 'package:maulesh_flutter_practice/local_storage/sqflite/normal_profile_project/struct_model.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  Struct1? profile;
  final _dbHelper = DatabaseHelp();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfile();
  }//
  @override
  Widget build(BuildContext context) {
    return Material(


      child: Column(
        children: [
          SizedBox(height: 350,),
          Text("Name is: ${profile?.name ?? 'Loading...'}"),
          Text("Address is: ${profile?.address ?? 'Loading...'}"),
          Text("Bod is: ${profile?.bod ?? 'Loading...'}"),
          Text("Village name is: ${profile?.village ?? 'Loading...'}"),
        ],
      ),
    );
  }

  void getProfile() async {
    try {
      // Fetch profile data from the database
      Struct1? fetchedProfile = await _dbHelper.getProfile();

      // Update the state with the fetched data
      setState(() {
        profile = fetchedProfile;
      });
    } catch (e) {
      // Handle errors (optional)
      debugPrint("Error fetching profile: $e");
    }
  }
}

