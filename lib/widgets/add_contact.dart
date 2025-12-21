import 'dart:io';

import 'package:contact/styles/app_assets.dart';
import 'package:contact/styles/app_colors.dart';
import 'package:contact/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import 'contact_text_field.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final myController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? name, email, phoneNumber;
  final ImagePicker picker = ImagePicker();
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        final image = await pickImage();
                        if (image != null) {
                          setState(() {
                            selectedImage = image;
                          });
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 7),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 11,
                        ),
                        decoration: BoxDecoration(
                          border: BoxBorder.all(
                            width: 1,
                            color: AppColors.gold,
                          ),
                          borderRadius: BorderRadius.circular(28),
                          image: selectedImage != null
                              ? DecorationImage(
                                  image: FileImage(selectedImage!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: selectedImage == null
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
                        Text(
                          name ?? "User Name",
                          style: AppTextStyle.gold16Medium,
                        ),
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
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ContactTextField(
                hintText: "Enter User Name ",
                onSaved: (value) {
                  name = value;
                },
                onChanged: (value) {
                  name = value;
                },
              ),
            ),
            SizedBox(height: 9),
            Expanded(
              child: ContactTextField(
                hintText: "Enter User Email ",
                onSaved: (value) {
                  email = value;
                },
                onChanged: (value) {
                  email = value;
                },
              ),
            ),
            SizedBox(height: 9),
            Expanded(
              child: ContactTextField(
                hintText: "Enter User Phone",
                onSaved: (value) {
                  phoneNumber = value;
                },
                onChanged: (value) {
                  phoneNumber = value;
                },
              ),
            ),
            SizedBox(height: 16),
            Expanded(child: buildElevatedButton()),
          ],
        ),
      ),
    );
  }

  ElevatedButton buildElevatedButton() {
    return ElevatedButton(
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
      onPressed: () {
        setState(() {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
          } else {
            autoValidateMode = AutovalidateMode.always;
          }
        });
      },
      child: Text("Enter User", style: AppTextStyle.darkBlue20Regular),
    );
  }

  Future<File?> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    return File(image.path);
  }
}
