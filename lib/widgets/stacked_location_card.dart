import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/app_color.dart';
import '../core/app_spacing.dart';

class StackedLocationCard extends StatelessWidget {
  final String imageUrl;
  final String locationTitle;
  final String distance;
  final String availableDates;
  final String price;

  const StackedLocationCard({
    super.key,
    required this.imageUrl,
    required this.locationTitle,
    required this.distance,
    required this.availableDates,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Stack(
        children: [
          // Background Image
          ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null)
                  return child; // Image loaded successfully

                // Shows asset placeholder while downloading
                return Image.asset(
                  'assets/images/newyork.jpg', // Replace with your asset path
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
              errorBuilder: (context, error, stackTrace) {
                // Shows asset placeholder if image fails to load
                return Image.asset(
                  'assets/images/newyork.jpg', // Replace with your asset path
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),

          // Overlaid Information Card Pinned to Bottom
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.background.withOpacity(0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    locationTitle,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText,
                    ),
                  ),
                  AppSpacing.vGapMd,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _StatTile(label: "Distance", value: distance),
                      _StatTile(label: "Available", value: availableDates),
                      _StatTile(label: "Price", value: price),
                    ],
                  ),
                  AppSpacing.vGapMd,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final String label, value;
  const _StatTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(color: AppColors.greyColor, fontSize: 12),
        ),
        AppSpacing.vGapXs,
        Text(
          value,
          style: GoogleFonts.inter(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
