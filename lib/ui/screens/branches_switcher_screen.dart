import 'dart:ui';
import 'package:cryptocurrency_chart_app/ui/style/app_colors.dart';
import 'package:cryptocurrency_chart_app/ui/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BranchesSwitcherScreen extends StatelessWidget {
  const BranchesSwitcherScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      extendBody: true,
      floatingActionButton: CustomBottomNavBarButton(
        height: 70,
        width: 70,
        onPressed: () {
          print("PRESSED");
        },
        fontSize: 25,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        height: 93,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.background.withOpacity(0.3),
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 9, sigmaY: 9),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: Colors.transparent, // Прозрачный фон
              elevation: 0,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              unselectedItemColor: Theme.of(context).colorScheme.secondary,
              items: generateNavigationBarItems(context),
              currentIndex: navigationShell.currentIndex,
              onTap: (index) => navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> generateNavigationBarItems(
          BuildContext context) =>
      [
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 25,
            width: 25,
            child: Image.asset("assets/icons/home_icon.png"),
          ),
          activeIcon: SizedBox(
            height: 25,
            width: 25,
            child: Image.asset("assets/icons/home_icon.png"),
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 25,
            width: 25,
            child: Image.asset("assets/icons/activity_icon.png"),
          ),
          activeIcon: SizedBox(
            height: 25,
            width: 25,
            child: Image.asset("assets/icons/activity_icon.png"),
          ),
          label: "",
        ),
      ];
}
