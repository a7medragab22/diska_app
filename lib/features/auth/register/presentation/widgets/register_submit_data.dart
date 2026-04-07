import 'package:diska_app/core/utils/custom_button.dart';
import 'package:diska_app/features/auth/register/data/models/register_model.dart';
import 'package:diska_app/features/auth/register/logic/cubits/register_cubit/register_cubit.dart';
import 'package:diska_app/features/auth/register/logic/cubits/register_cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterSubmitData extends StatelessWidget {
  final TextEditingController name;
  final TextEditingController phone;
  final TextEditingController password;
  final TextEditingController business;
  final TextEditingController commercial;
  final TextEditingController tax;

  const RegisterSubmitData({
    super.key,
    required this.name,
    required this.phone,
    required this.password,
    required this.business,
    required this.commercial,
    required this.tax,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return CustomButton(
          text: 'إنشاء الحساب',
          onPressed: state.isLoading
              ? null
              : () {
                  context.read<RegisterCubit>().register(
                    RegisterModel(
                      name: name.text,
                      phone: phone.text,
                      password: password.text,
                      role: state.isMerchant ? "merchant" : "customer",
                      businessName: business.text,
                      commercialRegister: commercial.text,
                      taxCard: tax.text,
                    ),
                  );
                },
        );
      },
    );
  }
}
