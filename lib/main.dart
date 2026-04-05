import 'package:diska_app/core/routes/app_route_name.dart';
import 'package:diska_app/features/cart/logic/cubits/cart_cubit/cart_cubit.dart';
import 'package:diska_app/features/favourites/logic/cubits/fav_cubit/fav_cubit.dart';
import 'package:diska_app/features/home/logic/cubits/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DiskaApp());
}

class DiskaApp extends StatelessWidget {
  const DiskaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => CartCubit()),
            BlocProvider(create: (_) => FavCubit()),
            BlocProvider(create: (_) => ProductCubit()..loadProducts()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: AppRouteName.routes,
            title: 'Diska',
            theme: ThemeData(primarySwatch: Colors.blue),
          ),
        );
      },
    );
  }
}
