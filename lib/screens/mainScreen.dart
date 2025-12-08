import 'package:coda_workshop/constant/colors.dart';
import 'package:coda_workshop/controllers/nav_controller.dart';
import 'package:coda_workshop/screens/favorite_screen.dart';
import 'package:coda_workshop/screens/home/home.dart';
import 'package:coda_workshop/screens/prodoctes_screen.dart';
import 'package:coda_workshop/screens/profial/profile_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final NavController navController = Get.put(NavController());

  final List<Widget> pages = [
    HomeScreen(),
   FavoritesScreen(),
   
  //  ProfileScreen()
  ProductsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavController>(
      builder: (nav) {
        return Scaffold(
          body: pages[nav.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            iconSize: 27,
            currentIndex: nav.currentIndex,
            onTap: nav.changeIndex,
            backgroundColor: AppColors.background,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: "",
              ),
            ],
          ),
        );
      },
    );
  }
}
