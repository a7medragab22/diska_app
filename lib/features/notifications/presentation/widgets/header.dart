import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'الاشعرات',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 8.w),
            Icon(Icons.notifications, size: 30),
          ],
        ),
        SizedBox(height: 32.h),
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'مسح الكل',
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
                SizedBox(width: 4.w),
                Icon(Icons.delete, color: Colors.red, size: 16),
              ],
            ),
          ),
        ),
        SizedBox(height: 24.h),
        Divider(
          thickness: 1,
          color: Colors.grey,
          indent: 24,
          endIndent: 24,
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
