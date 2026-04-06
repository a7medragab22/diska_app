import 'package:diska_app/core/themes/app_colors.dart';
import 'package:diska_app/features/auth/register/logic/cubits/register_cubit/register_cubit.dart';
import 'package:diska_app/features/auth/register/logic/cubits/register_cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterToggle extends StatelessWidget {
  const RegisterToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();

        return Container(
          height: 80.h,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              _item(
                title: "عميل / مشتري",
                active: !state.isMerchant,
                onTap: () => cubit.toggleRole(false),
                icon: Icons.person,
              ),
              _item(
                title: "تاجر / مورد",
                active: state.isMerchant,
                onTap: () => cubit.toggleRole(true),
                icon: Icons.store,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _item({
    required String title,
    required bool active,
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(vertical: 24.h),
          decoration: BoxDecoration(
            color: active ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: active ? AppColors.primaryDark : Colors.grey,
                ),
              ),
              SizedBox(width: 4.w),
              Icon(icon, color: active ? AppColors.primaryDark : Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
