import 'package:flutter/material.dart';
import 'package:maulesh_flutter_practice/cupertino_gesture_pratice/screen.dart';
import 'package:maulesh_flutter_practice/provider/provider.dart';
import 'package:maulesh_flutter_practice/provider/ui.dart';
import 'package:maulesh_flutter_practice/theme_pratice/professional_theme.dart';
import 'package:provider/provider.dart';

import 'app_pratice/provider/products_provider.dart';

void main() {
  // final Fact = Store<UpdateValue>(reflectValue,
  //     initialState: UpdateValue.DefaultValue());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final Store<UpdateValue> Fact;

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
            create: (_) => ProductProvider()),
        ChangeNotifierProvider<Provider1>(create: (_) => Provider1()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        home: Ui(),
      ),
    );
  }
}
