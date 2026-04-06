import 'package:diska_app/core/utils/custom_text_feild.dart';
import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label({
    super.key,
    required this.controller,
    required this.hint,
    required this.labelName,
  });
  final TextEditingController controller;
  final String hint;
  final String labelName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          textAlign: TextAlign.end,
          labelName,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xff0B1A2B),
          ),
        ),

        const SizedBox(height: 8),

        /// Phone Field
        CustomTextFeild(hint: hint, controller: controller),

        const SizedBox(height: 18),
      ],
    );
  }
}
