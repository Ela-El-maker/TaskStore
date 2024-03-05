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

const Color blackColor = Color(0xFF000000);

const Color redColor = Color(0xFFFF0000);

const Color orangeColor = Color(0xFFFF9900);

const Color turquoiseGlassColor = Color(0xFF61B4B4); // Combination of blue and green
const Color goldenGlassColor = Color(0xFFFFC300); // Combination of yellow and orange
const Color roseGlassColor = Color(0xFFE83E8C); // Combination of pink and red
const Color azureGlassColor = Color(0xFF5ED1FF); // Combination of blue and teal
const Color amethystGlassColor = Color(0xFF9B30FF); // Combination of purple and indigo
const Color tealColor = Color(0xFF00BCD4);
const Color purpleColor = Color(0xFF9C27B0);
const Color limeColor = Color(0xFFCDDC39);
const Color amberColor = Color(0xFFFFC107);
const Color indigoColor = Color(0xFF3F51B5);


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
      color: Get.isDarkMode?Colors.grey[400]:const Color.fromARGB(255, 0, 0, 0),
      fontWeight: FontWeight.bold,
      fontSize: 30,
    )
  );
}
TextStyle get headingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      color: Get.isDarkMode?Colors.grey[400]:Color.fromARGB(255, 0, 0, 0),
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
      color: Get.isDarkMode?Color.fromARGB(0, 255, 255, 255):const Color.fromARGB(255, 0, 0, 0),
      fontWeight: FontWeight.w400,
      fontSize: 14,
    )
  );
}
