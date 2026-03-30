import 'package:diska_app/core/routes/app_route.dart';
import 'package:diska_app/features/home/logic/cubits/offer_cubit/offer_cubit.dart';
import 'package:diska_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouteName {
  static Map<String, WidgetBuilder> routes = {
    AppRoute.homeView: (context) => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => OfferCubit())],
      child: const HomeView(),
    ),
  };
}
