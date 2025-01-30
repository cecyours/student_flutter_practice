import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maulesh_flutter_practice/practice/dio_sqflite_provider_firestore/dio_calling.dart';
import 'package:maulesh_flutter_practice/practice/dio_sqflite_provider_firestore/provider.dart';
import 'package:maulesh_flutter_practice/topics/app_pratice/provider/products_provider.dart';
import 'package:maulesh_flutter_practice/topics/background_service/background_service.dart';
import 'package:maulesh_flutter_practice/topics/background_service/notification_service.dart';
import 'package:maulesh_flutter_practice/topics/firebase/email_auth/splash.dart';
import 'package:maulesh_flutter_practice/topics/provider/provider.dart';
import 'package:maulesh_flutter_practice/topics/theme_pratice/professional_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  // final Fact = Store<UpdateValue>(reflectValue,
  //     initialState: UpdateValue.DefaultValue());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  // await Hive.initFlutter();
  await NotificationService.initializeNotifications();
  await BackgroundServiceManager.initializeService();
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
        ChangeNotifierProvider<GetData>(
            create: (_) => GetData(callingDio: CallingDioOrFirebase())),
        // ChangeNotifierProvider<Provider1>(create: (_) => Provider1()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        home: Splash(),
      ),
    );
  }
}
