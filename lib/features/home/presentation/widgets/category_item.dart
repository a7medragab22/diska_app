import 'package:diska_app/core/themes/app_colors.dart';
import 'package:diska_app/features/home/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 8.h),
          height: 80.h,
          decoration: BoxDecoration(
            color: _bgColor(),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Center(
            child: category.isSpecial
                ? Icon(
                    Icons.local_fire_department,
                    color: Colors.orange,
                    size: 40.sp,
                  )
                : Image.asset(category.image, width: 80.w, height: 80.h),
          ),
        ),
        SizedBox(height: 8.h),
        Flexible(
          child: Text(
            category.title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryDark,
            ),
          ),
        ),
      ],
    );
  }

  Color _bgColor() {
    if (category.isSpecial) return Colors.orange.shade100;

    final colors = [
      Colors.green.shade100,
      Colors.yellow.shade100,
      Colors.blue.shade100,
      Colors.purple.shade100,
      Colors.pink.shade100,
    ];

    return colors[category.id.hashCode % colors.length];
  }
}
