import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_assignment/core/app_strings.dart';
import 'package:test_assignment/data/mock_data.dart';

import '../core/app_color.dart';

class ProfileAccountScreen extends StatelessWidget {
  const ProfileAccountScreen({super.key});

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
                  center: Alignment(1.2,
                      -1.0), // Changed -1.2 to 1.2 to position at top-right
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

          // 4. Content List
          SafeArea(
            child: ListView.separated(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 18,
                bottom: 120,
              ),
              itemCount: AppMockData.options.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final item = AppMockData.options[index];
                final isComingSoon = item['isComingSoon'] == true;

                return Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C1C1E),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: AppColors.primaryText.withOpacity(0.06),
                      width: 1,
                    ),
                  ),
                  child: ListTile(
                    dense: true, // Shrinks minimum height constraints
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 0,
                    ),
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.primaryText.withOpacity(0.05),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        item['icon'] as IconData,
                        color: AppColors.primaryText.withOpacity(0.8),
                        size: 20,
                      ),
                    ),
                    title: Text(
                      item['title'] as String,
                      style: GoogleFonts.inter(
                        color: AppColors.primaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.2,
                      ),
                    ),
                    subtitle: Text(
                      item['sub'] as String,
                      style: GoogleFonts.inter(
                        color: AppColors.primaryText.withOpacity(0.45),
                        fontSize: 11,
                        height: 1.3,
                      ),
                    ),
                    trailing: isComingSoon
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF3B2E1E),
                              borderRadius: BorderRadius.circular(14),
                              // border: Border.all(
                              //   color: AppColors.badgeYellow,
                              //   width: 0.8,
                              // ),
                            ),
                            child: Text(
                              '${AppStrings.comingSoonText}',
                              style: GoogleFonts.inter(
                                color: AppColors.badgeYellow,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        : Icon(
                            Icons.chevron_right_rounded,
                            color: AppColors.primaryText,
                            size: 20,
                          ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
