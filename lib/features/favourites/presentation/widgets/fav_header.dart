import 'package:diska_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavHeader extends StatelessWidget {
  const FavHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 32.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: AppColors.primaryDark),
                ),
                child: Text(
                  'تصفح المزيد ➕',
                  style: TextStyle(
                    color: AppColors.primaryDark,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
            Text(
              '❤️المتجات المفضلة',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryDark,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Divider(
          color: Colors.grey[300],
          thickness: 1,
          indent: 16.w,
          endIndent: 16.w,
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
