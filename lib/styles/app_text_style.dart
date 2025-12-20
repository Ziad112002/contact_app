import 'package:contact/styles/app_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppTextStyle {
  static const TextStyle gold20Medium = TextStyle(
    color: AppColors.gold,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle gold16Medium = TextStyle(
    color: AppColors.gold,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle lightBlue16Regular = TextStyle(
    color: AppColors.lightBlue,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle darkBlue20Regular = TextStyle(
    color: AppColors.darkBlue,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle darkBlue14Medium = TextStyle(
    color: AppColors.darkBlue,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle darkBlue10Medium = TextStyle(
    color: AppColors.darkBlue,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle white10Medium = TextStyle(
    color: AppColors.white,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );
}
