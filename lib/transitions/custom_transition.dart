import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen A')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(_customPageRoute(ScreenB()));
          },
          child: Text('Go to Screen B'),
        ),
      ),
    );
  }

  PageRouteBuilder _customPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return CustomTransition(animation: animation, child: child);
      },
    );
  }


}

class ScreenB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen B')),
      body: Center(
        child: Text('Welcome to Screen B!'),
      ),
    );
  }
}


class CustomTransition extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  CustomTransition({required this.animation, required this.child});

  @override
  Widget build(BuildContext context) {
    // Custom animation logic
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        // Apply both slide and fade effects
        final offset = Offset(1.0 - animation.value, 1.0 - animation.value); // Diagonal slide
        final opacity = animation.value; // Fade effect

        return Transform.translate(
          offset: Offset(offset.dx * 300, offset.dy * 300), // Adjust scale as needed
          child: Opacity(opacity: opacity, child: child),
        );
      },
      child: child,
    );
  }
}