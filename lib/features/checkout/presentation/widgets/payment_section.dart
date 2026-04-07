import 'package:diska_app/core/themes/app_colors.dart';
import 'package:diska_app/features/checkout/data/model/checkout_model.dart';
import 'package:diska_app/features/checkout/logic/cubits/checkout_cubit/checkout_cubit.dart';
import 'package:diska_app/features/checkout/logic/cubits/checkout_cubit/checkout_state.dart';
import 'package:diska_app/features/checkout/presentation/widgets/section_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        final cubit = context.read<CheckoutCubit>();
        final model = cubit.model;

        return SectionCard(
          title: "الدفع",
          icon: Icons.account_balance_wallet_outlined,
          child: Column(
            children: [
              _item(
                title: "دفع عند الاستلام",
                selected: model.paymentMethod == PaymentMethod.cashOnDelivery,
                onTap: () => cubit.changePayment(PaymentMethod.cashOnDelivery),
                icon: FontAwesomeIcons.moneyBill1Wave,
              ),
              SizedBox(height: 10.h),
              _item(
                title: "تحويل بنكي",
                selected: model.paymentMethod == PaymentMethod.bankTransfer,
                onTap: () => cubit.changePayment(PaymentMethod.bankTransfer),
                icon: FontAwesomeIcons.buildingColumns,
              ),
              if (model.paymentMethod == PaymentMethod.bankTransfer) ...[
                SizedBox(height: 10.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "بيانات الحساب البنكي:",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                              color: AppColors.primaryDark,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          FaIcon(
                            FontAwesomeIcons.nfcDirectional,
                            size: 14.sp,
                            color: AppColors.primaryYellow,
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      _CustomRow(
                        headerName: 'اسم البنك : ',
                        detailName: 'البنك الاهلي المصري',
                      ),
                      SizedBox(height: 4.h),
                      _CustomRow(
                        headerName: 'اسم الحساب : ',
                        detailName: 'السمان للتصدير',
                      ),
                      SizedBox(height: 4.h),
                      _CustomRow(
                        headerName: 'IBAN : ',
                        detailName: '4393172138145900010',
                      ),
                      SizedBox(height: 4.h),
                      _CustomRow(
                        headerName: 'سويفت كود : ',
                        detailName: '21381459',
                      ),
                      SizedBox(height: 4.h),
                      _CustomRow(
                        headerName: 'الفرع : ',
                        detailName: 'السنبلاوين',
                      ),
                      SizedBox(height: 4.h),
                      Divider(),
                      Text(
                        textDirection: TextDirection.rtl,
                        '⚠️ يرجي تحويل اجماي المبلغ علي هذا الحساب لاكمال وتأكيد طلبك.',
                        style: TextStyle(color: Colors.red, fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _item({
    required String title,
    required bool selected,
    required VoidCallback onTap,
    required FaIconData icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.primaryYellow.withValues(alpha: .15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? AppColors.primaryYellow : AppColors.border,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            if (selected)
              Icon(Icons.check, color: AppColors.primaryYellow)
            else
              SizedBox(width: 24),
            Spacer(),
            Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(width: 6.w),
            FaIcon(icon),
          ],
        ),
      ),
    );
  }
}

class _CustomRow extends StatelessWidget {
  const _CustomRow({required this.headerName, required this.detailName});
  final String headerName;
  final String detailName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(detailName, style: TextStyle(fontSize: 10.sp)),
        Text(
          textDirection: TextDirection.rtl,
          headerName,
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
