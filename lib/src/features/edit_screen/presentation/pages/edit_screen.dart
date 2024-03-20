import 'package:flutter/material.dart';
import 'package:my_freends/src/core/colors/app_colors.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../../core/icons/app_icons.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_text_widget.dart';
class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController controllerOne = TextEditingController();
  final TextEditingController controllerTwo = TextEditingController();
  final TextEditingController controllerThree = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            snap: true,
            floating: true,
            backgroundColor: theme.cardColor,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                ZoomTapAnimation(
                  onTap: () {},
                  child: const Text(
                    "Сохранить",
                    style: TextStyle(fontSize: 19, color: AppColors.mainBlue),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(66),
                  ),
                  width: 132,
                  height: 132,
                  child: Image.asset(
                    AppIcons.mariya,
                  ),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: ZoomTapAnimation(
                    onTap: () {},
                    child: const Text(
                      "Изменить фото",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.c_252525),
                    ),
                  ),
                ),
                const CustomTextWidget(
                  text: 'Имя',
                ),
                CustomTextField(
                  controller: controllerOne,
                  hintText: 'Мария',
                ),
                const CustomTextWidget(
                  text: 'Номер телефона',
                ),
                CustomTextField(
                  controller: controllerOne,
                  hintText: '+7 123 456789',
                ),
                const CustomTextWidget(
                  text: 'E-mail',
                ),
                CustomTextField(
                  controller: controllerOne,
                  hintText: 'example@gmaile.com',
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
