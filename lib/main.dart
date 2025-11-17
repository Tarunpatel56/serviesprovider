import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/bottombar/bottombar.dart';
import 'package:healthcare/home/home_page.dart';
import 'package:healthcare/login/login_page.dart';
import 'package:healthcare/onboarding/splash_screen.dart';

import 'login/create_page.dart';
import 'onboarding/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}

