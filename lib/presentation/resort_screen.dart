import 'package:flutter/material.dart';
import 'package:test_assignment/core/app_strings.dart';

import '../core/app_color.dart';

class ResortScreen extends StatelessWidget {
  const ResortScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1015),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Dark Base Background
          Container(color: const Color(0xFF0B1015)),

          // 2. Top-Right Cyan Glow (Covers screen top & card height)
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(1.2, -0.8),
                  radius: 1.2,
                  colors: [
                    Color(0xFF003848),
                    Colors.transparent,
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
                    Color(0xFF003848),
                    Colors.transparent,
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
                          height: 240,
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
                              color: Colors.white.withOpacity(0.06),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                blurRadius: 15,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Host Details Row
                              const Row(
                                children: [
                                  CircleAvatar(
                                    radius: 22,
                                    backgroundImage: AssetImage(
                                      'assets/images/person.jpeg',
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppStrings.hostedBy,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          AppStrings.lifestyle,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14),

                              // Rating, Reviews & Date Row
                              // Rating, Reviews & Date Row (Matching Figma directly)
                              // 2. Star, Reviews & Date Row
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.white, // White star
                                    size: 13,
                                  ),
                                  const SizedBox(width: 4),
                                  const Text(
                                    "4.9",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Text("|",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      )),
                                  const SizedBox(width: 15),
                                  Text(
                                    "${AppStrings.reviewsText}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Text("|",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      )),
                                  const SizedBox(width: 15),
                                  const Text(
                                    "OCT 24–26",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11,
                                      letterSpacing: 0.6,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14),

                              // Location Row
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF0088FF),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.notifications_none_rounded,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Expanded(
                                    child: Text(
                                      "1155 Rue Sherbrooke Ouest, Toronto, Canada H3A 2N3",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        height: 1.3,
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
                ),

                const SizedBox(height: 20),

                // Description Title & Text (Sits directly on full-screen gradient)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        AppStrings.descriptionTitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        AppStrings.experiencDes,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.65),
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
