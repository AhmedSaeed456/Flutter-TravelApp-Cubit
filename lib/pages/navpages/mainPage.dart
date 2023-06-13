import 'package:flutter/material.dart';
import 'package:travelmaster/misc/colors.dart';
import 'package:travelmaster/pages/navpages/bar_item_page.dart';
import 'package:travelmaster/pages/navpages/home_page.dart';
import 'package:travelmaster/pages/navpages/my_page.dart';
import 'package:travelmaster/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [HomePage(), SearchPage(), BarItemPage(), MyPage()];
  int currentIndex = 0;
  onTap(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: AppColors.textColor2.withOpacity(0.5),
          showUnselectedLabels: false,
          unselectedFontSize: 0,
          currentIndex: currentIndex,
          elevation: 0,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(label: "apps", icon: Icon(Icons.apps)),
            BottomNavigationBarItem(label: "char", icon: Icon(Icons.bar_chart)),
            BottomNavigationBarItem(label: "search", icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: "person", icon: Icon(Icons.person)),
          ]),
    );
  }
}
