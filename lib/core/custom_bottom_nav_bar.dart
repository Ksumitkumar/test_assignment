import 'package:flutter/material.dart';

import 'app_color.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.navBg,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(0, Icons.home_rounded, "Dashboard"),
          _buildNavItem(1, Icons.auto_awesome, null),
          _buildNavItem(2, Icons.calendar_today_rounded, null),
          _buildNavItem(3, Icons.person_outline, null, isAvatar: true),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    int index,
    IconData icon,
    String? label, {
    bool isAvatar = false,
  }) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: isSelected && label != null ? 16 : 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryBlue : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            isAvatar
                ? const CircleAvatar(
                    radius: 12,
                    backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150',
                    ),
                  )
                : Icon(
                    icon,
                    color: isSelected
                        ? AppColors.primaryText
                        : AppColors.secondaryText,
                    size: 20,
                  ),
            if (isSelected && label != null) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
