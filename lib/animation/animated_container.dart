import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAnimatedContainer extends StatefulWidget {
  const CustomAnimatedContainer({super.key});

  @override
  State<CustomAnimatedContainer> createState() =>
      _CustomAnimatedContainerState();
}

class _CustomAnimatedContainerState extends State<CustomAnimatedContainer> {
  double height = 100;
  double width = 100;
  double opacity = 0.1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Animated Container')),
      ),
      body: Center(
        child: Column(
          children: [
            AnimatedOpacity(opacity: opacity, duration: Duration(seconds: 2), child: Container(
              height: height,
              width: width,
              color: Colors.pink,
            ),

            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.yellow,
            ),
            const SizedBox(
              height: 50,
            ),
            FilledButton(
                onPressed: () {
                  if (height == 200 && width == 200) {
                    height = 100;
                    width = 100;
                    opacity = 0.1;
                  } else {
                    height = 200;
                    width = 200;
                    opacity = 1.0;
                  }
                  setState(() {});
                },
                child: const Text('Change Height'))
          ],
        ),
      ),
    );
  }
}
