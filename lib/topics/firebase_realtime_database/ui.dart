import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'backend.dart';

class FirebaseRealtimeDbUi extends StatefulWidget {
  const FirebaseRealtimeDbUi({super.key});

  @override
  State<FirebaseRealtimeDbUi> createState() => _FirebaseRealtimeDbUiState();
}

class _FirebaseRealtimeDbUiState extends State<FirebaseRealtimeDbUi> {
  FirebaseRealtimeDb fb = FirebaseRealtimeDb();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(onPressed: (){
              fb.setData(name: 'pavan');
            }, child: Text('add')),
            FilledButton(onPressed: (){
              fb.update();
            }, child: Text('update')),
          ],
        ),
      ),
    );
  }
}
