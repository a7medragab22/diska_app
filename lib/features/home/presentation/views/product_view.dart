import 'package:diska_app/features/home/logic/cubits/product_cubit/product_cubit.dart';
import 'package:diska_app/features/home/logic/cubits/product_cubit/product_state.dart';
import 'package:diska_app/features/home/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 24),
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        if (state is ProductLoaded) {
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ProductCard(product: state.products[index], index: index);
            }, childCount: state.products.length),
          );
        }

        if (state is ProductError) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(child: Text(state.message)),
            ),
          );
        }

        return const SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}
