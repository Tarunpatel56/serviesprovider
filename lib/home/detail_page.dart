import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/model/professional_model.dart';
import 'package:healthcare/utils/color_util.dart';

class DetailPage extends StatefulWidget {
   final profList user;
  final String? from;
   DetailPage({super.key, required this.user, this.from});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
                top: Get.height*0.13,
                left: Get.width*0.32,
                // right:Get.width*0.5, 
                child: Container(
                  height: Get.height * 0.17,
                  width: Get.width * 0.34,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage(widget.user.image ?? "NOt found",),fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: AppColors.background,width: 5),
                  ),
                ),
              ),
            ],
          ),

          Text(widget.user.tittle??''),
          Text(widget.user.subtittle??''),
          Row(children: [
            Icon(Icons.star,color: Colors.amber,),
            Text(widget.user.rating??''),
           RichText(
  text: TextSpan(
    children: [
      TextSpan(text: "(${widget.user.ratinguser??''})", style: TextStyle(color: Colors.black)),
      TextSpan(
        text: "reviews"  ,
        style: TextStyle(color: Colors.green),
      ),
    ],
  ),
)
            
          ],),
          Row(children: [
            Container(
              child: Column(
                children: [
                  
                ],
              ),
            )
          ],)
        ],
      ),
    );
  }
  
}
