import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:my_freends/src/core/colors/app_colors.dart';
class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.controller, required this.hintText});
  final TextEditingController controller;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child:TextField(
        maxLines: 1,
        controller: controller,
        style: const TextStyle(color: Colors.white, fontSize: 24),
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20), // Border radiusni qo'shish
              borderSide: const BorderSide(color: AppColors.darkGrey),
            ),
            focusedBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(20), // Border radiusni qo'shish
              borderSide: const BorderSide(color: AppColors.darkGrey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20), // Border radiusni qo'shish
              borderSide: const BorderSide(color: AppColors.darkGrey),
            ),
            hintText: hintText,
            hintStyle:  TextStyle(
                color: AppColors.darkGrey.withOpacity(0.5),
                fontWeight: FontWeight.w500,
                fontSize: 20
            )
        ),
      ),

    );
  }
}
