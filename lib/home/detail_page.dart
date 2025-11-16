import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(color: AppColors.primary, height: Get.height * 0.3),
                Positioned(
                  top: Get.height * 0.13,
                  left: Get.width * 0.32,
                  // right:Get.width*0.5,
                  child: Container(
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
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(widget.user.tittle ?? '',style: AppTextStyles.headingTextStyle,),
                  Text(widget.user.subtittle ?? '',style: AppTextStyles.headingTextStyle4,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      Text(widget.user.rating ?? ''),
                     Text("(${widget.user.ratinguser ?? ''} Reviews)",style: AppTextStyles.headingTextStyle2,),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Card(
                        child: Container( height: Get.height*0.1,
                        width: Get.width*0.2,
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.brightness_auto_rounded, color: Colors.blue),
                              Text(widget.user.exp ?? '+'),
                              Text("Year Exp"),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Container(height: Get.height*0.1,
                        width: Get.width*0.2,
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.supervisor_account_rounded,
                                color: Colors.orange,
                              ),
                              Text("125"),
                              Text("Patients"),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Container(height: Get.height*0.1,
                        width: Get.width*0.2,
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.star_border_rounded, color: Colors.blue),
                              Text(widget.user.rating ?? '+'),
                              Text("Rating"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(alignment: Alignment.bottomLeft,
                    child: Text("About", style: AppTextStyles.headingTextStyle)),
                  Wrap(
                    children: [
                      Text(
                        widget.user.about ?? '',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  Align(alignment: Alignment.bottomLeft,
                    child: Text("Location", style: AppTextStyles.headingTextStyle)),
                  ListTile(
                    leading: Icon(Icons.location_on_outlined, color: Colors.blue),
                    title: Text("Medical Centerr Downtown"),
                    subtitle: Text("123 Health street, medical district"),
                  ),
                            Align(alignment: Alignment.bottomLeft,
                    child: Text("Available Dates", style: AppTextStyles.headingTextStyle)),
                  SizedBox(
                    height: 80,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: dates.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        final item = dates[index];
                  
                        return Container(
                          width: 70,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: Colors.black12),
                            color: Colors.grey.shade100,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item["day"]!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item["date"]!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Text("Morning"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: Get.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1),
                        ),
                        child: Center(child: Text("9:00 AM")),
                      ),
                      Container(
                        width: Get.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1),
                        ),
                        child: Center(child: Text("11:00 AM")),
                      ),
                      Container(
                        width: Get.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1),
                        ),
                        child: Center(
                          child: Text(
                            "1:00 PM",
                            style: TextStyle(decoration: TextDecoration.lineThrough),
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
            Column(children: [Text("Consultation Fee"), Text("\$${widget.user.price}")]),
            SizedBox(
              width: Get.width * 0.5,
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.to(BookingPage(user: widget.user,));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                label: Text(
                  "Book Appointment",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                icon: Icon(Icons.calendar_today_outlined, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
