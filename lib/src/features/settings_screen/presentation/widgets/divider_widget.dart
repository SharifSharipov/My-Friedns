import 'package:flutter/material.dart';
import 'package:my_freends/src/core/colors/app_colors.dart';
class LineDivider extends StatelessWidget {
  const LineDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(/*vertical: 16,*/ horizontal: 16),
      child: Divider(
        color: AppColors.c_DEDEDE,
        thickness: 1,
      ),
    );
  }
}
