import 'package:contact/styles/app_colors.dart';
import 'package:contact/styles/app_text_style.dart';
import 'package:contact/widgets/add_contact.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../styles/app_assets.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "home_screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.gold,
        child: Icon(Icons.add,color: AppColors.darkBlue,),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: AppColors.darkBlue,
            context: context,
            builder: (context) => AddContact(),
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        title: Image(
          image: AssetImage(AppAssets.routeLogo),
          width: 117,
          height: 40,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Center(child: Lottie.asset(AppAssets.emptyListAnimation)),
          Text(
            "There is No Contacts Added Here",
            style: AppTextStyle.gold20Medium,
          ),
        ],
      ),
    );
  }
}

// child:
