import 'package:diska_app/features/home/logic/cubits/category_cubit/category_cubit.dart';
import 'package:diska_app/features/home/logic/cubits/category_cubit/category_state.dart';
import 'package:diska_app/features/home/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is CategorySuccess) {
          return SliverPadding(
            padding: EdgeInsets.all(16.w),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return CategoryItem(category: state.categories[index]);
              }, childCount: state.categories.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 12.w,
                childAspectRatio: 0.8,
              ),
            ),
          );
        }

        return const SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}
