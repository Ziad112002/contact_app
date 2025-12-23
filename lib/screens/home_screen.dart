import 'package:contact/models/contact_model.dart';
import 'package:contact/styles/app_colors.dart';
import 'package:contact/widgets/add_contact.dart';
import 'package:contact/widgets/contact_info.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';
import '../styles/app_assets.dart';
import '../styles/app_text_style.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "home_screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Box<ContactModel> box;

  @override
  void initState() {
    super.initState();
    box = Hive.box<ContactModel>('contacts_box');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      floatingActionButton: ValueListenableBuilder(
        valueListenable: box.listenable(),
    builder: (context, Box<ContactModel> box, _) {
     return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (box.isNotEmpty) FloatingActionButton(
            backgroundColor: AppColors.orange,
            child: const Icon(Icons.delete, color: AppColors.white),
            onPressed: () {
              box.deleteAt(box.length - 1);
            },
          ),
          if (box.isNotEmpty && box.length < 6)
          const SizedBox(height: 8),
          if (box.length < 6) FloatingActionButton(
            backgroundColor: AppColors.gold,
            child: const Icon(Icons.add, color: AppColors.darkBlue),
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                backgroundColor: AppColors.darkBlue,
                builder: (_) => const AddContact(),
              );
            },
          )
          ,
        ],
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
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, Box box, _) {
          final contacts = box.values.cast<ContactModel>().toList();

          if (box.isEmpty) {
            return buildNoContacts();
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              childAspectRatio: 0.68,
            ),
            itemCount: box.length,
            itemBuilder: (context, index) {
              return ContactInfo(contact: contacts[index], index: index);
            },
          );
        },
      ),
    );
  }

  Column buildNoContacts() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(child: Lottie.asset(AppAssets.emptyListAnimation)),
        Text(
          "There is No Contacts Added Here",
          style: AppTextStyle.gold20Medium,
        ),
      ],
    );
  }
}

