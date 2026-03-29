import 'package:diska_app/core/constantse/app_constants.dart';
import 'package:diska_app/core/themes/app_colors.dart';
import 'package:diska_app/core/themes/app_text_styles.dart';
import 'package:diska_app/features/home/data/models/home_models.dart';
import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  final List<CategoryModel> categories;
  const CategoriesSection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: AppConstants.paddingM,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('تسوق حسب القسم', style: AppTextStyles.sectionTitle),
              TextButton(
                onPressed: () {},
                child: Text(
                  'عروض خاصة',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 118,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding:  EdgeInsets.symmetric(
              horizontal: AppConstants.paddingM,
            ),
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (_, i) => _CategoryCard(category: categories[i]),
          ),
        ),
      ],
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final CategoryModel category;
  const _CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            width: AppConstants.categoryCardSize,
            height: AppConstants.categoryCardSize,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppConstants.radiusM),
              border: Border.all(color: AppColors.border),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              category.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const Icon(
                Icons.image_outlined,
                color: AppColors.textLight,
                size: 32,
              ),
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: AppConstants.categoryCardSize,
            child: Text(
              category.name,
              style: AppTextStyles.categoryLabel,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
