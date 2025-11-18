import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/appointments/appointment_model.dart';
import 'package:healthcare/categories/categorie_model.dart';
import 'package:healthcare/home/book_page.dart';
import 'package:healthcare/model/professional_model.dart';
import 'package:healthcare/utils/color_util.dart';
import 'package:healthcare/utils/text_utils.dart';

class DetailPage extends StatefulWidget {
  final profList user;
  final String? from;
  DetailPage({super.key, required this.user, this.from, required index, });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final dates = [
    {"day": "Mon", "date": "15"},
    {"day": "Tue", "date": "16"},
    {"day": "Wed", "date": "17"},
    {"day": "Thu", "date": "18"},
    {"day": "Fri", "date": "19"},
    {"day": "Sat", "date": "20"},
  ];
  bool isLoading = true;
  int selectedTimeIndex = 0;
    int selectedTimeIndex1 = -1;
  //  bool isSelected = selectedTimeIndex == index;

  final List<profList> userProfList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loaddata2();
  } 

  loaddata2() {
    isLoading = true;
    for (var item in dummyData) {
      userProfList.add(profList.fromJson(item));
    }
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),title: Text(widget.user.tittle??'',style: AppTextStyles.subHeadingTextStyle3,textAlign: TextAlign.center,),
        actionsPadding: EdgeInsets.all(10),
        elevation: 10,
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: () {
             Navigator.of(context).maybePop();
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.05),
            Container(
              height: Get.height * 0.17,
              width: Get.width * 0.34,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.user.image ?? "NOt found"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: AppColors.background, width: 5),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(
                    widget.user.tittle ?? '',
                    style: AppTextStyles.headingTextStyle,
                  ),
                  Align(alignment: AlignmentGeometry.center,
                    child: Text(
                      widget.user.subtittle ?? '',
                      style: AppTextStyles.headingTextStyle4,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      Text(widget.user.rating ?? ''),
                      Text(
                        "(${widget.user.ratinguser ?? ''} Reviews)",
                        style: AppTextStyles.headingTextStyle2,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Card(
                        child: Container(
                   height: Get.height*0.12,
                          width: Get.width * 0.25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.brightness_auto_rounded,
                                color: Colors.blue,
                              ),
                              Text(widget.user.exp ?? '+'),
                              Text("Year Exp"),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          height: Get.height * 0.12,
                          width: Get.width * 0.25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.health_and_safety,
                                color: Colors.orange,
                              ),
                              Text("125"),
                              Text("Happy"),
                              Text("Patients"),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          height: Get.height * 0.12,
                          width: Get.width * 0.25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star_border_rounded,
                                color: Colors.blue,
                              ),
                              Text(widget.user.rating ?? '+'),
                              Text("Rating"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text("About", style: AppTextStyles.headingTextStyle),
                  ),
                  Align(alignment: Alignment.bottomLeft,
                    child: Text(
                      widget.user.about ?? '',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Location",
                      style: AppTextStyles.headingTextStyle,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.location_on_outlined,
                      color: Colors.blue,
                    ),
                    title: Text("Medical Centerr Downtown"),
                    subtitle: Text("123 Health street, medical district"),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Available Dates",
                      style: AppTextStyles.headingTextStyle,
                    ),
                  ),
                SizedBox(
  height: 80,
  child: ListView.separated(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.symmetric(horizontal: 10),
    itemCount: dates.length,
    separatorBuilder: (_, __) => const SizedBox(width: 10),
    itemBuilder: (context, index) {
      final item = dates[index];
      bool isSelected = selectedTimeIndex == index;

      return GestureDetector(
        onTap: () {
          setState(() {
            selectedTimeIndex = index;
          });
        },
        child: Container(
          width: 70,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              color: isSelected ? Colors.blue : Colors.black12,
              width: isSelected ? 2 : 1,
            ),
            color: isSelected ? Colors.blue.shade50 : Colors.grey.shade100,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item["day"]!,
                style: TextStyle(
                  fontSize: 14,
                  color: isSelected ? Colors.blue : Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item["date"]!,
                style: TextStyle(
                  fontSize: 18,
                  color: isSelected ? Colors.blue : Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
    },
  ),
),

                  Align(alignment: Alignment.bottomLeft,
                    child: Text("Morning",style: AppTextStyles.headingTextStyle4,)),
                   Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

        
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedTimeIndex1 = 0;
                });
              },
              child: Container(
                width: Get.width * 0.2,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1,
                    color: selectedTimeIndex1 == 0
                        ? Colors.grey
                        : Colors.black26,
                  ),
                  color: selectedTimeIndex1 == 0
                      ? Colors.grey.shade200
                      : Colors.white,
                ),
                child:  Center(
                  child: Text(
                    "9:00 AM",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

      
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedTimeIndex1 = 1;
                });
              },
              child: Container(
                width: Get.width * 0.2,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1,
                    color: selectedTimeIndex1 == 1
                        ? Colors.grey
                        : Colors.black26,
                  ),
                  color: selectedTimeIndex1 == 1
                      ? Colors.grey.shade200
                      : Colors.white,
                ),
                child: const Center(
                  child: Text(
                    "11:00 AM",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

        
            Container(
              width: Get.width * 0.2,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: Colors.black26,
                ),
                color: Colors.grey.shade300,
              ),
              child: const Center(
                child: Text(
                  "1:00 PM",
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.black45,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

          ],
        ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Consultation Fee"),
                Text(widget.user.price??''),
              ],
            ),
            SizedBox(
              width: Get.width * 0.5,
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.to(BookingPage(user: widget.user));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                label: Text(
                  "Book Appointment",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                icon: Icon(Icons.calendar_today_outlined, color: Colors.white,size: 13,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
