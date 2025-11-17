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
  bool hidePassword = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: Get.height * 0.15,
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
                    "Welcome Back",
                    style: AppTextStyles.subHeadingTextStyle3,
                  ),
                  Text(
                    "Sign in to continue ",
                    style: AppTextStyles.subHeadingTextStyle4,
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.05),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email", style: AppTextStyles.headingTextStyle3),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty == true) {
                          return "Enter your email";
                        }
                        if (value!.contains("@gmail.com") == false) {
                          return "Enter your vaild email";
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        hintText: "Enter your Email",
                        hintStyle: AppTextStyles.subHeadingTextStyle,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Text("Password", style: AppTextStyles.headingTextStyle3),
                    TextFormField(
                      inputFormatters: [],
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty == true) {
                          return "enter your password";
                        }
                        if (value.length < 8) {
                          return "enter your 8 digit password";
                        }
                      },
                      obscureText: hidePassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        hintText: "Enter your password",
                        hintStyle: AppTextStyles.subHeadingTextStyle,
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
                          if (formKey.currentState!.validate()) {
                            Get.offAll(Bottombar());
                          }
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            Get.offAll(Bottombar());
                          },
                          child: Container(
                            height: Get.height * 0.045,
                            width: Get.width * 0.08,

                            child: Image.asset(
                              "assets/google.png",
                              height: Get.height * 0.03,
                              width: Get.width * 0.07,
                            ),
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {},
                          child: Container(
                            child: Icon(
                              Icons.facebook,
                              size: 45,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {},
                          child: Container(child: Icon(Icons.apple, size: 45)),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(CreatePage());
                          },
                          child: Text(
                            " Sign Up",
                            style: TextStyle(color: Colors.blue, fontSize: 18),
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
    );
  }
}
