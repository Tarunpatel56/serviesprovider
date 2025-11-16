import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/bottombar/bottombar.dart';
import 'package:healthcare/login/login_page.dart';
import 'package:healthcare/utils/color_util.dart';
import 'package:healthcare/utils/text_utils.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  bool hidePassword = true;
  bool isChecked = false;
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
                Text(
                  "Create Account",
                  style: AppTextStyles.subHeadingTextStyle3,
                ),
                Text(
                  "Sign up to get started ",
                  style: AppTextStyles.subHeadingTextStyle2,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * 0.01),
                Text("Full Name", style: AppTextStyles.headingTextStyle3),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    prefixIcon: Icon(Icons.person),
                    hintText: "Enter your full name",
                    hintStyle: AppTextStyles.subHeadingTextStyle,
                  ),
                ),
                SizedBox(height: Get.height * 0.01),
                Text("Email", style: AppTextStyles.headingTextStyle3),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    prefixIcon: Icon(Icons.email_outlined),
                    hintText: "Enter your Email",
                    hintStyle: AppTextStyles.subHeadingTextStyle,
                  ),
                ),
                SizedBox(height: Get.height * 0.01),
                Text("Phone Number", style: AppTextStyles.headingTextStyle3),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    prefixIcon: Icon(Icons.phone),
                    hintText: "Enter your phone number",
                    hintStyle: AppTextStyles.subHeadingTextStyle,
                  ),
                ),
                SizedBox(height: Get.height * 0.01),
                Text("Password", style: AppTextStyles.headingTextStyle3),
                TextFormField(
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      child: Icon(
                        hidePassword
                            ? Icons.remove_red_eye_sharp
                            : Icons.visibility_off,
                      ),
                    ),
                    hintText: "Create a password",
                    hintStyle: AppTextStyles.subHeadingTextStyle,
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      focusColor: Colors.blue,

                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text("I agree to the terms & conditions"),
                  ],
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  height: Get.width * 0.1,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(Bottombar());
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor: AppColors.primary,
                    ),
                    child: Text(
                      "Create Account",
                      style: AppTextStyles.subHeadingTextStyle4,
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Divider(thickness: 5, height: 5),

                    Text(
                      "Or signup with",

                      style: AppTextStyles.subHeadingTextStyle,
                    ),
                  ],
                ),
                SizedBox(height: Get.height * 0.01),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Card(
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
                    Card(
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
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(20),
                      ),
                      child: Container(
                        width: Get.width * 0.2,

                        child: Icon(Icons.apple, size: 45),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an accout?",
                      style: TextStyle(fontSize: 18),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(LoginPage());
                      },
                      child: Text(
                        " Sign In",
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
