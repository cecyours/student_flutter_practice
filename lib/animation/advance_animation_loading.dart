import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NestedRotation extends StatefulWidget {
  const NestedRotation({super.key});

  @override
  State<NestedRotation> createState() => _NestedRotationState();
}

class _NestedRotationState extends State<NestedRotation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Animation<double> _animation2;
  late Animation<double> _animation3;
  late Animation<double> _animation4;
  late Animation<double> _animation5;
  late Animation<double> _animation6;
  late Animation<double> _animation7;
  late Animation<double> _animation8;
  late Animation<double> _animation9;
  late Animation<double> _animation10;
  late Animation<double> _animation11;
  late Animation<double> _animation12;
  double height = 200;
  double width = 200;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
    AnimationController(vsync: this, duration: Duration(seconds: 15))
      ..repeat(reverse: true, );

    _animation = Tween<double>(begin: 10, end: 20).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    _animation2 = Tween<double>(begin: 10, end: 20).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.03, 1, curve: Curves.fastOutSlowIn),
      ),
    );
    _animation3 = Tween<double>(begin: 10, end: 20).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.05, 1, curve: Curves.fastOutSlowIn),
      ),
    );
    _animation4 = Tween<double>(begin: 10, end: 20).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.07, 1, curve: Curves.fastOutSlowIn),
      ),
    );
    _animation5 = Tween<double>(begin: 10, end: 20).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.09, 1, curve: Curves.fastOutSlowIn),
      ),
    );
    _animation6 = Tween<double>(begin: 10, end: 20).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.11, 1, curve: Curves.fastOutSlowIn),
      ),
    );
    _animation7 = Tween<double>(begin: 10, end: 20).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.13, 1, curve: Curves.fastOutSlowIn),
      ),
    );
    _animation8 = Tween<double>(begin: 10, end: 20).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.15, 1, curve: Curves.fastOutSlowIn),
      ),
    );
    _animation9 = Tween<double>(begin: 10, end: 20).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.17, 1, curve: Curves.fastOutSlowIn),
      ),
    );
    _animation10 = Tween<double>(begin: 10, end: 20).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.19, 1, curve: Curves.fastOutSlowIn),
      ),
    );
    _animation11 = Tween<double>(begin: 10, end: 20).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.21, 1, curve: Curves.fastOutSlowIn),
      ),
    );
    _animation12 = Tween<double>(begin: 10, end: 20).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.23, 1, curve: Curves.fastOutSlowIn),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: _animation,
          builder: (context, value) {
            return Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Transform.rotate(
                      angle: _animation12.value,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: height,
                          width: width,
                          color: Colors.purple.withOpacity(0.15),
                        ),
                      )),
                  Transform.rotate(

                      angle: _animation11.value,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                            height: height * 0.9,
                            width: width * 0.9,
                            color: Colors.purple.withOpacity(0.2)),
                      )),
                  Transform.rotate(
                    angle: _animation10.value,

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                          height: height * 0.8,
                          width: width * 0.8,
                          color: Colors.purple.withOpacity(0.25)),
                    ),
                  ),
                  Transform.rotate(
                    angle: _animation9.value,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                          height: height * 0.7,
                          width: width * 0.7,
                          color: Colors.purple.withOpacity(0.3)),
                    ),
                  ),
                  Transform.rotate(
                    angle: _animation8.value,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                          height: height * 0.6,
                          width: width * 0.6,
                          color: Colors.purple.withOpacity(0.35)),
                    ),
                  ),
                  Transform.rotate(
                    angle: _animation7.value,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                          height: height * 0.5,
                          width: width * 0.5,
                          color: Colors.purple.withOpacity(0.4)),
                    ),
                  ),
                  Transform.rotate(
                    angle: _animation6.value,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                          height: height * 0.4,
                          width: width * 0.4,
                          color: Colors.purple.withOpacity(0.45)),
                    ),
                  ),
                  Transform.rotate(
                    angle: _animation5.value,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                          height: height * 0.3,
                          width: width * 0.3,
                          color: Colors.purple.withOpacity(0.5)),
                    ),

                  ),
                  Transform.rotate(
                    angle: _animation4.value,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                          height: height * 0.2,
                          width: width * 0.2,
                          color: Colors.purple.withOpacity(0.65)),
                    ),
                  ),
                  Transform.rotate(
                    angle: _animation3.value,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                          height: height * 0.1,
                          width: width * 0.1,
                          color: Colors.purple.withOpacity(0.7)),
                    ),

                  ),
                  Transform.rotate(
                    angle: _animation2.value,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                          height: height * 0.07,
                          width: width * 0.07,
                          color: Colors.purple.withOpacity(0.85)),
                    ),
                  ),
                  Transform.rotate(
                    angle: _animation.value,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                          height: height * 0.03,
                          width: width * 0.03,
                          color: Colors.purple),
                    ),

                  ),
                ],
              ),
            );
          }),
    );
  }
}
