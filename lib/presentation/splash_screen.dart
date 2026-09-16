import 'package:flutter/material.dart';
import 'package:test_assignment/core/app_strings.dart';
import 'package:test_assignment/core/app_spacing.dart';
import 'package:test_assignment/core/app_typography.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: AppSpacing.paddingScreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppStrings.splashText, style: AppTypography.body),
              AppSpacing.vGapMd,
            ],
          ),
        ),
      ),
    );
  }
}
