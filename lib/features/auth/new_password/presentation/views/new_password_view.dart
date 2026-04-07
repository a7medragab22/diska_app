import 'package:diska_app/core/themes/app_colors.dart';
import 'package:diska_app/core/utils/custom_button.dart';
import 'package:diska_app/core/utils/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
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
                            radius: 40,
                            backgroundColor: Colors.grey.shade400,
                            foregroundColor: AppColors.primaryDark,
                            child: FaIcon(FontAwesomeIcons.key, size: 24),
                          ),
                        ),

                        const SizedBox(height: 25),

                        /// Title
                        Center(
                          child: Text(
                            'كلمة المرور الجديدة',
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
                            'ادخل كلمة المرور الجديده لحسابك',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),

                        const SizedBox(height: 25),

                        /// Phone Label
                        const Text(
                          "كلمة المرور الجديدة",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff0B1A2B),
                          ),
                        ),

                        const SizedBox(height: 8),
                        CustomTextFeild(
                          controller: controller,
                          hint: '********',
                        ),

                        /// Phone Field
                        const SizedBox(height: 18),

                        /// Password Label
                        const Text(
                          "تأكيد كلمة المرور",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryDark,
                          ),
                        ),

                        const SizedBox(height: 8),
                        CustomTextFeild(
                          hint: '********',
                          controller: controller,
                        ),

                        SizedBox(height: 32.h),
                        CustomButton(
                          text: 'حفظ التغيير',
                          faIcon: FontAwesomeIcons.circleCheck,
                          isFaicon: true,
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
