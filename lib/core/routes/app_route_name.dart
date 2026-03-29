import 'package:diska_app/core/routes/app_route.dart';
import 'package:diska_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

class AppRouteName {
  static Map<String, WidgetBuilder> routes = {
    AppRoute.homeView: (context) => const HomeView(),
  };
}
