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
      backgroundColor: isDarkTheme ? darkThemeB : backgroundColor,
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
      selectedIconTheme: IconThemeData(color: Colors.amber[800]),
      selectedItemColor: Colors.amber[800],
      currentIndex: selectedindex,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushReplacementNamed(context, '/');
        }
        if (index == 1) {
          Navigator.pushReplacementNamed(context, '/tasklist');
        }
      },
    );
  }
}
