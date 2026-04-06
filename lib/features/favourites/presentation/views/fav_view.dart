import 'package:diska_app/core/routes/app_route.dart';
import 'package:diska_app/core/utils/custom_empty_card.dart';
import 'package:diska_app/core/utils/footer.dart';
import 'package:diska_app/core/utils/top_bar.dart';
import 'package:diska_app/features/favourites/logic/cubits/fav_cubit/fav_cubit.dart';
import 'package:diska_app/features/favourites/logic/cubits/fav_cubit/fav_state.dart';
import 'package:diska_app/features/favourites/presentation/widgets/fav_header.dart';
import 'package:diska_app/features/favourites/presentation/widgets/fav_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavView extends StatelessWidget {
  const FavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FavCubit, FavState>(
        builder: (context, state) {
          if (state is FavEmpty) {
            return Column(
              children: [
                TopBar(),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(child: FavHeader()),

                      SliverToBoxAdapter(
                        child: CustomEmptyCard(
                          icon: Icons.favorite_border,
                          title: 'المفضلة فارغة',
                          subtitle:
                              "يبدو أنك لم تضف أي منتجات إلى المفضلة بعد.",
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

          if (state is FavLoaded) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: TopBar()),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverToBoxAdapter(child: FavHeader()),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final item = state.items[index];
                    return FavItemCard(item: item);
                  }, childCount: state.items.length),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 24.h)),
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
