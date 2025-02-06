import 'package:flutter/material.dart';
import '../../../core/resources/colors.dart';
import '../../../core/resources/texstyle.dart';

class ButtonCustom extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color? backgroundColor; // Tidak ada default nilai
  final double height;
  final TextStyle? textStyle;

  const ButtonCustom({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor, // Background color bisa null
    this.height = 56.0,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height),
        maximumSize: Size.fromHeight(height),
        fixedSize: Size.fromHeight(height),
        backgroundColor: backgroundColor ??
            AppColor.primaryColor, // Menggunakan nilai default di sini
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
      ),
      onPressed: onPressed,
      child: Text(label, style: textStyle ?? AppTextStyle.smallTextWhiteColor),
    );
  }
}
