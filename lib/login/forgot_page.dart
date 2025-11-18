import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/login/login_page.dart';
import 'package:healthcare/utils/color_util.dart';
import 'package:healthcare/utils/text_utils.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();

}

class _ForgotPageState extends State<ForgotPage> {
    final TextEditingController emailController = TextEditingController();
    final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        title:   Text("Forgot Password", style: AppTextStyles.subHeadingTextStyle3),
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
        leading: IconButton(onPressed: (){
           Navigator.of(context).maybePop();
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
       
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                SizedBox(height: Get.height * 0.1),
                Text("Email", style: AppTextStyles.headingTextStyle4),
                TextFormField(controller: emailController,
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
                  ),
                ),
                SizedBox(height: Get.height * 0.1),
                Center(
                  child: SizedBox(
                    width: Get.width * 0.9,
                    child: ElevatedButton(
                      onPressed: () {
                          if (formKey.currentState!.validate()) {
                              
                            }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                      ),
                      child: Text(
                        "Reset Password",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),  SizedBox(height: Get.height * 0.02),
                Center(
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("You remember Password",style: TextStyle(fontSize: 16),),
                      InkWell(
                        onTap: () {
                          Get.to(LoginPage());
                        },
                        child: Text(" Click now",style: TextStyle(fontSize: 16,color: Colors.blue),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
