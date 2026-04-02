import 'package:diska_app/features/home/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      color: const Color(0xFF0B1A2B),
      child: Column(
        children: [
          SizedBox(height: 16.h),
          Row(
            children: [
              _buildIcon(Icons.menu),
              Spacer(flex: 1),
              _buildItem(Icons.shopping_cart, "السلة"),
              Spacer(flex: 1),
              _buildItem(Icons.notifications, "تنبيهات"),
              Spacer(flex: 1),
              _buildItem(Icons.favorite, "المفضلة"),
              Spacer(flex: 1),
              _buildItem(Icons.login, "دخول"),
              Spacer(flex: 4),
            ],
          ),
          SizedBox(height: 16.h),
          CustomSearchBar(),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  Widget _buildItem(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, color: Colors.amber, size: 18.sp),
        SizedBox(height: 5.h),
        Text(
          text,
          style: TextStyle(color: Colors.amber, fontSize: 14.sp),
        ),
      ],
    );
  }

  Widget _buildIcon(IconData icon) {
    return Container(
      padding: EdgeInsets.all(6.w),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}
