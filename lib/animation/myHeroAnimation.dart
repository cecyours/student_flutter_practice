import 'package:flutter/material.dart';

class MyHero extends StatefulWidget {
  const MyHero({super.key});

  @override
  State<MyHero> createState() => _MyHeroState();
}

class _MyHeroState extends State<MyHero> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'Hero-cho',
          child: Material(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Screen2()));
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.orange,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: "Hero-cho",
          child: Material(
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                height: 800,
                width: 800,
                color: Colors.pink,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
