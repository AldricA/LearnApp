import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:LearnApp/screens/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.black38),
  );

  // Initialisation de SharedPreferences
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  Get.put(prefs); // SharedPreferences globaly

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Birthday App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      // Next Routes?
      // getPages: [
      //   GetPage(name: '/', page: () => Home()),
      //   // Incoming routes?
      // ],
    );
  }
}
