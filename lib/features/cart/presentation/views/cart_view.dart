import 'package:diska_app/core/routes/app_route.dart';
import 'package:diska_app/core/themes/app_colors.dart';
import 'package:diska_app/core/utils/custom_empty_card.dart';
import 'package:diska_app/core/utils/footer.dart';
import 'package:diska_app/core/utils/top_bar.dart';
import 'package:diska_app/features/cart/logic/cubits/cart_cubit/cart_cubit.dart';
import 'package:diska_app/features/cart/logic/cubits/cart_cubit/cart_state.dart';
import 'package:diska_app/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:diska_app/features/cart/presentation/widgets/cart_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartEmpty) {
            return Column(
              children: [
                TopBar(),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(child: SizedBox(height: 32.h)),
                      SliverToBoxAdapter(
                        child: CustomEmptyCard(
                          icon: Icons.shopping_cart_outlined,
                          title: 'سلة المشتريات فارغة',
                          subtitle: "يبدو أنك لم تضف أي منتجات بعد.",
                          buttonText: "ابدأ التسوق",
                          onButtonPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoute.homeView,
                            );
                          },
                        ),
                      ),
                      SliverToBoxAdapter(child: SizedBox(height: 32.h)),
                      const SliverToBoxAdapter(child: FooterSection()),
                    ],
                  ),
                ),
              ],
            );
          }

          if (state is CartLoaded) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: TopBar()),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${state.items.length} عناصر ',
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const Text(
                          'عربة التسوق',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final item = state.items[index];
                    return CartItemCard(item: item);
                  }, childCount: state.items.length),
                ),
                SliverToBoxAdapter(child: CartSummary(state: state)),
                const SliverToBoxAdapter(child: FooterSection()),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
