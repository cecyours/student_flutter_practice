import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Anything extends StatefulWidget {
  const Anything({super.key});

  @override
  State<Anything> createState() => _AnythingState();
}

class _AnythingState extends State<Anything>
    with SingleTickerProviderStateMixin {
  late AnimationController controller1;
  late double screenHeight;
  late double screenWidth;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller1 =
    AnimationController(vsync: this, duration: const Duration(milliseconds: 5000))..repeat(reverse: true);
    animation = Tween<double>(begin: 0, end: 700).animate(CurvedAnimation(parent: controller1, curve: Curves.easeOutQuart));

    // controller1 = AnimationController(vsync: this, duration: Duration(seconds: 2))..repeat(reverse: true);

    // animation = TweenSequence([
    //   TweenSequenceItem(tween: Tween<double>(begin: 0, end: 200), weight: 1),
    //   // TweenSequenceItem(tween: Tween<double>(begin: 200, end: 100), weight: 0.1),
    //   // TweenSequenceItem(tween: Tween<double>(begin: 100, end: 300), weight: 0.1)
    // ]).animate(CurvedAnimation(parent: controller1, curve: Curves.fastOutSlowIn));
    // controller1.forward();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // body: Stack(
      //   children: [
      //     AnimatedBuilder(
      //       animation: animation, builder: (BuildContext context, Widget? child) {
      //         return Align(
      //           // alignment: Alignment(animation.value, animation.value),
      //           child: Container(
      //             margin: EdgeInsets.only(bottom: animation.value, left: (animation.value / 10) * animation.value / 15),
      //             height: 100,
      //             width: 100,
      //             color: Colors.orange,
      //           ),
      //         );
      //     },
      //
      //     ),
      //   ],
      // ),
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? child) {
            print('test animatiomn ${animation.value}');
            return AnimatedContainer(
              margin: EdgeInsets.only(bottom: animation.value == 700 ? 0 : animation.value),
              height: animation.value == 700 ? screenHeight : 100,
              width: animation.value == 700 ? screenWidth : 100,
              color: Colors.green, duration: Duration(milliseconds: 300),
            );
            // return Container(
            //   margin: EdgeInsets.only(bottom: animation.value),
            //   height: 100,
            //   width: 100,
            //   color: Colors.orange,
            // );
          },
        ),
      ),
    );
  }
}
