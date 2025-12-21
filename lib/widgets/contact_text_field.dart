import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../styles/app_text_style.dart';

class ContactTextField extends StatelessWidget {
  const ContactTextField({
    super.key,
    required this.hintText,
    required this.onSaved,
    required this.onChanged,
  });

  final String hintText;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(width: 1.5, color: AppColors.gold),
    );
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field is Required";
        } else {
          return null;
        }
      },
      onChanged: onChanged,
      style: AppTextStyle.gold20Medium,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyle.lightBlue16Regular,
        border: border,
        enabledBorder: border,
        disabledBorder: border,
        errorBorder: border,
        focusedBorder: border,
      ),
    );
  }
}
