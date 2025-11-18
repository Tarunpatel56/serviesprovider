// lib/appointments/my_appointments.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/appointments/appintment_Controller.dart';
import 'package:healthcare/home/detail_page.dart';
import 'package:healthcare/home/message_page.dart';
import 'package:healthcare/messagelist/message_model.dart';
import 'package:healthcare/model/professional_model.dart';

import 'appointment_model.dart';
import 'package:healthcare/utils/text_utils.dart';
import 'package:healthcare/utils/color_util.dart';

class MyAppointments extends StatelessWidget {
  MyAppointments({super.key});

  // Put controller
  final AppointmentsController ctrl = Get.put(AppointmentsController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          actionsPadding: EdgeInsets.all(10),
          elevation: 10,
          toolbarHeight: 100,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Appointments',
                style: AppTextStyles.subHeadingTextStyle2.copyWith(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Track and manage your bookings',
                style: AppTextStyles.headingTextStyle2.copyWith(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Material(
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,

                    indicatorColor: Colors.transparent,

                    indicator: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: AppColors.primary,
                    tabs: [
                      Tab(text: "Upcoming"),
                      Tab(text: "Past"),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: TabBarView(
                  children: [
                    Obx(() {
                      final list = ctrl.upcoming;
                      if (list.isEmpty) {
                        return Center(child: Text('No upcoming appointments'));
                      }
                      return ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        itemCount: list.length,
                        separatorBuilder: (_, __) => SizedBox(height: 8),
                        itemBuilder: (context, index) {
                          return _appointmentCard(
                            list[index],
                            isUpcoming: true,
                          );
                        },
                      );
                    }),

                    // PAST
                    Obx(() {
                      final list = ctrl.past;
                      if (list.isEmpty) {
                        return Center(child: Text('No past appointments'));
                      }
                      return ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        itemCount: list.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                        itemBuilder: (context, index) {
                          return _appointmentCard(
                            list[index],
                            isUpcoming: false,
                          );
                        },
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appointmentCard(AppointmentModel data, {required bool isUpcoming}) {
    return InkWell(
      onTap: () { final profList provider = profList(
    image: data.image,         // assuming AppointmentModel has image
    tittle: data.tittle,       // provider name
    subtittle: data.catg,      // category or subtitle
     // if profList has price field
    about: data.perps,         // map purpose/description
// optional
    // add other fields as needed by your profList constructor
  );

        Get.to(DetailPage(user: provider , index: data));
      },

      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0.6,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // status + booking id row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Confirmed',
                    style: const TextStyle(color: Colors.green),
                  ),
                  Text(
                    'Booking ID: #${data.bookingid ?? ''}',
                    style: const TextStyle(color: Colors.black54),
                  ),
                ],
              ),
              Divider(),

              SizedBox(height: 8),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: Get.height * 0.08,
                    width: Get.width * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(data.image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.tittle ?? '',
                          style: AppTextStyles.headingTextStyle4,
                        ),
                        SizedBox(height: 4),
                        Text(
                          data.catg ?? '',
                          style: AppTextStyles.headingTextStyle2,
                        ),
                        SizedBox(height: 6),
                        Text(
                          data.perps ?? '',
                          style: AppTextStyles.headingTextStyle2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12),

              Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 16,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 6),
                  Text(data.date ?? ''),
                  SizedBox(width: 30),
                  Icon(
                    Icons.watch_later_outlined,
                    size: 16,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 6),
                  Text(data.time ?? ''),
                ],
              ),

              SizedBox(height: 6),

              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 25,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      data.location ?? '',
                      style: AppTextStyles.headingTextStyle2,
                    ),
                  ),
                ],
              ),
              Divider(),

              SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        final partner = msgListModel(
                          image: data.image,
                          tittle: data.tittle,
                          subtittle: data.catg,
                        );

                        Get.to(MessagePage(user: partner));
                      },
                      icon: Icon(Icons.message_outlined, size: 12),
                      label: Text('Message',style: TextStyle(fontSize: 10),),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.call, size: 12),
                      label: Text('Call',style: TextStyle(fontSize: 13),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade100,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),

                  Container(
                    width: 86,
                    height: 40,
                    decoration: BoxDecoration(
                      color: isUpcoming
                          ? Colors.red.shade50
                          : Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        isUpcoming ? 'Cancel' : 'Rate & Review',
                        style: TextStyle(fontSize: 12,
                          color: isUpcoming ? Colors.red : Colors.orange,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
