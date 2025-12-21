import 'dart:io';

import 'package:contact/models/contact_model.dart';
import 'package:contact/styles/app_colors.dart';
import 'package:contact/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key,required this.contact,required this.index});
  final ContactModel contact;
  final int index;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Expanded(flex: 7, child: buildContactImage()),
          SizedBox(height: 15),
          Expanded(
            child: buildInfoRow(
              Icon(Icons.mail, color: AppColors.darkBlue),
             contact.email,
            ),
          ),
          SizedBox(height: 10),

          Expanded(
            child: buildInfoRow(
              Icon(Icons.wifi_calling_3_rounded, color: AppColors.darkBlue),
              contact.phone,
            ),
          ),
          SizedBox(height: 8),

          Expanded(flex: 2, child: buildDeleteButton()),
        ],
      ),
    );
  }

  Stack buildContactImage() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              topLeft: Radius.circular(16),
            ),
            image: DecorationImage(
              image: FileImage(File(contact.imagePath)),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 7,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.gold,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(contact.name, style: AppTextStyle.darkBlue14Medium),
          ),
        ),
      ],
    );
  }

  Widget buildInfoRow(Icon icon, String info) {
    return Padding(
      padding: const EdgeInsets.only(left: 7),
      child: Row(
        children: [
          icon,
          Text(info, style: AppTextStyle.darkBlue10Medium),
        ],
      ),
    );
  }

  Widget buildDeleteButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
      child: ElevatedButton(
        onPressed: () {
          contact.delete();
        },
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.orange),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(8),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.delete, color: AppColors.white),
            Text("Delete", style: AppTextStyle.white10Medium),
          ],
        ),
      ),
    );
  }
}
