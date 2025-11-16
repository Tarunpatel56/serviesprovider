import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/login/login_page.dart';
import 'package:introduction_screen/introduction_screen.dart'
    show DotsDecorator, IntroductionScreen, PageViewModel;

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: '',
            bodyWidget: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [SizedBox(height: Get.height*0.13,),
                  Image.asset("assets/scheduling.png"),
                  Text(
                    'Easy Scheduling',
                    style: TextStyle(fontSize: 35, color: Colors.black),
                  ),
                  Text(
                    'Book Appointments with your favorite \nprofessionals in just a few taps.',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          PageViewModel(
            title: '',
            bodyWidget: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Image.asset("assets/verified.png"),
                  Text(
                    'Verified Professionals',
                    style: TextStyle(color: Colors.black, fontSize: 32),
                  ),
                  Wrap(
                    children: [
                      Text(
                        "Connect with certified and experienced\nservice providers",
                        style: TextStyle(fontSize: 18,color: Colors.grey,),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          PageViewModel(
            title: '',
            bodyWidget: SizedBox(
              height: Get.height*0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/save.png'),
                  Text(
                    'Save Your Time',
                    style: TextStyle(fontSize: 35, color: Colors.black),
                  ),
                  Text(
                    'Manage all your appointments in one place\nwith real-time updates',
                    style: TextStyle(fontSize: 18,color: Colors.grey,),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
        showSkipButton: true,
        skip: const Text("Skip"),
        next: const Text("Next"),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w700)),
        onDone: () {
          Get.offAll(LoginPage());
        },
        onSkip: () {
        Get.offAll(LoginPage());
        },
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Theme.of(context).colorScheme.secondary,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }

  // _navigateToPage(context) {
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (context) => LoginPage()),
  //   );
  // }
}
