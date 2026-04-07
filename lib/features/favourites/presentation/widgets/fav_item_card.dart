import 'package:diska_app/core/themes/app_colors.dart';
import 'package:diska_app/core/utils/custom_button.dart';
import 'package:diska_app/features/cart/data/models/cart_item_model.dart';
import 'package:diska_app/features/cart/logic/cubits/cart_cubit/cart_cubit.dart';
import 'package:diska_app/features/favourites/data/models/fav_model.dart';
import 'package:diska_app/features/favourites/logic/cubits/fav_cubit/fav_cubit.dart';
import 'package:diska_app/features/home/logic/cubits/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FavItemCard extends StatelessWidget {
  final FavItemModel item;

  const FavItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FavCubit>();

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
          Text(
            item.category,
            style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
          ),
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
                        'هل تريد فعلاً حذف هذا المنتج من المفضلة؟',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('إلغاء'),
                        ),
                        TextButton(
                          onPressed: () {
                            final productCubit = context.read<ProductCubit>();
                            cubit.removeFromFav(item.id);
                            productCubit.setFavoriteById(
                              item.id.toString(),
                              false,
                            );
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
          const SizedBox(height: 10),
          Text(
            textDirection: TextDirection.rtl,
            "${item.price} ج.م",
            style: TextStyle(color: AppColors.primaryDark, fontSize: 16.sp),
          ),
          SizedBox(height: 16.h),
          CustomButton(
            text: "أضف إلى العربة",
            onPressed: () {
              final cartCubit = context.read<CartCubit>();
              cartCubit.addItem(
                CartItemModel(
                  id: item.id,
                  name: item.name,
                  image: item.image,
                  price: item.price,
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Center(child: Text('تم الإضافة بنجاح')),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );
            },
            faIcon: FontAwesomeIcons.cartShopping,
            isFaicon: true,
          ),
        ],
      ),
    );
  }
}
