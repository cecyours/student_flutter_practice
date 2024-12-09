import 'package:flutter/material.dart';
import 'package:maulesh_flutter_practice/topics/provider/provider.dart';
import 'package:provider/provider.dart';

class Ui extends StatefulWidget {
  const Ui({super.key});

  @override
  State<Ui> createState() => _UiState();
}

class _UiState extends State<Ui> {
  late double WidthSize;
  late double HeightSize;

  @override
  Widget build(BuildContext context) {
    WidthSize = MediaQuery.of(context).size.width;
    HeightSize = MediaQuery.of(context).size.height;

    return Material(
      child: Consumer<Provider1>(
        builder: (BuildContext context, Provider1 value, Widget? child) {
          return Container(
            width: WidthSize,
            height: HeightSize,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("current text is : ${value.value}"),
                  SizedBox(
                    height: 10,
                  ),
                  FilledButton(
                      onPressed: () {
                        value.add();
                      },
                      child: Text("+")),
                  SizedBox(
                    height: 10,
                  ),
                  FilledButton(
                      onPressed: () {
                        value.sub();
                      },
                      child: Text("-"))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
