import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'firestore.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  FireStoreQueries fireStoreQueries = FireStoreQueries();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton(onPressed: (){
              fireStoreQueries.setData();
            }, child: Text('Add')),
            FilledButton(onPressed: () async{
              await fireStoreQueries.applyQuery();
            }, child: Text('print data')),
          ],
        ),
      ),
    );
  }
}
