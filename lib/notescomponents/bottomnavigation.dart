import 'package:flutter/material.dart';

import '../colors.dart';

class BottomNavigationcustom extends StatelessWidget {
  const BottomNavigationcustom({
    super.key,
    required this.isDarkTheme,
    required this.selectedindex,
  });

  final bool isDarkTheme;
  final int selectedindex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: isDarkTheme ? darkThemeB : primaryBColor,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.task_alt),
          label: 'Tasks',
          backgroundColor: Colors.black,
        ),
      ],
      unselectedIconTheme:
          IconThemeData(color: isDarkTheme ? darkTexttheme : primaryTexttheme),
      unselectedItemColor: isDarkTheme ? darkTexttheme : primaryTexttheme,
      selectedIconTheme:
          IconThemeData(color: isDarkTheme ? darkPrimay : primaryColor),
      selectedItemColor: isDarkTheme ? darkPrimay : primaryColor,
      currentIndex: selectedindex,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushReplacementNamed(context, '/home');
        }
        if (index == 1) {
          Navigator.pushReplacementNamed(context, '/tasklist');
        }
      },
    );
  }
}
