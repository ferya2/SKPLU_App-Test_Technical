import 'package:flutter/material.dart';

import '../../../core/resources/colors.dart';
import '../../../core/resources/texstyle.dart';

class TextFieldCustom extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final IconData icon;
  final bool obscureText;
  final String? hintText;
  final Color? fillColor;
  final TextInputType keyboardType;


  const TextFieldCustom({
    super.key,
    this.controller,
    required this.labelText,
    required this.icon,
    this.obscureText = false,
    this.hintText,
    this.fillColor,
    this.keyboardType = TextInputType.text,

  });

  @override
  Widget build(BuildContext context) {
    return TextField(

      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: AppTextStyle.smallText,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintStyle: AppTextStyle.smallTextGreyColor,
        prefixIcon: Icon(
          icon,
          color: AppColor.primaryColor,
        ),
        filled: true,
        fillColor: fillColor ?? AppColor.secondaryColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60),
        ),
        label: Text(labelText, style: AppTextStyle.smallText),
        hintText: hintText,
      ),
    );
  }
}
