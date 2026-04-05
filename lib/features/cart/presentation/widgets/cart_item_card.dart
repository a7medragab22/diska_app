import 'package:diska_app/core/themes/app_colors.dart';
import 'package:diska_app/features/cart/data/models/cart_item_model.dart';
import 'package:diska_app/features/cart/logic/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemCard extends StatelessWidget {
  final CartItemModel item;

  const CartItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();

    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 10, top: 10),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Image.asset(item.image, height: 160.sp),
            ),
          ),
          SizedBox(height: 12.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(flex: 2),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('تأكيد الحذف'),
                      content: const Text(
                        'هل تريد فعلاً حذف هذا المنتج من العربة؟',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('إلغاء'),
                        ),
                        TextButton(
                          onPressed: () {
                            cubit.removeItem(item.id);
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'حذف',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.delete, color: Colors.grey[400], size: 20.sp),
              ),
              Spacer(flex: 1),
              Text(
                item.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          Text("SKU: #${item.id}"),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                textDirection: TextDirection.rtl,
                "${item.price} ج.م",
                style: TextStyle(color: AppColors.primaryDark, fontSize: 16.sp),
              ),

              Row(
                children: [
                  IconButton(
                    onPressed: () => cubit.decrease(item.id),
                    icon: const Icon(Icons.remove),
                  ),
                  Text("${item.quantity}"),
                  IconButton(
                    onPressed: () => cubit.increase(item.id),
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
