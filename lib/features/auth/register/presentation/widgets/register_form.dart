import 'package:diska_app/features/auth/register/logic/cubits/register_cubit/register_cubit.dart';
import 'package:diska_app/features/auth/register/logic/cubits/register_cubit/register_state.dart';
import 'package:diska_app/features/auth/register/presentation/widgets/customer_form.dart';
import 'package:diska_app/features/auth/register/presentation/widgets/merchant_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
        

            /// 🔥 هنا السحر
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child: state.isMerchant
                  ? const MerchantPremiumForm(key: ValueKey("merchant"))
                  : const CustomerPremiumForm(key: ValueKey("customer")),
            ),
          ],
        );
      },
    );
  }
}
