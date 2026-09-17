import 'package:flutter/material.dart';

class AppSpacing {
  // Numeric Padding Values
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lgs = 14.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xll = 24.0;
  static const double xxl = 30.0;
  static const double xxxl = 60.0;
  static const double xxll = 120.0;
  // EdgeInset Constants
  static const EdgeInsets paddingScreen = EdgeInsets.symmetric(horizontal: xl);
  static const EdgeInsets paddingCard = EdgeInsets.all(md);
  static const EdgeInsets paddingTile = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: sm,
  );

  // Standard Vertical Spacers
  static const Widget vGapXs = SizedBox(height: xs);
  static const Widget vGapSm = SizedBox(height: sm);
  static const Widget vGapMd = SizedBox(height: md);
  static const Widget vGapMds = SizedBox(height: lgs);

  static const Widget vGapLg = SizedBox(height: lg);
  static const Widget vGapXl = SizedBox(height: xl);
  static const Widget vGapXll = SizedBox(height: xll);

  static const Widget vGapXld = SizedBox(height: xxl);
  static const Widget vGapXxll = SizedBox(height: xxxl);

  static const Widget vGapXlll = SizedBox(height: xxll);

  // Standard Horizontal Spacers
  static const Widget hGapSm = SizedBox(width: sm);
  static const Widget hGapMd = SizedBox(width: md);
}
