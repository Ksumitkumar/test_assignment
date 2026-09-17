import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/app_color.dart';
import '../core/app_spacing.dart';
import '../core/app_strings.dart';
import '../data/mock_data.dart';
import '../widgets/stacked_location_card.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // FIXED TOP SECTION (Header + Search Field)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpacing.vGapLg,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.greetingHeader,
                      style: GoogleFonts.inter(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryText,
                        height: 1.2,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryText.withOpacity(0.05),
                        shape: BoxShape.circle,
                      ), // Makes the container fully circular
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.drag_handle,
                              color: AppColors.primaryText, size: 28),
                        ),
                      ),
                    ),
                  ],
                ),
                AppSpacing.vGapXll,
                TextField(
                  style: GoogleFonts.inter(
                    color: AppColors.primaryText,
                  ),
                  decoration: InputDecoration(
                    hintText: AppStrings.searchLocationHint,
                    hintStyle: GoogleFonts.inter(
                        color: AppColors.greyColor, fontSize: 14),
                    prefixIcon:
                        const Icon(Icons.search, color: AppColors.greyColor),
                    suffixIcon:
                        const Icon(Icons.mic_none, color: AppColors.greyColor),
                    filled: true,
                    fillColor: AppColors.darkGreyColor,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                AppSpacing.vGapLg
              ],
            ),
          ),

          // SCROLLABLE LIST SECTION BELOW SEARCH
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 30.0, bottom: 110.0),
              physics: const BouncingScrollPhysics(),
              itemCount: AppMockData.locationList.length,
              itemBuilder: (context, index) {
                final item = AppMockData.locationList[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: StackedLocationCard(
                    imageUrl: item.imageUrl,
                    locationTitle: item.locationTitle,
                    distance: item.distance,
                    availableDates: item.availableDates,
                    price: item.price,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
