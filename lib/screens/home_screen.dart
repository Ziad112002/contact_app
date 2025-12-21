import 'package:contact/styles/app_colors.dart';
import 'package:contact/widgets/add_contact.dart';
import 'package:contact/widgets/contact_info.dart';
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: AppColors.orange,
            child: Icon(Icons.delete, color: AppColors.white),
            onPressed: () {},
          ),
          SizedBox(height: 8),
          FloatingActionButton(
            backgroundColor: AppColors.gold,
            child: Icon(Icons.add, color: AppColors.darkBlue),
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: AppColors.darkBlue,
                context: context,
                builder: (context) => AddContact(),
              );
            },
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        title: Image(
          image: AssetImage(AppAssets.routeLogo),
          width: 117,
          height: 40,
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          childAspectRatio: 0.68,
        ),
        itemCount: 6,
        itemBuilder: (_, index) {
          return ContactInfo();
        },
      ),
    );
  }
}

// child:
// Center(child: Lottie.asset(AppAssets.emptyListAnimation)),
// Text(
//   "There is No Contacts Added Here",
//   style: AppTextStyle.gold20Medium,
// ),
