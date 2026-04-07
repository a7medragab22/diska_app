import 'package:diska_app/features/auth/register/data/models/register_model.dart';
import 'package:diska_app/features/auth/register/logic/cubits/register_cubit/register_cubit.dart';
import 'package:diska_app/features/auth/register/presentation/widgets/custom_container.dart';
import 'package:diska_app/core/utils/label.dart';
import 'package:diska_app/features/auth/register/presentation/widgets/register_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerPremiumForm extends StatefulWidget {
  const CustomerPremiumForm({super.key});

  @override
  State<CustomerPremiumForm> createState() => _CustomerPremiumFormState();
}

class _CustomerPremiumFormState extends State<CustomerPremiumForm> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          Label(
            controller: nameController,
            hint: "الاسم بالكامل",
            labelName: 'الاسم بالكامل',
          ),
          Label(
            controller: phoneController,
            hint: '01*********',
            labelName: 'رقم الهاتف',
          ),
          Label(
            controller: passwordController,
            hint: '********',
            labelName: 'كلمة المرور',
          ),

          const SizedBox(height: 20),

          RegisterButton(
            onPressed: () {
              final cubit = context.read<RegisterCubit>();

              cubit.register(
                RegisterModel(
                  name: nameController.text,
                  phone: phoneController.text,
                  password: passwordController.text,
                  role: "customer", // 👈 هنا الفرق
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
