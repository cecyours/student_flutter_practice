import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgainPractice extends StatefulWidget {
  const AgainPractice({super.key});

  @override
  State<AgainPractice> createState() => _AgainPracticeState();
}

class _AgainPracticeState extends State<AgainPractice>
    with SingleTickerProviderStateMixin {
  late double screenWidth;
  late double screenHeight;

  late Animation<double> animation;
  late AnimationController controller1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller1 =
        AnimationController(vsync: this, duration:  Duration(seconds: 1))..repeat(reverse: true);
    animation = Tween<double>(begin: 500, end: 600).animate(CurvedAnimation(parent: controller1, curve: Curves.easeOutQuart));
   //
   // controller1.forward();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Material(
        child: Center(
          child: AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget? child) {

              print(animation.value);

              return Container(
                color: Colors.green,
                child: Container(
                  margin: EdgeInsets.only(bottom: animation.value),
                  width: 100,
                  height: 100,
                  color: Colors.green,
                  child: Center(child: const Text('data')),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
