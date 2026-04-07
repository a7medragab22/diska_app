import 'package:diska_app/core/utils/label.dart';
import 'package:diska_app/features/checkout/logic/cubits/checkout_cubit/checkout_cubit.dart';
import 'package:diska_app/features/checkout/presentation/widgets/section_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressSection extends StatefulWidget {
  const AddressSection({super.key});

  @override
  State<AddressSection> createState() => _AddressSectionState();
}

class _AddressSectionState extends State<AddressSection> {
  String? selectedGovernorate;
  String? selectedCity;

  static const List<String> governorates = [
    'القاهرة',
    'الإسكندرية',
    'الجيزة',
    'المنوفية',
    'القليوبية',
    'الإسماعيلية',
    'السويس',
    'بورسعيد',
    'دمياط',
    'الشرقية',
    'الدقهلية',
    'كفر الشيخ',
    'الغربية',
    'البحيرة',
    'مطروح',
    'بني سويف',
    'الفيوم',
    'المنيا',
    'أسيوط',
    'سوهاج',
    'قنا',
    'الأقصر',
    'أسوان',
    'البحر الأحمر',
    'الوادي الجديد',
    'جنوب سيناء',
    'شمال سيناء',
  ];

  static const Map<String, List<String>> cities = {
    'القاهرة': ['القاهرة', 'الجيزة', 'الزمالك', 'مدينة نصر', 'هليوبوليس'],
    'الإسكندرية': ['الإسكندرية', 'برج العرب', 'أبو قير', 'ستانلي'],
    'الجيزة': ['الجيزة', 'الهرم', 'أوسيم', 'إمبابة'],
    'المنوفية': ['شبين الكوم', 'منوف', 'أشمون', 'الباجور'],
    'القليوبية': ['بنها', 'قليوب', 'شبرا الخيمة', 'الخانكة'],
    'الإسماعيلية': ['الإسماعيلية', 'فايد', 'القنطرة شرق'],
    'السويس': ['السويس', 'العريش', 'الطور'],
    'بورسعيد': ['بورسعيد', 'بورفؤاد'],
    'دمياط': ['دمياط', 'فارسكور'],
    'الشرقية': ['الزقازيق', 'العبور', 'منيا القمح'],
    'الدقهلية': ['المنصورة', 'ميت غمر', 'دكرنس'],
    'كفر الشيخ': ['كفر الشيخ', 'دسوق', 'فوه'],
    'الغربية': ['طنطا', 'المحلة الكبرى', 'زفتى'],
    'البحيرة': ['دمنهور', 'كفر الدوار', 'إدكو'],
    'مطروح': ['مرسى مطروح', 'الساحل الشمالي'],
    'بني سويف': ['بني سويف', 'الفشن', 'إهناسيا'],
    'الفيوم': ['الفيوم', 'سنورس', 'طامية'],
    'المنيا': ['المنيا', 'مغاغة', 'بني مزار'],
    'أسيوط': ['أسيوط', 'ديروط', 'منفلوط'],
    'سوهاج': ['سوهاج', 'أخميم', 'جرجا'],
    'قنا': ['قنا', 'نجع حمادي', 'دشنا'],
    'الأقصر': ['الأقصر', 'إسنا', 'أرمنت'],
    'أسوان': ['أسوان', 'إدفو', 'كوم أمبو'],
    'البحر الأحمر': ['الغردقة', 'شرم الشيخ', 'سفاجا'],
    'الوادي الجديد': ['الخارجة', 'الداخلة', 'الفرافرة'],
    'جنوب سيناء': ['شرم الشيخ', 'دهب', 'نويبع'],
    'شمال سيناء': ['العريش', 'رفح', 'الشيخ زويد'],
  };

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CheckoutCubit>();

    return SectionCard(
      title: "عنوان الشحن",
      icon: Icons.location_on_outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Label(
            hint: 'عميل',
            labelName: "الاسم / اسم المحل",
            controller: cubit.nameController,
          ),
          Label(
            hint: '01091244780',
            labelName: "رقم الهاتف",
            controller: cubit.phoneController,
          ),

          Text(
            "المحافظة",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xff0B1A2B),
            ),
          ),
          SizedBox(height: 6.h),
          _dropdown("اختر", governorates, selectedGovernorate, (v) {
            setState(() {
              selectedGovernorate = v;
              selectedCity = null; // Reset city when governorate changes
            });
          }),

          Text(
            "المدينة / المنطقة",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xff0B1A2B),
            ),
          ),
          SizedBox(height: 6.h),
          _dropdown(
            "اختر المحافظة أولاً",
            selectedGovernorate != null ? cities[selectedGovernorate]! : [],
            selectedCity,
            (v) {
              setState(() {
                selectedCity = v;
              });
            },
          ),
          Label(
            hint: "اسم الشارع، رقم العقار، علامة مميزة",
            labelName: "العنوان بالتفصيل",
            maxLines: 2,
            controller: cubit.addressController,
          ),
          Label(
            hint: "مثال: يرجى الاتصال قبل الوصول بساعة",
            labelName: "ملاحظات للتوصيل (اختياري)",
            controller: cubit.notesController,
            maxLines: 2,
          ),
        ],
      ),
    );
  }

  Widget _dropdown(
    String hint,
    List<String> options,
    String? value,
    Function(String?) onChanged,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey.shade500),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(hint, textAlign: TextAlign.right),
          value: value,
          items: options
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(e),
                  ),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
