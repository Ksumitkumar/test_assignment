// lib/data/mock_data.dart
import 'package:flutter/material.dart';

import 'location_data.dart';

class AppMockData {
  static const List<LocationData> locationList = [
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
      locationTitle: "New York City, America",
      distance: "200KM",
      availableDates: "NOV 01–05",
      price: "\$75.00",
    ),
  ];

  static const options = [
    {
      'icon': Icons.person_outline_rounded,
      'title': 'Edit Profile',
      'sub': 'Manage your professional profile',
    },
    {
      'icon': Icons.person_add_alt_outlined,
      'title': 'Account',
      'sub': 'Manage account and login settings',
    },
    {
      'icon': Icons.notifications_none_rounded,
      'title': 'Notification',
      'sub': 'Manage your notification preferences',
    },
    {
      'icon': Icons.palette_outlined,
      'title': 'Appearance',
      'sub': 'Customize your app experience',
    },
    {
      'icon': Icons.help_outline_rounded,
      'title': 'Help & Feedback',
      'sub': 'Get help or share feedback',
    },
    {
      'icon': Icons.person_add_outlined,
      'title': 'Invite a friend',
      'sub': 'Invite friends to NextRole app',
    },
    {
      'icon': Icons.shield_outlined,
      'title': 'Privacy & Security',
      'sub': 'Manage privacy and data settings',
    },
    {
      'icon': Icons.credit_card_outlined,
      'title': 'Subscription',
      'sub': 'Manage your plan and billing',
      'isComingSoon': true,
    },
  ];
}
