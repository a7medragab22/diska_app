import 'package:diska_app/features/home/data/models/offer_model.dart';
import 'package:diska_app/features/home/presentation/widgets/header_section.dart';
import 'package:diska_app/features/home/presentation/widgets/offer_slider.dart';
import 'package:diska_app/features/home/presentation/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: const TopBar()),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            SliverToBoxAdapter(child: const HeaderSection()),
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            SliverToBoxAdapter(child: OfferSlider(offers: offers)),
            SliverToBoxAdapter(child: SizedBox(height: 80.h)),
            SliverToBoxAdapter(child: Center(child: Text('kadfsjllsd'))),
          ],
        ),
      ),
    );
  }
}
