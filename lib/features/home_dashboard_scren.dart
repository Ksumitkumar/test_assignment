import 'package:flutter/material.dart';
import 'package:test_assignment/core/app_strings.dart';

import '../core/app_color.dart';
import '../core/app_spacing.dart';
import '../data/location_data.dart';
import '../presentation/book_hotel_screen.dart';
import '../presentation/resort_screen.dart';
import 'profile_account_screen.dart';

class HomeDashboardScreen extends StatefulWidget {
  const HomeDashboardScreen({super.key});

  @override
  State<HomeDashboardScreen> createState() => _HomeDashboardScreenState();
}

class _HomeDashboardScreenState extends State<HomeDashboardScreen> {
  int _selectedIndex = 0;

  // Nav tab items combining Icons and dynamic Image URLs

  final List<NavTabItem> _navItems = const [
    NavTabItem(title: AppStrings.dashboardNav, icon: Icons.home),
    NavTabItem(title: AppStrings.hotelResorts, icon: Icons.flight_outlined),
    NavTabItem(
        title: AppStrings.bookingHotel, icon: Icons.calendar_today_outlined),
    NavTabItem(
      title: AppStrings.account,
      imageUrl: 'https://i.pravatar.cc/100',
    ),
  ];

  // Tab screens matching tab indices
  final List<Widget> _screens = const [
    DashboardTab(),
    ResortScreen(),
    BookHotelScreen(),
    ProfileAccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Stack(
        children: [
          // 1. Dark Base Background
          Container(color: const Color(0xFF0B1015)),

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

          IndexedStack(
            index: _selectedIndex,
            children: _screens,
          ),

          // Floating Navigation Bar
          Positioned(
            left: 20,
            right: 20,
            bottom: 24,
            child: Container(
              height: 64,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.background.withOpacity(0.5),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(_navItems.length, (index) {
                  final isSelected = _selectedIndex == index;
                  final item = _navItems[index];

                  return GestureDetector(
                    onTap: () => setState(() => _selectedIndex = index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      padding: EdgeInsets.symmetric(
                        horizontal: isSelected ? 16 : 8,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primaryBlue
                            : AppColors.transColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Render CircleAvatar for Account or Icon for other tabs
                          if (item.imageUrl != null)
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isSelected
                                      ? AppColors.primaryText
                                      : AppColors.transColor,
                                  width: 1.5,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 16,
                                foregroundImage: NetworkImage(item.imageUrl!),
                              ),
                            )
                          else
                            Icon(
                              item.icon,
                              color: isSelected
                                  ? AppColors.primaryText
                                  : AppColors.greyColor,
                              size: 20,
                            ),

                          // Expanding animated title text
                          AnimatedCrossFade(
                            firstChild: Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: Text(
                                item.title,
                                style: const TextStyle(
                                  color: AppColors.primaryText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            secondChild: const SizedBox.shrink(),
                            crossFadeState: isSelected
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                            duration: const Duration(milliseconds: 250),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// TAB SCREENS & SUB-WIDGETS
// ==========================================

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  // Sample Data List
  final List<LocationData> locationList = const [
    LocationData(
      imageUrl:
          'https://images.unsplash.com/photo-1517090504586-fde19ea6066f?w=600',
      locationTitle: "Toronto, Canada",
      distance: "150KM",
      availableDates: "OCT 24–25",
      price: "\$50.00",
    ),
    LocationData(
      imageUrl:
          'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=600',
      locationTitle: "Toronto, Canada",
      distance: "200KM",
      availableDates: "NOV 01–05",
      price: "\$75.00",
    ),
  ];

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
                    const Text(
                      AppStrings.greetingHeader,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryText,
                        height: 1.2,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.drag_handle,
                          color: AppColors.primaryText, size: 28),
                    ),
                  ],
                ),
                AppSpacing.vGapXll,
                TextField(
                  style: const TextStyle(
                    color: AppColors.primaryText,
                  ),
                  decoration: InputDecoration(
                    hintText: AppStrings.searchLocationHint,
                    hintStyle: const TextStyle(
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
              itemCount: locationList.length,
              itemBuilder: (context, index) {
                final item = locationList[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: _StackedLocationCard(
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

/// Dynamic Model supporting Icons and Image URLs
class NavTabItem {
  final String title;
  final IconData? icon;
  final String? imageUrl;

  const NavTabItem({
    required this.title,
    this.icon,
    this.imageUrl,
  });
}

class _StackedLocationCard extends StatelessWidget {
  final String imageUrl;
  final String locationTitle;
  final String distance;
  final String availableDates;
  final String price;

  const _StackedLocationCard({
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
                    style: const TextStyle(
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
          style: const TextStyle(color: AppColors.greyColor, fontSize: 12),
        ),
        AppSpacing.vGapXs,
        Text(
          value,
          style: const TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
