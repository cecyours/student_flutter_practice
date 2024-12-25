import 'package:flutter/material.dart';

class MyPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      Paint paint = Paint()..strokeWidth = 4..color = Colors.red;

      canvas.drawLine(Offset(size.width, size.height), Offset(10, 10), paint);
      canvas.drawLine(Offset(0 , size.height), Offset(300, 10), paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

}
class BasicLines extends StatefulWidget {
  const BasicLines({super.key});

  @override
  State<BasicLines> createState() => _BasicLinesState();
}

class _BasicLinesState extends State<BasicLines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Material(
          child: Center(
            child: Container(
              width: 300,
              height: 300,
              color: Colors.orange,
              child: CustomPaint(
                size: Size(300, 300),
                    painter: MyPainter(),
              ),
            ),

          ),
        ),
    );
  }
}
