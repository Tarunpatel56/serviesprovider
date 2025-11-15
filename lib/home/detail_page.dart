import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/model/professional_model.dart';
import 'package:healthcare/utils/color_util.dart';
import 'package:healthcare/utils/text_utils.dart';

class DetailPage extends StatefulWidget {
  final profList user;
  final String? from;
  DetailPage({super.key, required this.user, this.from});

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
      appBar: AppBar(backgroundColor: AppColors.primary),
      body: Column(
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

          Text(widget.user.tittle ?? ''),
          Text(widget.user.subtittle ?? ''),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber),
              Text(widget.user.rating ?? ''),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "(${widget.user.ratinguser ?? ''})",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: "reviews",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                child: Column(
                  children: [
                    Icon(Icons.brightness_auto_rounded, color: Colors.blue),
                    Text(widget.user.exp ?? '+'),
                    Text("Year Exp"),
                  ],
                ),
              ),
              Container(
                child: Column(
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
              Container(
                child: Column(
                  children: [
                    Icon(Icons.star_border_rounded, color: Colors.blue),
                    Text(widget.user.rating ?? '+'),
                    Text("Rating"),
                  ],
                ),
              ),
            ],
          ),
          Text("About", style: AppTextStyles.subHeadingTextStyle),
          Wrap(
            children: [
              Text(
                widget.user.about ?? '',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          Text("Location", style: AppTextStyles.subHeadingTextStyle),
          ListTile(
            leading: Icon(Icons.location_on_outlined, color: Colors.blue),
            title: Text("Medical Centerr Downtown"),
            subtitle: Text("123 Health street, medical district"),
          ),
          Text("Available Dates"),
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
         
  } 
      ),
    )])
    );
  }
}
