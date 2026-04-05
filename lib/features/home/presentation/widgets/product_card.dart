import 'package:diska_app/core/themes/app_colors.dart';
import 'package:diska_app/features/cart/data/models/cart_item_model.dart';
import 'package:diska_app/features/cart/logic/cubits/cart_cubit/cart_cubit.dart';
import 'package:diska_app/features/home/data/models/product_model.dart';
import 'package:diska_app/features/home/logic/cubits/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final int index;

  const ProductCard({super.key, required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductCubit>();

    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => cubit.toggleFavorite(index),
                icon: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: product.isFavorite
                          ? Colors.red
                          : Colors.grey.shade300,
                    ),
                    color: product.isFavorite
                        ? Colors.red.shade50
                        : Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    product.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: product.isFavorite
                        ? Colors.red
                        : Colors.grey.shade600,
                  ),
                ),
              ),

              if (product.discount != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.discountBadge,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "${product.discount}% خصم",
                    style: const TextStyle(
                      color: AppColors.surface,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),

          Center(child: Image.asset(product.image, height: 120)),
          SizedBox(height: 16.h),
          Text(
            textDirection: TextDirection.rtl,
            product.category,
            style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
          ),
          SizedBox(height: 8.h),
          Text(
            product.name,
            style: TextStyle(
              color: AppColors.primaryDark,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            "${product.price} ج.م",
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: AppColors.primaryDark,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    final cartCubit = context.read<CartCubit>();
                    cartCubit.addItem(
                      CartItemModel(
                        id:
                            int.tryParse(product.id) ??
                            product.id.hashCode.abs(),
                        name: product.name,
                        image: product.image,
                        price: product.price,
                        quantity: product.quantity,
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('تم الإضافة بنجاح'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryDark,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.cartPlus,
                        size: 16,
                        color: AppColors.surface,
                      ),
                      SizedBox(width: 8.w),
                      const Text(
                        "أضف",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.surface,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                height: 36.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40.w,
                      decoration: BoxDecoration(
                        color: AppColors.primaryDark,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        onPressed: () => cubit.increaseQty(index),
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text("${product.quantity}"),
                    ),
                    SizedBox(width: 4.w),
                    Container(
                      width: 40.w,
                      decoration: BoxDecoration(
                        color: AppColors.primaryDark,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        onPressed: () => cubit.decreaseQty(index),
                        icon: const Icon(Icons.remove, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
