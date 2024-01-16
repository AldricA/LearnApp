import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LearnApp/globals/providers/app_state_provider.dart';
import 'package:LearnApp/screens/home/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AppStateProvider());

    return GetMaterialApp(
      title: 'Learn App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Home()),
        // Inc routes ??
      ],
    );
  }
}
