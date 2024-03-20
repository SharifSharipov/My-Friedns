import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_freends/src/core/colors/app_colors.dart';
import 'package:my_freends/src/features/add_screen/presentation/pages/add_screen.dart';
import 'package:my_freends/src/features/chat_screen/presentation/pages/chat_screen.dart';
import 'package:my_freends/src/features/deveice_screen/presentation/pages/divice_screen.dart';
import 'package:my_freends/src/features/home_screen/presentation/pages/home_screen.dart';
import 'package:my_freends/src/features/settings_screen/presentation/pages/setting_screen.dart';
import 'package:my_freends/src/features/tab_screen/presentation/manager/cubit/tab_cubit.dart';
import '../../../../core/icons/app_icons.dart';
class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  static List<Widget> screens = [];
  @override
  void initState() {
    screens = const [
      DeviceScreen(),
      AddScreen(),
      HomeScreen(),
      ChatScreen(),
      SettingsScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: context.watch<TabCubit>().state,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:  [
          BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.device), label: "Устройства"),
          BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.add), label: "Добавить"),
          BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.home), label: "Главная"),
          BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.chatLine), label: "Чат"),
          BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.settings), label: "Настройки"),
        ],
        currentIndex: context.read<TabCubit>().state,
        onTap: context.read<TabCubit>().changeTabIndex,
        // Remove fixedColor
        backgroundColor: AppColors.c_FEFEFE,
        //fixedColor: AppColors.c_2DA4BA,
        type: BottomNavigationBarType.fixed,
        // Keep selectedItemColor
        selectedItemColor: AppColors.mainBlue,
        unselectedItemColor: AppColors.lightGrey,
      ),
    );
  }
}