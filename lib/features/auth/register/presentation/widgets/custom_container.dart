import 'package:diska_app/core/routes/app_route.dart';
import 'package:diska_app/features/auth/register/presentation/widgets/register_header.dart';
import 'package:diska_app/features/auth/register/presentation/widgets/register_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const RegisterHeader(
              title: 'إنشاء حساب جديد',
              subtitle: 'انضم لعائلة ديسكا وابدأ رحلتك معنا',
            ),
            const SizedBox(height: 20),
            const RegisterToggle(),
            const SizedBox(height: 20),
            child,
            Divider(color: Colors.grey.shade300),

            const SizedBox(height: 10),

            /// Register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushReplacementNamed(
                    context,
                    AppRoute.logInView,
                  ),
                  child: Text(
                    "تسجيل الدخول",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0B1A2B),
                    ),
                  ),
                ),
                SizedBox(width: 4.h),
                Text("لديك حساب بالفعل؟"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
