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
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController numbercontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(  appBar: AppBar(
        title:   Column(
                crossAxisAlignment: CrossAxisAlignment.start,
             
                children: [
                  Text(
                    "Create Account",
                    style: AppTextStyles.subHeadingTextStyle3,
                  ),
                  Text(
                    "Sign up to get started ",
                    style: AppTextStyles.subHeadingTextStyle4,
                  ),
                ],
              ),
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        actionsPadding: EdgeInsets.all(15),
        elevation: 10,
        toolbarHeight: 100,
       
        
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        
          children: [
           
            Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Get.height * 0.01),
                    Text("Full Name", style: AppTextStyles.headingTextStyle2),
                    TextFormField(
                      controller: namecontroller,
                      validator: (value) {
                        if (value!.isEmpty == true) {
                          return "Enter your name";
                        }
                      },
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
                    Text("Email", style: AppTextStyles.headingTextStyle2),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty == true) {
                          return "Enter your Email";
                        }
                        if (value!.contains("@gmail.com") == false) {
                          return "Enter your vaild Email";
                        }
                      },
                      controller: emailcontroller,
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
                    Text("Phone Number", style: AppTextStyles.headingTextStyle2),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty == true) {
                          return "Enter your Number";
                        }
                        if (value!.length < 10) {
                          return "Enter vaild Number";
                        }
                      },
                      controller: numbercontroller,
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
                    Text("Password", style: AppTextStyles.headingTextStyle2),
                    TextFormField(  validator: (value) {
                        if (value!.isEmpty == true) {
                          return "Enter your password";
                        }
                        if (value!.length < 8) {
                          return "Enter your 8 digit password";
                        }
                      },
                      controller: passwordcontroller,
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
                        onPressed: () {    if (formKey.currentState!.validate()){
                          Get.to(Bottombar());
                        }},
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(borderRadius: BorderRadius.circular(50),
                          onTap: () {},
                          child: Container(
                      
                            height: Get.height * 0.045,
                            width: Get.width*0.08,
                          
                            child: Image.asset(
                              "assets/google.png",
                              height: Get.height * 0.03,
                              width: Get.width * 0.07,
                            ),
                          ),
                        ),
                        InkWell(borderRadius: BorderRadius.circular(25),
                          onTap: () {},
                          child: Container(
                       
                          
                            child: Icon(
                              Icons.facebook,
                              size: 45,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        InkWell(borderRadius: BorderRadius.circular(25),
                          onTap: () {},
                          child: Container(
                      
                          
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
            ),
          ],
        ),
      ),
    );
  }
}
