import 'package:diska_app/core/routes/app_route.dart';
import 'package:diska_app/features/auth/forget_password/presentation/views/forget_password_view.dart';
import 'package:diska_app/features/auth/login/data/repos/log_in_repo_impl.dart';
import 'package:diska_app/features/auth/login/logic/cubits/log_in_cubit/log_in_cubit.dart';
import 'package:diska_app/features/auth/new_password/presentation/views/new_password_view.dart';
import 'package:diska_app/features/auth/login/presentation/views/log_in_view.dart';
import 'package:diska_app/features/auth/register/data/repos/register_repo_impl.dart';
import 'package:diska_app/features/auth/register/logic/cubits/register_cubit/register_cubit.dart';
import 'package:diska_app/features/auth/register/presentation/views/register_view.dart';
import 'package:diska_app/features/cart/presentation/views/cart_view.dart';
import 'package:diska_app/features/checkout/logic/cubits/checkout_cubit/checkout_cubit.dart';
import 'package:diska_app/features/checkout/presentation/views/checkout_view.dart';
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
    AppRoute.logInView: (context) => BlocProvider(
      create: (context) => LogInCubit(LogInRepoImpl()),
      child: LoginView(),
    ),
    AppRoute.forgetPasswordView: (context) => const ForgetPasswordView(),

    AppRoute.newPasswordView: (context) => const NewPasswordView(),
    AppRoute.registerView: (context) => BlocProvider(
      create: (_) => RegisterCubit(RegisterRepoImpl()),
      child: RegisterView(),
    ),
    AppRoute.checkoutView: (context) =>
        BlocProvider(create: (_) => CheckoutCubit(), child: CheckoutView()),
  };
}
