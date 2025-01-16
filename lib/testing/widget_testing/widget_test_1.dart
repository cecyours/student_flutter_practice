import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_practice/testing/widget_testing/counter.dart';

import 'counter.dart';

class WidgetTest1 extends StatefulWidget {
  const WidgetTest1({super.key});

  @override
  State<WidgetTest1> createState() => _WidgetTest1State();
}

class _WidgetTest1State extends State<WidgetTest1> {
  int counter = 0;  // Counter to increment
  Counter counterrr = Counter();

  void add(){
    counterrr.add();

    setState(() {
      counter = counterrr.value;
    });

  }

  // void subtract(){
  //   counterrr.minus();
  //
  //   setState(() {
  //     counter = counterrr.value;
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  Scaffold(
        body: Center(
          child: Text('$counter', style: TextStyle(fontSize: 20),),
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(onPressed: add,child: Icon(Icons.add),),
            SizedBox(height: 20,),
            // FloatingActionButton(onPressed: subtract,child: Icon(Icons.remove),),
          ],
        ),
      
      ),
    );
  }
}
