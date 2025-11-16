import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/home/home_page.dart';
import 'package:healthcare/model/professional_model.dart';

class BookingConfirmed extends StatefulWidget {
  final profList user;
  final String? from;
  final String provider;
  final String serviceName;
  final double consultationFee;
  final String date;
  final String time;

  const BookingConfirmed({
    super.key,
    required this.user,
    this.from,
    required this.provider,
    required this.serviceName,
    required this.consultationFee,
    required this.date,
    required this.time,
  });

  @override
  State<BookingConfirmed> createState() => _BookingConfirmedState();
}

class _BookingConfirmedState extends State<BookingConfirmed> {
  double get serviceTax => widget.consultationFee * 0.09;
  double get totalAmount => widget.consultationFee + serviceTax;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
       SizedBox(height: Get.height*0.1,),
          Image.asset("assets/right.png",height: Get.height*0.2,),
          Text(
            "Booking Confirmed!",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          Text(
            "Your Appointment has been successfully\nbook",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today_outlined, size: 55),
            title: Text(
              "Appointment Deatails",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Booking ID:#0001",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
          Divider(),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "provider",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              widget.provider,
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),

          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  Text(
                    widget.date,
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(width: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Time",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  Text(
                    widget.time,
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "service",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Regular Consultantion",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total paid",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              Text(
                "\$${totalAmount.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ],
          ),
     SizedBox(width:Get.width*0.9,
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              label: Text(
                "Add To Calendar",
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(Icons.calendar_today_outlined, color: Colors.white),
            ),
          ),
 SizedBox(width:Get.width*0.9,
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              label: Text("Download Receipt"),
              icon: Icon(Icons.file_download_outlined),
            ),
          ),
     SizedBox(width:Get.width*0.9,
            child: ElevatedButton.icon(
              onPressed: () {
                Get.offAll(BottomAppBar());
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              label: Text("Back to Home"),
              icon: Icon(Icons.home),
            ),
          ),
        ],
      ),
    );
  }
}
