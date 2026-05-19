import 'package:flutter/material.dart';
import 'package:food_app/screen/cart_screen.dart';
import 'package:food_app/screen/home_screen.dart';
Map<int, int> globalCartItems = {};

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int selectedIndex = 0;

  List screens = [HomeScreen(),CartScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 83,
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        color: Colors.transparent,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,

          unselectedItemColor: Colors.grey[400],
          selectedItemColor: Color(0xFF8366AA),
          currentIndex: selectedIndex,
          elevation: 0,
          backgroundColor: Colors.grey[50],
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: ""),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              label: "",
            ),
          ],
        ),
      ),
      body: screens[selectedIndex],
    );
  }
}
