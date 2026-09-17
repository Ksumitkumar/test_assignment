import 'package:flutter/material.dart';
import 'package:test_assignment/core/app_strings.dart';

import '../core/app_color.dart';
import '../core/app_typography.dart';

class BookHotelScreen extends StatelessWidget {
  const BookHotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1015),
      body: Stack(
        children: [
          // 1. Dark Base Background
          Container(color: const Color(0xFF0B1015)),

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.nightStayHeader,
                            style: AppTypography.header,
                          ),
                          SizedBox(height: 4),
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
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C1C1E),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.primaryText.withOpacity(0.06),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          AppStrings.bookingDate,
                          style: AppTypography.subheader,
                        ),
                        const SizedBox(height: 16),
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
                  const Spacer(),
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     // backgroundColor: AppColors.primaryBlue,
                  //     minimumSize: const Size(double.infinity, 50),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(25),
                  //     ),
                  //   ),
                  //   onPressed: () {},
                  //   child: const Text(
                  //     AppStrings.bookingButton,
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
