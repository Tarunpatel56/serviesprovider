import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/utils/color_util.dart';
import 'package:healthcare/utils/text_utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,

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
          Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  hintText: "Enter your Email",
                  hintStyle: AppTextStyles.subHeadingTextStyle,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  hintText: "Enter your password",
                  hintStyle: AppTextStyles.subHeadingTextStyle,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot password",
                  style: AppTextStyles.subHeadingTextStyle,
                ),
              ),
              SizedBox(
                width: Get.width*0.9,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(25),),
                    backgroundColor: AppColors.primary,
                  ),
                  child: Text(
                    "Sign in",
                    style: AppTextStyles.subHeadingTextStyle4,
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Divider( thickness: 5,height: 5,),
                
                Text("Or continue with",style: AppTextStyles.subHeadingTextStyle,),
                Divider()
              ],),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Container(height: Get.height*0.2,
                width: Get.width*0.2,
                decoration: BoxDecoration(),
                child: Image.asset("assets/google.png"),
                 
                ),
                Container(height: Get.height*0.14,
                width: Get.width*0.14,
                decoration: BoxDecoration(),
                child: Image.asset("assets/Facebook.png"),
                 
                ),
                Container(height: Get.height*0.2,
                width: Get.width*0.2,
                decoration: BoxDecoration(),
                child: Icon(Icons.apple,size: 75,)
                 
                ),
                
              ],)
            ],
          ),
        ],
      ),
    );
  }
}
