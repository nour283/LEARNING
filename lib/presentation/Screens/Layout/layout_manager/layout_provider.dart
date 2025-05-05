import 'package:flutter/material.dart';
import 'package:tadrib_hub/presentation/Screens/Layout/pages/account_popup.dart';
import 'package:tadrib_hub/presentation/Screens/Layout/pages/ai_screen.dart';
import 'package:tadrib_hub/presentation/Screens/Layout/pages/contact_screen.dart';
import 'package:tadrib_hub/presentation/Screens/Layout/pages/course_screen.dart';
import 'package:tadrib_hub/presentation/Screens/Layout/pages/home_screen.dart';

class LayoutProvider extends ChangeNotifier {
  int selectedIndex = 0;
  bool showAccountOverlay = false;

  void changeBtnNav(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void toggleAccountOverlay() {
    showAccountOverlay = !showAccountOverlay;
    notifyListeners();
  }

  List<Widget> screens = [
    HomeScreen(),
    CoursesScreen(),
    AiScreen(),
    ContactFormScreen(),
    AccountPopup(
      userName: "nour mohamed",
      userEmail: "ahmed@example.com",
    ),
  ];
}