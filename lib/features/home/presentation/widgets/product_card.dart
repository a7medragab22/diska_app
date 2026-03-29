import 'package:diska_app/core/constantse/app_constants.dart';
import 'package:diska_app/core/themes/app_colors.dart';
import 'package:diska_app/core/themes/app_text_styles.dart';
import 'package:diska_app/features/home/data/models/home_models.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onWishlist;

  const ProductCard({
    super.key,
    required this.product,
    required this.quantity,
    required this.onAdd,
    required this.onIncrement,
    required this.onDecrement,
    required this.onWishlist,
  });

  String _formatPrice(double price) {
    if (price >= 1000) {
      final thousands = (price ~/ 1000);
      final remainder = (price % 1000).toStringAsFixed(0).padLeft(3, '0');
      return '$thousands٬$remainder ج.م';
    }
    return '${price.toStringAsFixed(0)} ج.م';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstants.productCardWidth,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Image + badges ──
          Stack(
            children: [
              SizedBox(
                height: 130,
                width: double.infinity,
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: AppColors.surfaceGrey,
                    child: const Icon(
                      Icons.image_outlined,
                      color: AppColors.textLight,
                      size: 40,
                    ),
                  ),
                ),
              ),
              if (product.discountPercent != null)
                Positioned(
                  top: 8,
                  left: 8,
                  child: _Badge(
                    'خصم ${product.discountPercent}%',
                    AppColors.discountBadge,
                  ),
                ),
              if (product.isBestSeller)
                Positioned(
                  top: 8,
                  left: 8,
                  child: _Badge('الأكثر مبيعاً', AppColors.bestSellerBadge),
                ),
              Positioned(
                top: 6,
                right: 6,
                child: GestureDetector(
                  onTap: onWishlist,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.favorite_border_rounded,
                      size: 16,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // ── Info ──
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    product.categoryName,
                    style: AppTextStyles.bodySmall,
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    product.name,
                    style: AppTextStyles.productName,
                    textAlign: TextAlign.right,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  // Price row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      if (product.oldPrice != null) ...[
                        Text(
                          _formatPrice(product.oldPrice!),
                          style: AppTextStyles.oldPrice,
                        ),
                        const SizedBox(width: 4),
                      ],
                      Text(
                        _formatPrice(product.price),
                        style: AppTextStyles.price,
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Availability
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        product.isAvailable ? 'متوفر' : 'غير متوفر',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: product.isAvailable
                              ? AppColors.availableColor
                              : AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.circle,
                        size: 8,
                        color: product.isAvailable
                            ? AppColors.availableColor
                            : AppColors.primary,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Quantity + Add
                  _QuantityRow(
                    quantity: quantity,
                    onAdd: onAdd,
                    onIncrement: onIncrement,
                    onDecrement: onDecrement,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final Color color;
  const _Badge(this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppConstants.radiusS),
      ),
      child: Text(label, style: AppTextStyles.badge.copyWith(fontSize: 10)),
    );
  }
}

class _QuantityRow extends StatelessWidget {
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  const _QuantityRow({
    required this.quantity,
    required this.onAdd,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onAdd,
            child: Container(
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(AppConstants.radiusS),
              ),
              alignment: Alignment.center,
              child: Text(
                'أضف',
                style: AppTextStyles.badge.copyWith(fontSize: 12),
              ),
            ),
          ),
        ),
        const SizedBox(width: 6),
        Container(
          height: 32,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(AppConstants.radiusS),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _QtyBtn(icon: Icons.add, onTap: onIncrement),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  '$quantity',
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              _QtyBtn(icon: Icons.remove, onTap: onDecrement),
            ],
          ),
        ),
      ],
    );
  }
}

class _QtyBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _QtyBtn({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 28,
        height: 32,
        child: Icon(icon, size: 14, color: AppColors.textSecondary),
      ),
    );
  }
}
