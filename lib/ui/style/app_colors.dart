import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color background = Color(0xFF131316);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF575B66);
  static const Color greyLight = Color(0xFFB9C1D9);
  static const Color greyDark = Color(0xFF2C2C33);
  static const Color watchlistItemColor = Color(0xFF18181C);
  static const Color green = Color(0xFF40BF6A);
  static const Color red = Color(0xFFDF2040);

  static const Color appBarBackground = Color(0xFF212126);
  static const Color appBarDash = Color(0xFF585866);

  static List<Color> greenButtonLinearGradientColors = [
    const Color(0xFF24936E),
    const Color(0xFF268F87),
    const Color(0xFF288C9E),
  ];

  static List<Color> greenLinearGradientColors = [
    const Color(0xFF40BF6A).withOpacity(0.4),
    const Color(0xFF40BF6A).withOpacity(0.1),
    const Color(0xFF40BF6A).withOpacity(0),
  ];

  static List<Color> cardLinearGradientColors = [
    const Color(0xFF18241F),
    const Color(0xFF1A2B22),
    const Color(0xFF182423),
    const Color(0xFF14212A),
    const Color(0xFF13212F),
    const Color(0xFF112236),
  ];

  static List<Color> dividerLinearGradientColors = [
    AppColors.white.withOpacity(0),
    AppColors.grey.withOpacity(0.5),
    AppColors.white.withOpacity(0),
  ];
}
