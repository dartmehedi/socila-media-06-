import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart.';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tech_media/utils/routes/route_name.dart';
import 'package:tech_media/view/dashboard/Profile/Profile.dart';
import 'package:tech_media/viiew_model/services/session_manager.dart';

import '../../res/color.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final controller =PersistentTabController(initialIndex: 0);
  List<Widget>_buildScren(){
    return [
      SafeArea(child: Text("Home",style:Theme.of(context).textTheme.subtitle1)),
      Text('Chat'),
      Text('Add'),
      Text('Message'),
     ProfileScreen(),
    ];
  }
  List<PersistentBottomNavBarItem>_navBarItem(){
    return [
      PersistentBottomNavBarItem(
          icon: Icon(Icons.home),
        activeColorPrimary: AppColors.primaryIconColor,
        inactiveIcon: Icon(Icons.home, color: AppColors.textFieldDefaultFocus),

      ),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.chat),
        activeColorPrimary: AppColors.primaryIconColor,
        inactiveIcon: Icon(Icons.chat, color: Colors.grey.shade100),
      ),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.add),
        activeColorPrimary: AppColors.primaryIconColor,
        inactiveIcon: Icon(Icons.add, color: Colors.grey.shade100),

      ),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.message),
        activeColorPrimary: AppColors.primaryIconColor,
        inactiveIcon: Icon(Icons.message, color: Colors.grey.shade100),
      ),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.person),
        activeColorPrimary: AppColors.primaryIconColor,
        inactiveIcon: Icon(Icons.person, color: Colors.grey.shade100),

      ),

    ];
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PersistentTabView(
          context,
          screens:_buildScren(),
        items: _navBarItem(),
          controller: controller,
        backgroundColor: AppColors.otpHintColor,
          decoration: NavBarDecoration(
            colorBehindNavBar: Colors.red,
            borderRadius: BorderRadius.circular(1),
          ),
        navBarStyle: NavBarStyle.style15,
      ),
    );
  }
}
