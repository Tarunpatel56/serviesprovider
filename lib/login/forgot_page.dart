import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/utils/color_util.dart';
import 'package:healthcare/utils/text_utils.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: Get.height * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(30),
              ),
              color: AppColors.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome Back", style: AppTextStyles.subHeadingTextStyle3),
                Text(
                  "Sign in to continue ",
                  style: AppTextStyles.subHeadingTextStyle2,
                ),
              ],
            ),
          ),
          SizedBox(height: Get.height*0.1,),
          Text("Email",style:AppTextStyles.headingTextStyle4,),
          TextFormField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),hintText: "Enter your Email"),),
      SizedBox(width: Get.width*0.7,
        child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary), child: Text("Reset Password",style: TextStyle(fontSize: 18,color: Colors.white))))
      ],),
    );
  }
}