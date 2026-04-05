import 'package:diska_app/core/routes/app_route.dart';
import 'package:diska_app/core/themes/app_colors.dart';
import 'package:diska_app/core/utils/custom_button.dart';
import 'package:diska_app/core/utils/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      body: SafeArea(
        child: Column(
          children: [
            /// 🔥 Top Gradient Line
            Container(
              height: 6,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff0B1A2B), Color(0xffC9A227)],
                ),
                boxShadow: [
                
                ]
              ),
            ),

            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 32.r,
                            backgroundColor: Colors.grey.shade400,
                            foregroundColor: AppColors.primaryDark,
                            child: FaIcon(FontAwesomeIcons.lock, size: 20.sp),
                          ),
                        ),
                        const SizedBox(height: 25),

                        /// Title
                        Center(
                          child: Text(
                            'استعادة كلمة المرور',
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryDark,
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),

                        /// Subtitle
                        const Center(
                          child: Text(
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            'ادخل رقم الهاتف المسجل لدينا وسنرسل لك\n .رمز التحقق لاستعادة حسابك',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),

                        const SizedBox(height: 25),

                        /// Phone Label
                        const Text(
                          "رقم الهاتف",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff0B1A2B),
                          ),
                        ),

                        const SizedBox(height: 8),
                        CustomTextFeild(
                          hint: '01xxxxxxxxx',
                          controller: controller,
                        ),

                        const SizedBox(height: 15),

                        /// Button
                        CustomButton(
                          faIcon: FontAwesomeIcons.arrowLeft,
                          isFaicon: true,
                          text: 'إرسال رمز التحقق',
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRoute.newPasswordView,
                            );
                          },
                        ),
                        const SizedBox(height: 20),

                        Divider(color: Colors.grey.shade300),

                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('العودة لتسجيل الدخول'),
                              SizedBox(width: 4.w),
                              FaIcon(FontAwesomeIcons.arrowRight, size: 12.sp),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
