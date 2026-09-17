import 'package:flutter/material.dart';
import 'package:test_assignment/core/app_strings.dart';

import '../core/app_color.dart';
import '../core/app_spacing.dart';
import '../core/app_typography.dart';

class BookHotelScreen extends StatelessWidget {
  const BookHotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // 1. Dark Base Background
          Container(
            color: AppColors.background,
          ),

          // 2. Top-Right Cyan Glow
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(1.2, -1.0),
                  radius: 1.2,
                  colors: [
                    AppColors.topRightColor,
                    AppColors.transColor,
                  ],
                  stops: [0.0, 1.0],
                ),
              ),
            ),
          ),

          // 3. Bottom-Left Cyan Glow
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(-1.2, 1.0),
                  radius: 1.2,
                  colors: [
                    AppColors.bottomLeftColor,
                    AppColors.transColor,
                  ],
                  stops: [0.0, 1.0],
                ),
              ),
            ),
          ),

          // 4. Foreground Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSpacing.vGapXll,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.nightStayHeader,
                            style: AppTypography.header,
                          ),
                          AppSpacing.vGapXs,
                          Text(
                            AppStrings.stayDatesSubtitle,
                            style: AppTypography.caption,
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          AppStrings.cancelDate,
                          style: TextStyle(color: AppColors.badgeYellow),
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.vGapXxll,
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.darkColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.primaryText.withOpacity(0.06),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          AppStrings.bookingDate,
                          style: AppTypography.subheader,
                        ),
                        AppSpacing.vGapLg,
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 7,
                          ),
                          itemCount: 31,
                          itemBuilder: (context, i) {
                            return Center(
                              child:
                                  Text("${i + 1}", style: AppTypography.body),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  AppSpacing.vGapLg,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Left Arrow Button
                      IconButton(
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          backgroundColor:
                              AppColors.primaryBlue, // Your cyan color
                          shape: const CircleBorder(),
                          minimumSize: const Size(36, 36),
                        ),
                        icon: const Icon(
                          Icons.chevron_left_rounded,
                          color: AppColors.primaryText,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Right Arrow Button
                      IconButton(
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          backgroundColor:
                              AppColors.primaryBlue, // Your cyan color
                          shape: const CircleBorder(),
                          minimumSize: const Size(36, 36),
                        ),
                        icon: const Icon(
                          Icons.chevron_right_rounded,
                          color: AppColors.primaryText,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
