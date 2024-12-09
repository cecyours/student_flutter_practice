import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
<<<<<<< HEAD
import 'package:maulesh_flutter_practice/practice/dio_sqflite_provider/ui.dart';
import 'package:maulesh_flutter_practice/topics/app_pratice/provider/products_provider.dart';
import 'package:maulesh_flutter_practice/topics/local_storage/sqflite/maulesh/ui_2.dart';
import 'package:maulesh_flutter_practice/topics/provider/provider.dart';
import 'package:maulesh_flutter_practice/topics/theme_pratice/professional_theme.dart';
import 'package:provider/provider.dart';

=======
import 'package:maulesh_flutter_practice/cupertino_gesture_pratice/screen.dart';
import 'package:maulesh_flutter_practice/local_storage/sqflite/maulesh/ui_2.dart';
import 'package:maulesh_flutter_practice/provider/provider.dart';
import 'package:maulesh_flutter_practice/provider/ui.dart';
import 'package:maulesh_flutter_practice/theme_pratice/professional_theme.dart';
import 'package:provider/provider.dart';

import 'app_pratice/provider/products_provider.dart';
import 'local_storage/hive.dart';
import 'local_storage/shared_preference.dart';
import 'local_storage/sqflite/ui.dart';

>>>>>>> origin/master
void main() async {
  // final Fact = Store<UpdateValue>(reflectValue,
  //     initialState: UpdateValue.DefaultValue());
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
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
        home: Goodui(),
      ),
    );
  }
}
