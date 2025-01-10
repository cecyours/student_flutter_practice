import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetTest1 extends StatefulWidget {
  const WidgetTest1({super.key});

  @override
  State<WidgetTest1> createState() => _WidgetTest1State();
}

class _WidgetTest1State extends State<WidgetTest1> {
  int counter = 0;  // Counter to increment

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              counter++;  // Increment the counter on tap
            });
          },
          child: Text('$counter'),  // Display the counter value
        ),
      ),
    );
  }
}
