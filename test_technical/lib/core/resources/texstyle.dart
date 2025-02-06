import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyle {
  static TextStyle title = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 36,
    fontWeight: FontWeight.w500,
    color: AppColor.primaryColor,
  );
  static TextStyle subtitle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColor.primaryColor,
  );
  static TextStyle subtitleWhiteColor = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColor.greyDark,
  );
  static TextStyle smallText = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColor.primaryColor,
  );
  static TextStyle smallTextGreyColor = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColor.greyDark,
  );
  static TextStyle smallTextWhiteColor = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColor.whiteNeutral,
  );
  static TextStyle smallTextBlackColor = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColor.blackNeutral,
  );
}
