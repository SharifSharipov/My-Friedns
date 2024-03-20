import 'package:flutter/material.dart';

import '../../../../core/colors/app_colors.dart';
class CustomTextWidget extends StatelessWidget {
  final String text;
  const CustomTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Align(alignment: Alignment.centerLeft,child: Text(text,style :const TextStyle(
          fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.c_252525),),),
    );
  }
}
