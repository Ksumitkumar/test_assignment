import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_assignment/features/home_dashboard_scren.dart';
import 'package:test_assignment/features/profile_account_screen.dart';
import 'package:test_assignment/presentation/book_hotel_screen.dart';
import 'package:test_assignment/presentation/resort_screen.dart';

GoRouter goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeDashboardScreen()),
    // GoRoute(
    //   path: '/dashboard',
    //   builder: (context, state) => HomeDashboardScren(),
    // ),
    GoRoute(
      path: '/resort_screen',
      builder: (context, state) => ResortScreen(),
    ),
    GoRoute(
      path: '/hotel_booking',
      builder: (context, state) => BookHotelScreen(),
    ),
    GoRoute(
      path: '/profile_screen',
      builder: (context, state) => ProfileAccountScreen(),
    ),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Test Assignment',
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
    );
  }
}
