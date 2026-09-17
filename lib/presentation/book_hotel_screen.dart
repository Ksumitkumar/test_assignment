import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_assignment/core/app_strings.dart';
import 'package:test_assignment/main.dart';

import '../core/app_color.dart';
import '../core/app_spacing.dart';
import '../core/app_typography.dart';

class BookHotelScreen extends StatelessWidget {
  final VoidCallback? onCancel;

  const BookHotelScreen({super.key, this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // 1. Dark Base Background
          Container(color: AppColors.background),

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
                            style: GoogleFonts.inter(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryText,
                            ),
                          ),
                          AppSpacing.vGapXs,
                          Text(
                            AppStrings.stayDatesSubtitle,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: AppColors.primaryText.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          if (onCancel != null) {
                            onCancel!(); // Switches tab back to index 0
                          } else if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          }
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          AppStrings.cancelDate,
                          style: TextStyle(
                            color: AppColors.badgeYellow,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.vGapXxll,

                  // Main Dark Calendar Card
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    decoration: BoxDecoration(
                      color: const Color(
                          0xFF16191D), // Dark grey background matching design
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: AppColors.primaryText.withOpacity(0.06),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          AppStrings.bookingDate,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryText.withOpacity(0.9),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Calendar Grid (35 items: 1-31 then 1-4)
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 7,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                          ),
                          itemCount: 35,
                          itemBuilder: (context, i) {
                            final dayNumber = i < 31 ? i + 1 : i - 30;
                            final isSelectedDay = dayNumber == 25 && i < 31;

                            return Center(
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: isSelectedDay
                                      ? Colors.white
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "$dayNumber",
                                  style: GoogleFonts.inter(
                                    color: isSelectedDay
                                        ? Colors.black
                                        : AppColors.primaryText
                                            .withOpacity(0.8),
                                    fontSize: 12,
                                    fontWeight: isSelectedDay
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        AppSpacing.vGapXll,
                      ],
                    ),
                  ),
                  AppSpacing.vGapXll,
                  // Cyan Navigation Arrow Buttons inside the Card
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            color: AppColors.primaryBlue,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.chevron_left_rounded,
                            color: AppColors.primaryText,
                            size: 18,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            color: AppColors.primaryBlue,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.chevron_right_rounded,
                            color: AppColors.primaryText,
                            size: 18,
                          ),
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
