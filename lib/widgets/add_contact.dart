import 'package:contact/styles/app_assets.dart';
import 'package:contact/styles/app_colors.dart';
import 'package:contact/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AddContact extends StatelessWidget {
  const AddContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 7),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 11),
                  decoration: BoxDecoration(
                    border: BoxBorder.all(width: 1, color: AppColors.gold),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Lottie.asset(AppAssets.imagePickerAnimation),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("User Name", style: AppTextStyle.gold16Medium),
                    Divider(height: 16, color: AppColors.gold),
                    Text("example@email.com", style: AppTextStyle.gold16Medium),
                    Divider(height: 16, color: AppColors.gold),
                    Text("+200000000000", style: AppTextStyle.gold16Medium),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          buildInfoTextField("Enter User Name "),
          SizedBox(height: 9),
          buildInfoTextField("Enter User Email "),
          SizedBox(height: 9),
          buildInfoTextField("Enter User Phone"),
          SizedBox(height: 16),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColors.gold),
              padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 137, vertical: 17),
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(15),
                ),
              ),
            ),
            onPressed: () {},
            child: Text("Enter User", style: AppTextStyle.darkBlue20Regular),
          ),
        ],
      ),
    );
  }

  Widget buildInfoTextField(String hintText) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(width: 1.5, color: AppColors.gold),
    );
    return TextField(
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
