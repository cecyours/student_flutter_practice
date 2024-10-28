import 'package:flutter/material.dart';
import 'package:maulesh_flutter_practice/theme_pratice/custom_theme.dart';

class ThemeUi extends StatefulWidget {
  const ThemeUi({super.key});

  @override
  State<ThemeUi> createState() => _ThemeUiState();
}

class _ThemeUiState extends State<ThemeUi> {
  late double screenHeight;
  late double screenWidth;
  int a = 0;
  bool themeMode = true;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        height: screenHeight,
        width: screenWidth,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              GestureDetector(

                child: Text.rich(
                  TextSpan(
                    text: "Pay ",
                    style: Theme.of(context).textTheme.displaySmall,
                    children: [
                      TextSpan(
                        text: " bills ,",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      TextSpan(
                          text: " rent ,  \n",
                          style: Theme.of(context).textTheme.displaySmall),
                      TextSpan(
                          text: "or buy ",
                          style:
                          Theme.of(context).textTheme.displaySmall,
                      ),
                      TextSpan(
                          text: "groceries ",
                          style: Theme.of(context).textTheme.displaySmall),
                      TextSpan(text: " .", style: TextStyle()),
                    ],
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                  "We help hard-working employees\n get ahead on their finances",
                  style: Theme.of(context).textTheme.bodyLarge, ),
              SizedBox(
                height: 450,
              ),
              FilledButton(
                onPressed: () {
                 // onChange();
                },
                child: Text(
                  "Get Started",

                ),
                style: Theme.of(context).filledButtonTheme.style,
              )
            ],
          ),
        ),
      ),
    );
  }

  void onChange() {
    // final Color= Colors.black;
    setState(() {
      if (themeMode == true) {
        themeMode = false;
      } else {
        themeMode = true;
      }
    });
  }
}
