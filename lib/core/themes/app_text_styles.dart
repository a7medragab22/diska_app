import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String _font = 'Cairo';

  static TextStyle get heading1 => TextStyle(
    fontFamily: _font,
    fontSize: 28.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
  );

  static TextStyle get heading2 => TextStyle(
    fontFamily: _font,
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static TextStyle get sectionTitle => TextStyle(
    fontFamily: _font,
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static TextStyle get bodyMedium => TextStyle(
    fontFamily: _font,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static TextStyle get bodyLarge => TextStyle(
    fontFamily: _font,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.6,
  );

  static TextStyle get bodySmall => TextStyle(
    fontFamily: _font,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textLight,
    height: 1.4,
  );

  static TextStyle get productName => TextStyle(
    fontFamily: _font,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle get price => TextStyle(
    fontFamily: _font,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );

  static TextStyle get oldPrice => TextStyle(
    fontFamily: _font,
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textLight,
    decoration: TextDecoration.lineThrough,
  );

  static TextStyle get categoryLabel => TextStyle(
    fontFamily: _font,
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle get badge => TextStyle(
    fontFamily: _font,
    fontSize: 11.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textWhite,
  );

  static TextStyle get button => TextStyle(
    fontFamily: _font,
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textWhite,
  );

  static TextStyle get footerHeading => TextStyle(
    fontFamily: _font,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textWhite,
  );

  static TextStyle get footerLink => TextStyle(
    fontFamily: _font,
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.footerText,
    height: 2.0,
  );
}
