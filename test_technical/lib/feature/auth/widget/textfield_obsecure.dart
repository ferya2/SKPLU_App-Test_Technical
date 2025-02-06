import 'package:flutter/material.dart';

import '../../../core/resources/colors.dart';
import '../../../core/resources/texstyle.dart';

class TextFieldPassword extends StatefulWidget {
  final TextEditingController? controller;
  final String labelText;
  final String? hintText;
  final bool obscureText;
  final IconData? suffixIcon;

  const TextFieldPassword({
    super.key,
    this.controller,
    required this.labelText,
    this.hintText,
    this.obscureText = true,
    this.suffixIcon = Icons.remove_red_eye_outlined,
  });

  @override
  _TextFieldPasswordState createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      style: AppTextStyle.smallText,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintStyle: AppTextStyle.smallTextGreyColor,
        prefixIcon: Icon(
          Icons.lock_outline,
          color: AppColor.primaryColor,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? widget.suffixIcon! : Icons.visibility_off_outlined,
            color: AppColor.primaryColor,
          ),
          onPressed: _togglePasswordVisibility,
        ),
        filled: true,
        fillColor: AppColor.secondaryColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60),
        ),
        label: Text(widget.labelText, style: AppTextStyle.smallText),
        hintText: widget.hintText,
      ),
    );
  }
}
