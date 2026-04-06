import 'package:diska_app/features/auth/register/data/models/register_model.dart';
import 'package:diska_app/features/auth/register/logic/cubits/register_cubit/register_cubit.dart';
import 'package:diska_app/features/auth/register/presentation/widgets/custom_container.dart';
import 'package:diska_app/features/auth/register/presentation/widgets/label.dart';
import 'package:diska_app/features/auth/register/presentation/widgets/register_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MerchantPremiumForm extends StatefulWidget {
  const MerchantPremiumForm({super.key});

  @override
  State<MerchantPremiumForm> createState() => _MerchantPremiumFormState();
}

class _MerchantPremiumFormState extends State<MerchantPremiumForm> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final businessController = TextEditingController();
  final commercialController = TextEditingController();
  final taxController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    businessController.dispose();
    commercialController.dispose();
    taxController.dispose();
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
            hint: "01xxxxxxxx",
            labelName: "رقم الهاتف",
          ),
          Label(
            controller: businessController,
            hint: "",
            labelName: "اسم المحل / النشاط",
          ),
          Label(
            controller: commercialController,
            hint: "",
            labelName: "السجل التجاري",
          ),
          Label(
            controller: taxController,
            hint: "",
            labelName: "البطاقة الضريبية",
          ),
          Label(
            controller: passwordController,
            hint: '********',
            labelName: 'كلمة المرور',
          ),

          /// زرار التسجيل
          RegisterButton(
            onPressed: () {
              final cubit = context.read<RegisterCubit>();

              cubit.register(
                RegisterModel(
                  name: nameController.text,
                  phone: phoneController.text,
                  password: passwordController.text,
                  role: "merchant", // هنا ثابت
                  businessName: businessController.text,
                  commercialRegister: commercialController.text,
                  taxCard: taxController.text,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
