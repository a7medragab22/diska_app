import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppConstants {
  AppConstants._();

  static const String baseUrl = 'https://diska.online';
  static const String appName = 'DISKA';
  static const String appTagline = 'التجارة بقت هنا';
  // static const String logoUrl = '$baseUrl/images/logo2.png';
  // static const String percentUrl = '$baseUrl/images/precent.png';

  static double get paddingS => 8.w;
  static double get paddingM => 16.w;
  static double get paddingL => 24.w;

  static double get radiusS => 6.r;
  static double get radiusM => 12.r;
  static double get radiusL => 20.r;

  static double get bannerHeight => 200.h;
  static double get productCardWidth => 170.w;
  static double get productCardHeight => 268.h;
  static double get categoryCardSize => 90.w;
}
