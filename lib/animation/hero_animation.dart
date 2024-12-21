import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroAnimation extends StatefulWidget {
  const HeroAnimation({super.key});

  @override
  State<HeroAnimation> createState() => _HeroAnimationState();
}

class _HeroAnimationState extends State<HeroAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'hero',
          child: Material(
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const HeroAnimation2()));
              },
              child: Container(
                height: 100,
                width: 100,
                color: Colors.orange,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeroAnimation2 extends StatefulWidget {
  const HeroAnimation2({super.key});

  @override
  State<HeroAnimation2> createState() => _HeroAnimation2State();
}

class _HeroAnimation2State extends State<HeroAnimation2> {
  late double screenHeight;
  late double screenWidth;

  @override
  Widget build(BuildContext context) {

    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.pink,
      body: Hero(
        tag: 'hero',
        child: Material(
          child: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              height: screenHeight * 0.3,
              width: screenWidth,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}

