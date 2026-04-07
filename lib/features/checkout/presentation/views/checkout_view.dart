import 'package:diska_app/core/utils/footer.dart';
import 'package:diska_app/core/utils/top_bar.dart';
import 'package:diska_app/features/checkout/presentation/widgets/address_section.dart';
import 'package:diska_app/features/checkout/presentation/widgets/delivery_section.dart';
import 'package:diska_app/features/checkout/presentation/widgets/payment_section.dart';
import 'package:diska_app/features/checkout/presentation/widgets/summary_section.dart';
import 'package:flutter/material.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 237, 237),
      body: SafeArea(
        child: Column(
          children: [
            TopBar(),   
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: AddressSection()),
                  SliverToBoxAdapter(child: DeliverySection()),
                  SliverToBoxAdapter(child: PaymentSection()),
                  SliverToBoxAdapter(child: SummarySection()),
                  SliverToBoxAdapter(child: FooterSection()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
