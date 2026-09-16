import 'package:flutter/material.dart';
import 'package:test_assignment/core/app_strings.dart';

import '../core/app_color.dart';
import '../core/app_typography.dart';

class BookHotelScreen extends StatelessWidget {
  const BookHotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
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
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.cardBg,
                  borderRadius: BorderRadius.circular(20),
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
                          child: Text("${i + 1}", style: AppTypography.body),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  AppStrings.bookingButton,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
