import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_assignment/core/app_spacing.dart';
import 'package:test_assignment/core/app_strings.dart';

import '../core/app_color.dart';

class ResortScreen extends StatelessWidget {
  const ResortScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Dark Base Background
          Container(color: AppColors.background),

          // 2. Top-Right Cyan Glow (Covers screen top & card height)
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(1.2, -0.8),
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

          // 3. Center-Left Cyan Glow (Spans behind Description section)
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(-2.0, 0.9),
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

          // 4. Scrollable Content Layer
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Image and Overlapping Card Stack
                SizedBox(
                  height: 380,
                  child: Stack(
                    children: [
                      // Hotel Banner Image
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(28),
                        ),
                        child: Image.asset(
                          'assets/images/background_image.jpeg',
                          width: double.infinity,
                          height: 230,
                          fit: BoxFit.cover,
                        ),
                      ),

                      // Overlapping Card (Updated to #1C1C1E matching Figma)
                      Positioned(
                        left: 2,
                        right: 2,
                        top: 170,
                        child: Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1C1C1E),
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(
                              color: AppColors.primaryText.withOpacity(0.06),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.background.withOpacity(0.4),
                                blurRadius: 15,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Host Details Row
                              Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(
                                      'assets/images/person.jpeg',
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppStrings.hostedBy,
                                          style: GoogleFonts.inter(
                                            color: AppColors.primaryText,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          AppStrings.lifestyle,
                                          style: GoogleFonts.inter(
                                            color: AppColors.primaryText,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              AppSpacing.vGapMds,

                              // Rating, Reviews & Date Row
                              // Rating, Reviews & Date Row (Matching Figma directly)
                              // 2. Star, Reviews & Date Row
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: AppColors.primaryText, // White star
                                    size: 13,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    "${AppStrings.starText}",
                                    style: GoogleFonts.inter(
                                      color: AppColors.primaryText,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Text("|",
                                      style: GoogleFonts.inter(
                                        color: AppColors.greyColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      )),
                                  const SizedBox(width: 15),
                                  Text(
                                    "${AppStrings.reviewsText}",
                                    style: GoogleFonts.inter(
                                      color: AppColors.primaryText,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Text("|",
                                      style: GoogleFonts.inter(
                                        color: AppColors.greyColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      )),
                                  const SizedBox(width: 15),
                                  Text(
                                    "${AppStrings.bookingDate}",
                                    style: GoogleFonts.inter(
                                      color: AppColors.primaryText,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11,
                                      letterSpacing: 0.6,
                                    ),
                                  ),
                                ],
                              ),
                              AppSpacing.vGapMds,

                              // Location Row
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                      color: AppColors.primaryBlue,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.notifications_none_rounded,
                                      color: AppColors.primaryText,
                                      size: 18,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      "${AppStrings.hotelNameText}",
                                      style: GoogleFonts.inter(
                                        color: AppColors.greyColor,
                                        fontSize: 12,
                                        height: 1.3,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              AppSpacing.vGapXll,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                AppSpacing.vGapXl,

                // Description Title & Text (Sits directly on full-screen gradient)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.descriptionTitle,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryText,
                          height: 1.4, // Match line height spacing from Figma
                          letterSpacing: -0.1,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        AppStrings.experiencDes,
                        style: GoogleFonts.inter(
                          color: AppColors.primaryText.withOpacity(0.65),
                          fontSize: 13,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 120),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
