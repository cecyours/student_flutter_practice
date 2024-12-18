import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedPaddingAndAnimatedPositioned extends StatefulWidget {
  const AnimatedPaddingAndAnimatedPositioned({super.key});

  @override
  State<AnimatedPaddingAndAnimatedPositioned> createState() =>
      _AnimatedPaddingState();
}

class _AnimatedPaddingState
    extends State<AnimatedPaddingAndAnimatedPositioned> {
  double paddingtop1 = 0;
  double paddingtop2 = 0;
  double paddingtop3 = 0;
  int randomSq = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedPadding(
                  padding: EdgeInsets.only(bottom: paddingtop1),
                  duration: Duration(seconds: 1),
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.orange,
                  )),
              AnimatedPadding(
                  padding: EdgeInsets.only(bottom: paddingtop2),
                  duration: Duration(seconds: 1),
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.orange,
                  )),
              AnimatedPadding(
                  padding: EdgeInsets.only(bottom: paddingtop3),
                  duration: Duration(seconds: 1),
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.orange,
                  )),
            ],
          ),
          // Container(
          //   height: 300,
          //   width: 300,
          //   color: Colors.yellow,
          // ),

          Column(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 680),
                  child: FilledButton(
                      onPressed: () {
                        if (paddingtop1 == 950) {
                          paddingtop1 = 0;
                        } else {
                          paddingtop1 = 950;
                        }
                        setState(() {});
                      },
                      child: const Text('Change 1')),
                ),
              ),

              // Sec button

              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(),
                  child: FilledButton(
                      onPressed: () {
                        if (paddingtop2 == 950) {
                          paddingtop2 = 0;
                        } else {
                          paddingtop2 = 950;
                        }
                        setState(() {});
                      },
                      child: const Text('Change 2')),
                ),
              ),

              // third button

              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(),
                  child: FilledButton(
                      onPressed: () {
                        if (paddingtop3 == 950) {
                          paddingtop3 = 0;
                        } else {
                          paddingtop3 = 950;
                        }
                        setState(() {});
                      },
                      child: const Text('Change 3')),
                ),
              ),

              // fourth button for multiple

              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(),
                  child: FilledButton(
                      onPressed: () {
                        randomSq = Random().nextInt(10);

                        // All will trigger
                        // randomSq = 0;

                        print('Random value is: $randomSq');
                        if (randomSq % 2 == 0) {
                          if (paddingtop1 == 950) {
                            paddingtop1 = 0;
                          } else {
                            paddingtop1 = 950;
                          }
                        }
                        if (randomSq % 3 == 0) {
                          if (paddingtop2 == 950) {
                            paddingtop2 = 0;
                          } else {
                            paddingtop2 = 950;
                          }
                        }
                        if (randomSq % 4 == 0) {
                          if (paddingtop3 == 950) {
                            paddingtop3 = 0;
                          } else {
                            paddingtop3 = 950;
                          }
                        }
                        setState(() {});
                      },
                      child: const Text('Change 4')),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
