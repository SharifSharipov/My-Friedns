import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_freends/src/config/theme/theme_data.dart';
import 'package:my_freends/src/core/colors/app_colors.dart';
import 'package:my_freends/src/core/icons/app_icons.dart';
import 'package:my_freends/src/features/settings_screen/presentation/widgets/divider_widget.dart';
import 'package:my_freends/src/features/settings_screen/presentation/widgets/settings_list_widget.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(height: 70),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(66),
                    border: Border.all(
                      color: AppColors.mainPink,
                      width: 2,
                    ),
                  ),
                  width: 132,
                  height: 132,
                  child: Image.asset(
                    AppIcons.mariya,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Мария",
                  style: TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w600, color: AppColors.darkGrey),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: ZoomTapAnimation(
                    onTap: () {},
                    child: Container(
                      width: width / 2.31,
                      height: height / 25.375,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.mainBlue.withOpacity(0.15),
                        border: Border.all(
                          color: AppColors.mainBlue,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            AppIcons.pencil,
                            height: width / 20,
                            width: width / 20,
                          ),
                          const Text(
                            "Редактировать",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: AppColors.mainBlue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SettingsListCard(
                  text: "Статистика",
                  size: 20,
                  onTap: () {},
                  iconOne: AppIcons.statistics,
                ),
                const LineDivider(),
                SettingsListCard(
                  text: "Уведомления",
                  size: 20,
                  onTap: () {},
                  iconOne: AppIcons.notification,
                ),
                const LineDivider(),
                SettingsListCard(
                  text: "Конфиденциальность",
                  size: 20,
                  onTap: () {},
                  iconOne: AppIcons.lock,
                ),
                SizedBox(
                  height: height / 40,
                ),
                SettingsListCard(
                  text: "Премиум-доступ",
                  size: 20,
                  onTap: () {},
                  iconOne: AppIcons.premium,
                ),
                const LineDivider(),
                SettingsListCard(
                  text: "Поддержка",
                  size: 20,
                  onTap: () {},
                  iconOne: AppIcons.support,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: ZoomTapAnimation(
                    onTap: () {},
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: width / 2.72,
                        height: height / 15.92,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.mainPink.withOpacity(0.15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(
                              AppIcons.logout,
                              height: width / 20,
                              width: width / 20,
                            ),
                            Text(
                              "Выход",
                              style: themeData.textTheme.titleMedium?.copyWith(fontSize: 20),
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
        ],
      ),
    );
    ;
  }
}
