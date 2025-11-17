import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/bottombar/bottombar.dart';
import 'package:healthcare/login/create_page.dart';
import 'package:healthcare/login/forgot_page.dart';
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
          SizedBox(height: Get.height * 0.05),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email",style: AppTextStyles.headingTextStyle3,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    hintText: "Enter your Email",
                    hintStyle: AppTextStyles.subHeadingTextStyle,
                  ),
                ),
                SizedBox(height: Get.height * 0.02),
                Text("Password",style: AppTextStyles.headingTextStyle3,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    hintText: "Enter your password",
                    hintStyle: AppTextStyles.subHeadingTextStyle,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Get.to(ForgotPage());
                    },
                    child: Text(
                      "Forgot password",
                      style: AppTextStyles.subHeadingTextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  height: Get.height * 0.05,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offAll(Bottombar());
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor: AppColors.primary,
                    ),
                    child: Text(
                      "Sign in",
                      style: AppTextStyles.subHeadingTextStyle4,
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Divider(thickness: 5, height: 5),

                    Text(
                      "Or continue with",
                      style: AppTextStyles.subHeadingTextStyle,
                    ),
                    Divider(),
                  ],
                ),
                SizedBox(height: Get.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                      InkWell(onTap: () {
                      
                    },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(20),
                        ),
                        child: Container(
                          width: Get.width * 0.2,
                          height: Get.height * 0.045,
                      
                          child: Image.asset(
                            "assets/google.png",
                            height: Get.height * 0.03,
                            width: Get.width * 0.07,
                          ),
                        ),
                      ),
                    ),
                  InkWell(onTap: () {
                      
                    },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(20),
                        ),
                        child: Container(
                          width: Get.width * 0.2,
                      
                          child: Icon(
                            Icons.facebook,
                            size: 45,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                       InkWell(onTap: () {
                      
                    },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(20),
                        ),
                        child: Container(
                          width: Get.width * 0.2,
                      
                          child: Icon(Icons.apple, size: 45),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(CreatePage());
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
