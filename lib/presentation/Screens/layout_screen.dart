import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tadrib_hub/presentation/Screens/AboutUs_Screen.dart';
import 'package:tadrib_hub/presentation/Screens/Layout/layout_manager/layout_provider.dart';
import 'package:tadrib_hub/presentation/Screens/Layout/pages/PartnersPage%20.dart';
import 'package:tadrib_hub/presentation/Screens/Layout/pages/account_popup.dart';
import 'package:tadrib_hub/presentation/Screens/logIn_Screen.dart';
import 'package:tadrib_hub/resources/assets_manager.dart';
import 'package:tadrib_hub/resources/color_manager.dart';

class LayoutScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  LayoutScreen({super.key});

  void _showAccountPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierDismissible: true,
      builder: (BuildContext context) => const AccountPopup(
        userName: "nour",  
        userEmail: "ahmed@example.com", 
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return ChangeNotifierProvider(
      create: (context) => LayoutProvider(),
      child: Consumer<LayoutProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.inactiveGrey,
                      AppColors.textBlack,
                    ],
                  ),
                ),
              ),
              foregroundColor: AppColors.backgroundWhite,
              backgroundColor: Colors.black54,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: screenWidth * 0.05,
                  backgroundImage: AssetImage(ImageAssets.logo2),
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState?.openEndDrawer();
                  },
                  icon: const Icon(Icons.list),
                )
              ],
            ),
            endDrawer: Drawer(
              width: screenWidth * (isPortrait ? 0.65 : 0.40),
              child: Container(
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: isPortrait ? 120 : 80,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 8, // تخصيص مساحة أكبر للأزرار
                            child: ListView(
                              padding: EdgeInsets.symmetric(
                                vertical: isPortrait ? 20 : 10),
                              children: [
                                _buildDrawerButton(
                                  context: context,
                                  label: "Home",
                                  onPressed: () {
                                    provider.changeBtnNav(0);
                                    Navigator.pop(context);
                                  },
                                  screenWidth: screenWidth,
                                  isPortrait: isPortrait,
                                ),
                                _buildDrawerButton(
                                  context: context,
                                  label: "AI",
                                  onPressed: () {
                                    provider.changeBtnNav(2);
                                    Navigator.pop(context);
                                  },
                                  screenWidth: screenWidth,
                                  isPortrait: isPortrait,
                                ),
                                _buildDrawerButton(
                                  context: context,
                                  label: "Book",
                                  onPressed: () {},
                                  screenWidth: screenWidth,
                                  isPortrait: isPortrait,
                                ),
                                _buildDrawerButton(
                                  context: context,
                                  label: "Partner",
                                  onPressed: () {
                                    Navigator.pop(context); // يغلق الـ drawer
                                    // عرض نافذة الشركاء المنبثقة
                                    showDialog(
                                      context: context,
                                      barrierColor: Colors.black.withOpacity(0.4),
                                      barrierDismissible: true,
                                      builder: (BuildContext context) => const PartnersPopup(),
                                    );
                                  },
                                  screenWidth: screenWidth,
                                  isPortrait: isPortrait,
                                ),
                                _buildDrawerButton(
                                  context: context,
                                  label: "Program",
                                  onPressed: () {},
                                  screenWidth: screenWidth,
                                  isPortrait: isPortrait,
                                ),
                                _buildDrawerButton(
                                  context: context,
                                  label: "About Us",
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => AboutUsPage()),
                                    );
                                  },
                                  screenWidth: screenWidth,
                                  isPortrait: isPortrait,
                                ),
                              ],
                            ),
                          ),
                      
                          Expanded(
                            flex: 3,
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(isPortrait ? 15.0 : 8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => LoginScreen()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryBlue,
                                    minimumSize: Size(
                                      screenWidth * (isPortrait ? 0.3 : 0.2),
                                      isPortrait ? 50 : 30,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    "Log out", 
                                    style: TextStyle(
                                      fontSize: isPortrait ? 18 : 16,
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: isPortrait ? 10 : 5),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.backgroundWhite,
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                provider.changeBtnNav(2);
              },
              backgroundColor: AppColors.backgroundGray,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(360),
              ),
              child: const Icon(
                Icons.auto_awesome,
                color: Color(0xFF3D5CFF),
              ),
            ),
            bottomNavigationBar: Container(
              height: 100,
              child: BottomNavigationBar(
                onTap: (index) {
                  // Show account popup if Account icon is clicked
                  if (index == 4) {
                    _showAccountPopup(context);
                  } else {
                    provider.changeBtnNav(index);
                  }
                },
                selectedFontSize: 12,
                unselectedFontSize: 10,
                currentIndex: provider.selectedIndex,
                showSelectedLabels: true,
                backgroundColor: AppColors.white,
                type: BottomNavigationBarType.fixed,
                fixedColor: const Color(0xFF3D5CFF),
                unselectedItemColor: AppColors.iconGray,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled),
                    label: "Home",
                    activeIcon: Icon(Icons.home_filled),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.menu_book),
                    label: "Course",
                    activeIcon: Icon(Icons.menu_book),
                  ),
                  BottomNavigationBarItem(
                    icon: SizedBox(height: 0),
                    label: "AI Assistant",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.contact_mail),
                    label: "Contact Us",
                    activeIcon: Icon(Icons.contact_mail),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: "Account",
                    activeIcon: Icon(Icons.person),
                  ),
                ],
              ),
            ),
            body: provider.screens[provider.selectedIndex],
          );
        },
      ),
    );
  }
  Widget _buildDrawerButton({
    required BuildContext context,
    required String label,
    required VoidCallback onPressed,
    required double screenWidth,
    required bool isPortrait,
  }) {
    return ListTile(
      title: Center(
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            minimumSize: Size(
              screenWidth * (isPortrait ? 0.5 : 0.4),
              isPortrait ? 60 : 50,
            ),
            side: const BorderSide(color: Colors.black, width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.symmetric(
              vertical: isPortrait ? 15 : 10,
              horizontal: isPortrait ? 40 : 20,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: isPortrait ? 20 : 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}