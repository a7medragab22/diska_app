import 'package:diska_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/offer_model.dart';

class OfferCard extends StatefulWidget {
  final OfferModel offer;

  const OfferCard({super.key, required this.offer});

  @override
  State<OfferCard> createState() => _OfferCardState();
}

class _OfferCardState extends State<OfferCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: -5,
      end: 5,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        color: AppColors.primaryDark,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// 🔥 الصورة بالأنيميشن
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _animation.value),
                child: child,
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: widget.offer.image.startsWith('http')
                  ? Image.network(
                      widget.offer.image,
                      height: 200.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return SizedBox(
                          height: 200.h,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 200.h,
                          width: double.infinity,
                          color: Colors.grey.shade800,
                          child: const Center(
                            child: Icon(
                              Icons.broken_image,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    )
                  : Image.asset(
                      widget.offer.image,
                      height: 200.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),
          ),

          SizedBox(height: 24.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: AppColors.discountBadge,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              '🔥 عروض حصرية',
              style: TextStyle(color: AppColors.surface, fontSize: 12.sp),
            ),
          ),
          SizedBox(height: 16.h),

          /// Title
          Text(
            widget.offer.title,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.surface,
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 8.h),

          /// Description
          Text(
            widget.offer.description,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textLight, fontSize: 18.sp),
          ),
        ],
      ),
    );
  }
}
