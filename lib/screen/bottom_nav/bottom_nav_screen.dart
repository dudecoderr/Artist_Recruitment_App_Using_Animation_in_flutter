import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruitment_flutter_ui/constant/color_constant.dart';
import '../discover_specialist.dart';
import '../home_screen.dart';
class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int current_index = 0;
  final List<Widget> pages = [
    const HomePage(),
    const DiscoverPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: current_index,
        children: pages,
      ),
      bottomNavigationBar: FloatingNavbar(
        backgroundColor: kBlackColor,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        fontSize: 0,
        borderRadius: 25.r,
        selectedBackgroundColor:Colors.white10,
        unselectedItemColor: Colors.grey.shade500,
        selectedItemColor: Colors.white,
        iconSize: 25.sp,
        itemBorderRadius: 12.r,
        onTap: (int val) {
          setState(() {
            current_index = val;
          });
        },
        currentIndex: current_index,
        items: [
          FloatingNavbarItem(
            icon: Icons.home_filled,
            title: '',
          ),
          FloatingNavbarItem(
            icon: Icons.shopping_bag,
            title: '',
          ),
          FloatingNavbarItem(
            icon: Icons.chat_bubble,
            title: '',
          ),
          FloatingNavbarItem(
            icon: Icons.person,
            title: '',
          ),
        ],
      ),
    );
  }
}