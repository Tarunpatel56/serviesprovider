import 'package:animated_botton_navigation/animated_botton_navigation.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/appointments/appointment_model.dart';
import 'package:healthcare/appointments/my_appointments.dart';
import 'package:healthcare/home/home_page.dart';
import 'package:healthcare/profile/profile_page.dart';

class Bottombar extends StatefulWidget {

  const Bottombar({super.key,});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
   int _currentIndex = 0;

  final List<Widget> _pages = [
    Center(child: HomePage()),
    Center(child: MyAppointments()),
    Center(child: Text("data")),
    Center(child: ProfilePage()),
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: AnimatedBottomNavigation(
        height: 70,
        indicatorSpaceBotton: 25,
        icons: [
          Icons.home,
          Icons.directions_car_filled,
          Icons.person,
          Icons.person,
        ],
        currentIndex: _currentIndex,
        onTapChange: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}