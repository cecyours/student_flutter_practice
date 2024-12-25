import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicOne extends StatefulWidget {
  const BasicOne({super.key});

  @override
  State<BasicOne> createState() => _BasicOneState();
}

class _BasicOneState extends State<BasicOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: FilledButton(onPressed: () {
          Navigator.push(context, maroRoute());
        }, child: Text('Navigate')),
      ),
    );
  }

  Route customRoute(){
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) => const Screen2(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {

        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeOutCirc));
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation,
        child: child);
      },
    );
  }

  Route maroRoute(){
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation)=> const Screen2(),
      transitionsBuilder: (context, animation, secondaryAnimation, child){

        final tween = Tween(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0));
        final myAnimation = animation.drive(tween);
        return SlideTransition(position: myAnimation,
          child: child,
        );
      }
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
      backgroundColor: Colors.green,
      body: Center(
        child: FilledButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('back')),
      ),
    );
  }
}
