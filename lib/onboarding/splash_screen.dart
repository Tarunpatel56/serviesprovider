import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/login/login_page.dart';
import 'package:healthcare/onboarding/onboarding_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Get.offAll(OnboardingPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Container(height: 170,width: 170,
      child: Image.asset("assets/logo.png")))]));
  }
}
