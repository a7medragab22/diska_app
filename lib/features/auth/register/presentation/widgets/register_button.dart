import 'package:diska_app/core/utils/custom_button.dart';
import 'package:diska_app/features/auth/register/logic/cubits/register_cubit/register_cubit.dart';
import 'package:diska_app/features/auth/register/logic/cubits/register_cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RegisterButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return CustomButton(
          text: 'انشاء الحساب',
          onPressed: state.isLoading ? null : onPressed,
        );
      },
    );
  }
}
