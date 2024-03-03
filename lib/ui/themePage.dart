import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

const Color blueColor = Color(0xFF4e5ae8);
const Color yellowColor = Color(0xFFFFB746);
const Color pinkColor = Color(0xFFFF4667);

const Color greenColor = Color(0xFF2ed93d);
const Color grayColor = Colors.grey;
const Color darkHeaderColor = Color(0xff1c1a1b);

const Color whiteColor = Color(0xFFFFFFFF);

const Color darkGreyColor = Color(0xFF313239);

const Color lightGreyColor = Color(0xFF999999);

class Themes {
  static final light = ThemeData(
    primaryColor: Colors.blue,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    backgroundColor: darkGreyColor,
    primaryColor: darkGreyColor,
    brightness: Brightness.dark,
  );
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      color: Get.isDarkMode?Colors.grey[400]:Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 30,
    )
  );
}
TextStyle get headingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      color: Get.isDarkMode?Colors.grey[400]:Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 30,
    )
  );
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      color: Get.isDarkMode?Colors.white:Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    )
  );
}
TextStyle get subTitleStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      color: Get.isDarkMode?Colors.grey[100]:Colors.grey[400],
      fontWeight: FontWeight.w400,
      fontSize: 14,
    )
  );
}
