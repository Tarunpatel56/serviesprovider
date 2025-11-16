import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthcare/utils/color_util.dart';

class AppTextStyles {
 
   // Main 
  static TextStyle headingTextStyle = TextStyle(fontSize: 25,fontFamily: "Inter");
   static TextStyle headingTextStyle2 = TextStyle(fontSize: 15,fontFamily: "Poppins");
      static TextStyle headingTextStyle3 = TextStyle(fontSize: 18,fontFamily: "Poppins");
            static TextStyle headingTextStyle4 = TextStyle(fontSize: 20,fontFamily: "Poppins");
    static TextStyle mainheadingTextStyle = TextStyle(fontSize: 45,color: Colors.white,fontFamily: "Poppins");
     static TextStyle mainheadingTextStyle2 = TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontFamily: 'Poppins',color: AppColors.background );
  static TextStyle subHeadingTextStyle = TextStyle(fontSize: 18);
    static TextStyle subHeadingTextStyle4 = TextStyle(fontSize: 18,color: Colors.white);
  static TextStyle subHeadingTextStyle2 = TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontFamily: 'Poppins',color: AppColors.background);
    static TextStyle subHeadingTextStyle3 = TextStyle(fontSize: 40,fontWeight: FontWeight.bold,fontFamily: 'Poppins',color: AppColors.background);
  static TextStyle textStyle18 = TextStyle(fontSize: 24);
    static TextStyle titleStyle = (TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
    static TextStyle subtitleStyle = (TextStyle(fontSize: 14, color: Colors.grey[700]));
  

  static TextStyle colorHeadingTextStyle({Color? color}) =>
      TextStyle(fontSize: 24, color: color);

  InputDecoration appInputdec()=>  InputDecoration(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade700, width: 15),
    ),
    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),

    hintText: "Enter your email",
  );
}

class fontfamily {
}
