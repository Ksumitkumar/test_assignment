import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_assignment/core/app_strings.dart';

import '../core/app_color.dart';
import '../core/app_spacing.dart';
import '../data/mock_data.dart';
import '../presentation/book_hotel_screen.dart';
import '../presentation/resort_screen.dart';
import 'dashboard_tab.dart';
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
                        horizontal: isSelected ? 16 : 10,
                        vertical: isSelected ? 12 : 10,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primaryBlue
                            : AppColors.primaryText.withOpacity(0.08),
                        shape: BoxShape
                            .rectangle, // Keep rectangle shape for smooth interpolation
                        borderRadius: BorderRadius.circular(isSelected
                            ? 25
                            : 50), // Animate border radius cleanly
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
                                radius: 12,
                                foregroundImage: NetworkImage(item.imageUrl!),
                              ),
                            )
                          else
                            Icon(
                              item.icon,
                              color: isSelected
                                  ? AppColors.primaryText
                                  : AppColors.primaryText.withOpacity(0.7),
                              size: 18,
                            ),

                          // Expanding animated title text
                          AnimatedCrossFade(
                            firstChild: Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: Text(
                                item.title,
                                style: GoogleFonts.inter(
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
