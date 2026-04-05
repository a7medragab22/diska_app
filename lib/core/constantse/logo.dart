import 'package:diska_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: AppColors.primaryYellow,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(
            Icons.percent,
            color: AppColors.primaryDark,
            size: 18.sp,
          ),
        ),
        SizedBox(width: 6.w),
        Column(
          children: [
            Text(
              "DISKA",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Wole Deals Platform',
              style: TextStyle(color: Colors.white, fontSize: 6.sp),
            ),
          ],
        ),
      ],
    );
  }
}
