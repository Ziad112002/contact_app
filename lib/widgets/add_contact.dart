import 'dart:io';
import 'package:contact/models/contact_model.dart';
import 'package:contact/styles/app_assets.dart';
import 'package:contact/styles/app_colors.dart';
import 'package:contact/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'contact_text_field.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  File? image;
  Future pickImage() async {
    final picked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (picked != null) {
      setState(() {
        image = File(picked.path);
      });
    }
  }
  void saveContact() {
    if (image == null ||
        nameCtrl.text.isEmpty ||
        phoneCtrl.text.isEmpty) return null;

    Hive.box<ContactModel>("Contacts_box").add(
      ContactModel(name: nameCtrl.text, email: emailCtrl.text, phone: phoneCtrl.text, imagePath: image!.path)
    );

    Navigator.pop(context);
  }
  String? name, email, phoneNumber;
  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration:  Duration(milliseconds: 250),
      curve: Curves.easeOut,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildShowContactItem(),
                SizedBox(height: 16),
                ContactTextField(
                  controller: nameCtrl,
                  hintText: "Enter User Name ",
                  onChanged: (value) {
                    name = value;
                  },
                  validator: validateNameAndPhone,
                ),
                SizedBox(height: 8),
                ContactTextField(
                  controller: emailCtrl,
                  hintText: "Enter User Email ",
                  onChanged: (value) {
                    email = value;
                  },
                  validator: validateEmail,
                ),
                SizedBox(height: 8),
                ContactTextField(
                  controller: phoneCtrl,
                  hintText: "Enter User Phone",
                  validator: validateNameAndPhone,
                  onChanged: (value) {
                    phoneNumber = value;
                  },
                  textInput: TextInputType.phone,
                ),
                SizedBox(height: 16),
                buildElevatedButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Row buildShowContactItem() {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            onTap: ()  {
                setState(() {
                  pickImage();
                });
            },
            child: Container(
              height: MediaQuery.of(context).size.height*.17,
              margin: EdgeInsets.symmetric(horizontal: 7),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 11),
              decoration: BoxDecoration(
                border: BoxBorder.all(width: 1, color: AppColors.gold),
                borderRadius: BorderRadius.circular(28),
                image:image != null
                    ? DecorationImage(
                        image: FileImage(image!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child:image == null
                  ? Lottie.asset(AppAssets.imagePickerAnimation)
                  : null,
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name ?? "User Name", style: AppTextStyle.gold16Medium),
              Divider(height: 16, color: AppColors.gold),
              Text(
                email ?? "example@email.com",
                style: AppTextStyle.gold16Medium,
              ),
              Divider(height: 16, color: AppColors.gold),
              Text(
                phoneNumber ?? "+200000000000",
                style: AppTextStyle.gold16Medium,

              ),
            ],
          ),
        ),
      ],
    );
  }
  SizedBox buildElevatedButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.gold),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(15),
            ),
          ),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 14)
          ),
        ),
        onPressed: () {
          setState(() {
            saveContact();
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
            } else {
              autoValidateMode = AutovalidateMode.always;
            }
          });
        },
        child: Text("Enter User",textAlign: TextAlign.center, style: AppTextStyle.darkBlue20Regular),
      ),
    );
  }
  String? validateNameAndPhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Field is required";
    }
    return null;
  }
String? validateEmail(String? value){
    final emailRegEx=RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!emailRegEx.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;

}

}
