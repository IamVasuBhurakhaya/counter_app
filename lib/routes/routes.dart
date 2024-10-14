import 'package:counter_app/views/homeScreen/views/home_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static String homePage = "/";

  static Map<String, Widget Function(BuildContext)> routes = {
    homePage: (context) => const HomeScreen(),
  };
}
