import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTypography {
  static const TextStyle header = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
  );

  static const TextStyle subheader = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    color: AppColors.primaryText,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: AppColors.secondaryText,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}
