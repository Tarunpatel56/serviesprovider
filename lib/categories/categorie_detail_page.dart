import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/categories/categorie_Book_page.dart';
import 'package:healthcare/categories/categorie_model.dart';
import 'package:healthcare/home/book_page.dart';
import 'package:healthcare/model/professional_model.dart';
import 'package:healthcare/utils/color_util.dart';
import 'package:healthcare/utils/text_utils.dart';

class CategorieDetailPage extends StatefulWidget {
  final CategorieModel user1;
  final String? from;
  CategorieDetailPage({
    super.key,
    required this.user1,
    this.from,
    required index,
  });

  @override
  State<CategorieDetailPage> createState() => _CategorieDetailPageState();
}

class _CategorieDetailPageState extends State<CategorieDetailPage> {
  int selectedTimeIndex = 0;
  int selectedTimeIndex1 = -1;
  final dates = [
    {"day": "Mon", "date": "15"},
    {"day": "Tue", "date": "16"},
    {"day": "Wed", "date": "17"},
    {"day": "Thu", "date": "18"},
    {"day": "Fri", "date": "19"},
    {"day": "Sat", "date": "20"},
  ];
  bool isLoading = true;
  final List<CategorieModel> userProfList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loaddata2();
  }

  loaddata2() {
    isLoading = true;
    for (var item in dummyData) {
      userProfList.add(CategorieModel.fromJson(item));
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
        ),
        actionsPadding: EdgeInsets.all(10),
        elevation: 10,
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
       
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: Get.height * 0.17,
                    width: Get.width * 0.34,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.user1.image ?? "NOt found"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: AppColors.background, width: 5),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        widget.user1.tittle ?? '',
                        style: AppTextStyles.headingTextStyle,
                      ),
                      Text(
                        widget.user1.subtittle ?? '',
                        style: AppTextStyles.headingTextStyle4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          Text(widget.user1.rating ?? ''),
                          Text(
                            "(${widget.user1.ratinguser ?? ''} Reviews)",
                            style: AppTextStyles.headingTextStyle2,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Card(
                            child: Container(padding: EdgeInsets.all(10),
                              height: Get.height * 0.1,
                              width: Get.width * 0.2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.brightness_auto_rounded,
                                    color: Colors.blue,
                                  ),
                                  Text(widget.user1.exp ?? '+'),
                                  Text("Year Exp"),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: Container(padding: EdgeInsets.all(10),
                              height: Get.height * 0.1,
                              width: Get.width * 0.2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.health_and_safety,
                                    color: Colors.orange,
                                  ),
                                  Text(widget.user1.patientCount ?? ""),
                                  Text("Happy"),
                                  Text("Patients"),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: Container(padding: EdgeInsets.all(10),
                              height: Get.height * 0.1,
                              width: Get.width * 0.2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star_border_rounded,
                                    color: Colors.blue,
                                  ),
                                  Text(widget.user1.rating ?? '+'),
                                  Text("Rating"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "About",
                          style: AppTextStyles.headingTextStyle,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          widget.user1.about ?? '',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Location",
                          style: AppTextStyles.headingTextStyle3,
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
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 10),
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
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                    color: isSelected
                                        ? Colors.blue
                                        : Colors.black12,
                                    width: isSelected ? 2 : 1,
                                  ),
                                  color: isSelected
                                      ? Colors.blue.shade50
                                      : Colors.grey.shade100,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      item["day"]!,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: isSelected
                                            ? Colors.blue
                                            : Colors.black54,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      item["date"]!,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: isSelected
                                            ? Colors.blue
                                            : Colors.black87,
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

                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Morning",
                          style: AppTextStyles.headingTextStyle4,
                        ),
                      ),
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
                              child: Center(
                                child: Text(
                                  "9:00 AM",
                                  style: TextStyle(fontWeight: FontWeight.w600),
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
                                  style: TextStyle(fontWeight: FontWeight.w600),
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
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("Consultation Fee"),
                Text("\$${widget.user1.price}"),
              ],
            ),
            SizedBox(
              width: Get.width * 0.5,
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.to(() => CategorieBookPage(user1: widget.user1));
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
