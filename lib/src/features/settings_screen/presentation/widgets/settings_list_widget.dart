import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:my_freends/src/config/theme/theme_data.dart';
import 'package:my_freends/src/core/colors/app_colors.dart';
import 'package:my_freends/src/core/icons/app_icons.dart';
import 'package:my_freends/src/features/settings_screen/presentation/widgets/base_container.dart';

class SettingsListCard extends StatelessWidget {
  final String text;
  final double size;
  final String iconOne;
  final VoidCallback onTap;
  const SettingsListCard({
    super.key,
    required this.text,
    required this.size,
    required this.onTap,
    required this.iconOne,
  });
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
      child: BaseContainer(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        radius: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: AppColors.mainBlue.withOpacity(0.3)),
                  width: width / 10.3,
                  height: width / 10.3,
                  child: SvgPicture.asset(iconOne,height:width / 20,width: width / 20,),
                ),
                const Gap(10),
                Text(
                  text,
                  style: themeData.textTheme.titleMedium?.copyWith(fontSize: size),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: AppColors.darkGrey.withOpacity(0.3)),
              width: width / 12.11,
              height: width / 12.11,
              child:  IconButton(
                icon: SvgPicture.asset(AppIcons.vector,height:width / 20,width: width / 20,),
                onPressed: onTap,
              ),),
          ],
        ),
      ),
    );
  }
}
