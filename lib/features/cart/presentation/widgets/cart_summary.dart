import 'package:diska_app/core/themes/app_colors.dart';
import 'package:diska_app/features/cart/logic/cubits/cart_cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartSummary extends StatelessWidget {
  final CartLoaded state;

  const CartSummary({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _row('ملخص الطلب', '', isHeader: true),
          Divider(color: Colors.grey[300], thickness: 1),
          _row("عدد المنتجات", state.items.length.toString()),
          _row("المجموع الفرعي", "${state.subtotal} ج.م"),
          _row("الضريبة", "${state.tax} ج.م"),

          const Divider(),

          _row("الإجمالي", "${state.total} ج.م", isTotal: true, isHeader: true),

          const SizedBox(height: 10),

          Container(
            height: 50,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6A5AE0), Color(0xFF4B3FD3)],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.white,
                  size: 16,
                ),
                SizedBox(width: 8.w),
                Text("إتمام الشراء", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _row(
    String title,
    String? value, {
    bool isTotal = false,
    bool isHeader = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value ?? '',
            style: TextStyle(
              color: isTotal ? AppColors.primaryLight : Colors.grey[700],
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isHeader ? 18 : 14,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              fontSize: isHeader ? 18 : 14,
            ),
          ),
        ],
      ),
    );
  }
}
