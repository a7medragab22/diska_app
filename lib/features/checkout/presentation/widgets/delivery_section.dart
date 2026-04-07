import 'package:diska_app/features/checkout/presentation/widgets/section_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliverySection extends StatefulWidget {
  const DeliverySection({super.key});

  @override
  State<DeliverySection> createState() => _DeliverySectionState();
}

class _DeliverySectionState extends State<DeliverySection> {
  String? selectedTime;

  final List<String> timeOptions = [
    "أي وقت (خلال اليوم)",
    "(ص10 - م4) صباحاً",
    "(م4 - م10) مساءً",
  ];

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: "التوصيل",
      icon: Icons.access_time,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "الوقت المفضل",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xff0B1A2B),
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.grey.shade500),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                hint: Text("أي وقت (خلال اليوم)"),
                value: selectedTime,
                selectedItemBuilder: (BuildContext context) {
                  return timeOptions.map<Widget>((String item) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item),
                        Icon(
                          selectedTime == item
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color: selectedTime == item
                              ? Colors.green
                              : Colors.grey,
                        ),
                      ],
                    );
                  }).toList();
                },
                items: timeOptions
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
                onChanged: (v) {
                  setState(() {
                    selectedTime = v;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
