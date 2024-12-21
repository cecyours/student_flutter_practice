import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter{

  final double radius;
  final double substractValue;

  MyCustomPainter({required this.radius, required this.substractValue});

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()..color = Colors.redAccent..strokeWidth = 4..style = PaintingStyle.fill;

    print('height is ${size.height}');
    print('width is ${size.width}');


    canvas.drawCircle(Offset(size.height / 2, size.width - substractValue), radius, paint);

  }

  @override
  bool shouldRepaint(covariant MyCustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    print('is this true $radius');
    // if(oldDelegate.radius != radius){
    //
    //   return true;
    // }else{
    //   return false;
    // }
    return false;
  }

}

class BasicCustomPainter extends StatefulWidget {
  const BasicCustomPainter({super.key});

  @override
  State<BasicCustomPainter> createState() => _BasicCustomPainterState();
}

class _BasicCustomPainterState extends State<BasicCustomPainter> {

  double radius = 50;
  double substractValue = 2;
  double height = 600;
  double width = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height,
              width: width,
              color: Colors.green,
              child: Center(
                child: CustomPaint(
                  willChange: true,
                  painter: MyCustomPainter(radius: radius, substractValue: substractValue),
                  size: Size(height, width),
                ),
              ),
            ),

            const SizedBox(height: 100,),
            FilledButton(onPressed: (){
              setState(() {
                if(radius == 50){
                  radius = 90;
                }else{
                  radius = 50;
                }
              });
            }, child: const Text('change')),
            FilledButton(onPressed: (){
              setState(() {
                if(substractValue == 2){
                  substractValue = height * 0.7;
                }else{
                  substractValue = 2;
                }
              });
            }, child: const Text('change 2'))
          ],
        ),
      ),
    );
  }
}
