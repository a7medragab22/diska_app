import 'package:diska_app/core/routes/app_route.dart';
import 'package:diska_app/features/cart/presentation/views/cart_view.dart';
import 'package:diska_app/features/favourites/presentation/views/fav_view.dart';
import 'package:diska_app/features/home/logic/cubits/category_cubit/category_cubit.dart';
import 'package:diska_app/features/home/logic/cubits/offer_cubit/offer_cubit.dart';
import 'package:diska_app/features/home/presentation/views/home_view.dart';
import 'package:diska_app/features/notifications/presentation/views/notification_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouteName {
  static Map<String, WidgetBuilder> routes = {
    AppRoute.homeView: (context) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OfferCubit()),
        BlocProvider(create: (context) => CategoryCubit()..loadCategories()),
      ],
      child: const HomeView(),
    ),
    AppRoute.cartView: (context) => const CartView(),
    AppRoute.notificationsView: (context) => const NotificationView(),
    AppRoute.favoritesView: (context) => const FavView(),
  };
}
