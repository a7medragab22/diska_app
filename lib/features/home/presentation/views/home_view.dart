import 'package:diska_app/core/themes/app_colors.dart';
import 'package:diska_app/features/home/data/models/offer_model.dart';
import 'package:diska_app/features/home/presentation/views/product_view.dart';
import 'package:diska_app/features/home/presentation/widgets/category_grid.dart';
import 'package:diska_app/features/home/presentation/widgets/footer_section.dart';
import 'package:diska_app/features/home/presentation/widgets/header_section.dart';
import 'package:diska_app/features/home/presentation/widgets/offer_slider.dart';
import 'package:diska_app/features/home/presentation/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static final List<OfferModel> offers = [
    OfferModel(
      image: 'assets/images/backcard.jpg',
      title: 'عرض الصيف',
      description: 'خصم 45% على جميع الأصناف المستوردة',
    ),
    OfferModel(
      image: 'assets/images/fa.jpg',
      title: 'عروض بوكسات 50%',
      description: 'اشتري الآن واستفيد من خصم كبير على الجملة',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: const TopBar()),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            SliverToBoxAdapter(child: const HeaderSection()),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            SliverToBoxAdapter(child: OfferSlider(offers: offers)),
            SliverToBoxAdapter(child: SizedBox(height: 80.h)),
            SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'تسوق حسب القسم',
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryDark,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            CategoryGrid(),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.arrowLeft,
                            size: 14,
                            color: AppColors.primaryDark,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            'عرض الكل',
                            style: TextStyle(
                              color: AppColors.primaryDark,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'احدث المنتجات',
                      style: TextStyle(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryDark,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),

            const ProductsView(),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            SliverToBoxAdapter(child: const FooterSection()),
          ],
        ),
      ),
    );
  }
}
