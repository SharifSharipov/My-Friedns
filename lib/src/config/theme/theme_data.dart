import 'dart:ui';
import 'package:flutter/material.dart';

final primaryColor = const Color(0xFFF82B10);
final themeData = ThemeData(
  primaryColor: primaryColor,
  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
  scaffoldBackgroundColor: const Color(0xffeff1f3),
  useMaterial3: true,
  textTheme: const TextTheme(
      titleMedium: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)
  ),
);