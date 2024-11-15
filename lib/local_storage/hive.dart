import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HivePractice extends StatefulWidget {
  const HivePractice({super.key});

  @override
  State<HivePractice> createState() => _HivePracticeState();
}

class _HivePracticeState extends State<HivePractice> {
  late double widthSize;
  late double heightSize;

  int value = 0;
  late Box<int> box; // Declare the box for reuse

  @override
  void initState() {
    super.initState();
    _initializeHive();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  Future<void> _initializeHive() async {
    box = await Hive.openBox<int>('myBox');
    value = box.get('key') ?? 0;
    setState(() {});
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
    await box.put('key', value);
    setState(() {});
  }

  Future<void> _decrementValue() async {
    value--;
    await box.put('key', value);
    setState(() {});
  }


}
