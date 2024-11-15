import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUi extends StatefulWidget {
  const SharedPreferenceUi({super.key});

  @override
  State<SharedPreferenceUi> createState() => _SharedPreferenceState();
}

class _SharedPreferenceState extends State<SharedPreferenceUi> {
  int value=0;
  late double widthSize;
  late double heightSize;
  late SharedPreferences pref;

  @override
  void initState() {
    super.initState();
    initShared();
  }

  void initShared() async{
    pref = await SharedPreferences.getInstance();

    value = pref.getInt('key') ?? 0;
  }
  @override
  Widget build(BuildContext context) {
    widthSize = MediaQuery.of(context).size.width;
    heightSize = MediaQuery.of(context).size.height;

    return Material(
      child: Container(
        width: widthSize,
        height: heightSize,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Current value is: $value"),
              const SizedBox(height: 10),
              FilledButton(
                onPressed: () async {
                  await _incrementValue();
                },
                child: const Text("Add"),
              ),
              const SizedBox(height: 10),
              FilledButton(
                onPressed: () async {
                  await _decrementValue();
                },
                child: const Text("Decrease"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _incrementValue() async {
    value++;
    pref.setInt('key', value);
    setState(() {

    });
  }

  Future<void> _decrementValue() async {
    value--;
    pref.setInt('key', value);
    setState(() {

    });
  }
}
