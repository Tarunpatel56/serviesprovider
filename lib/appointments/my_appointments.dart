// lib/appointments/my_appointments.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/appointments/appintment_Controller.dart';

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

        body: SafeArea(
          child: Column(
            children: [

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
       
                height: Get.height * 0.18,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
          
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'My Appointments',
                      style: AppTextStyles.subHeadingTextStyle2.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Track and manage your bookings',
                      style: AppTextStyles.headingTextStyle2.copyWith(color: Colors.white70),
                    ),
                  ],
                ),
              ),

 
          Material(
  color: Colors.white,
  child: Container(
    margin:  EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
     
    ),
    child: TabBar(
      indicatorSize: TabBarIndicatorSize.tab, 
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
              
                    Obx(
                      () {
                        final list = ctrl.upcoming;
                        if (list.isEmpty) {
                          return  Center(child: Text('No upcoming appointments'));
                        }
                        return ListView.separated(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          itemCount: list.length,
                          separatorBuilder: (_, __) =>  SizedBox(height: 8),
                          itemBuilder: (context, index) {
                            return _appointmentCard(list[index], isUpcoming: true);
                          },
                        );
                      },
                    ),

                    // PAST
                    Obx(
                      () {
                        final list = ctrl.past;
                        if (list.isEmpty) {
                          return const Center(child: Text('No past appointments'));
                        }
                        return ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          itemCount: list.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 8),
                          itemBuilder: (context, index) {
                            return _appointmentCard(list[index], isUpcoming: false);
                          },
                        );
                      },
                    ),
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
    return Card(
      margin:  EdgeInsets.symmetric(horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0.6,
      child: Padding(
        padding:  EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // status + booking id row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Confirmed', style: const TextStyle(color: Colors.green)),
              Text('Booking ID: #${data.bookingid ?? ''}',
                  style: const TextStyle(color: Colors.black54)),
            ],
          ),

           SizedBox(height: 8),

          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: data.image != null && data.image!.isNotEmpty
                    ? DecorationImage(image: AssetImage(data.image!), fit: BoxFit.cover)
                    : null,
                color: Colors.grey.shade200,
              ),
              child: (data.image == null || data.image!.isEmpty)
                  ?  Icon(Icons.person, size: 36, color: Colors.grey)
                  : null,
            ),

             SizedBox(width: 12),

     
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(data.tittle ?? '', style: AppTextStyles.headingTextStyle),
                 SizedBox(height: 4),
                Text(data.catg ?? '', style: AppTextStyles.headingTextStyle2),
                 SizedBox(height: 6),
                Text(data.perps ?? '', style: AppTextStyles.headingTextStyle2),
              ]),
            ),
          ]),

           SizedBox(height: 12),


          Row(children: [
             Icon(Icons.calendar_today_outlined, size: 16, color: Colors.blue),
             SizedBox(width: 6),
            Text(data.date ?? ''),
             SizedBox(width: 12),
             Icon(Icons.watch_later_outlined, size: 16, color: Colors.blue),
             SizedBox(width: 6),
            Text(data.time ?? ''),
          ]),

           SizedBox(height: 6),

          Row(children: [
             Icon(Icons.location_on_outlined, size: 16, color: Colors.blue),
             SizedBox(width: 6),
            Expanded(child: Text(data.location ?? '')),
          ]),

           SizedBox(height: 12),


          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon:  Icon(Icons.message_outlined, size: 18),
                  label:  Text('Message'),
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                ),
              ),
               SizedBox(width: 8),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.call, size: 18),
                  label: Text('Call'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade100,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                ),
              ),
               SizedBox(width: 8),
            
              Container(
                width: 86,
                height: 40,
                decoration: BoxDecoration(
                  color: isUpcoming ? Colors.red.shade50 : Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    isUpcoming ? 'Cancel' : 'Rate & Review',
                    style: TextStyle(color: isUpcoming ? Colors.red : Colors.orange),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
