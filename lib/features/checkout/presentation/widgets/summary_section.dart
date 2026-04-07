import 'package:diska_app/core/themes/app_colors.dart';
import 'package:diska_app/features/checkout/logic/cubits/checkout_cubit/checkout_cubit.dart';
import 'package:diska_app/features/checkout/presentation/widgets/section_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SummarySection extends StatelessWidget {
  const SummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CheckoutCubit>().model;

    return SectionCard(
      title: "ملخص الطلب",
      icon: Icons.receipt_long,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade500),
            ),
            child: Column(
              children: [
                _row("المجموع الفرعي", model.subtotal),
                _row("تكلفة الشحن", model.shipping),
                _row("الضريبة (14%)", model.tax),
                Divider(),

                _row("الإجمالي الكلي", model.total, isTotal: true),
              ],
            ),
          ),

          SizedBox(height: 20.h),

          Container(
            width: double.infinity,
            height: 55.h,
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Center(
              child: Text(
                "تأكيد الطلب الآن",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SizedBox(height: 10.h),

          Center(
            child: Text(
              textDirection: TextDirection.rtl,
              "بياناتك محمية ومشفرة 100%",
              style: TextStyle(color: AppColors.textLight),
            ),
          ),
        ],
      ),
    );
  }

  Widget _row(String title, double value, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(
            textDirection: TextDirection.rtl,
            "$value ج.م",
            style: TextStyle(
              color: isTotal ? AppColors.availableColor : Colors.black,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Spacer(),
          Text(
            title,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 16.sp : 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
