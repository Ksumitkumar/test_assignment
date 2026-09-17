import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class AppTypography {
  static TextStyle header = GoogleFonts.inter(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
  );

  static TextStyle subheader = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
  );

  static TextStyle body = GoogleFonts.inter(
    fontSize: 14,
    color: AppColors.primaryText,
  );

  static TextStyle caption = GoogleFonts.inter(
    fontSize: 12,
    color: AppColors.secondaryText,
  );

  static TextStyle button = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
  );
}
