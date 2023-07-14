import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../colors.dart';
import '../providers/notesprovider.dart';
import '../services/auth.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
    required this.isDarkTheme,
    required this.username,
  });

  final bool isDarkTheme;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: isDarkTheme ? darkThemeB : primaryBColor,
      child: ListView(
        children: [
          ListTile(
            tileColor: isDarkTheme ? darkPrimay : primaryColor,
            title: Text(
              "Hi,\n${username.toUpperCase()}.",
              style: TextStyle(
                  fontSize: 20,
                  color: isDarkTheme ? darkTexttheme : primaryTexttheme),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: isDarkTheme ? darkTexttheme : primaryTexttheme,
            ),
            tileColor: isDarkTheme ? darkPrimay : primaryColor,
            title: Text(
              "Logout",
              style: TextStyle(
                  color: isDarkTheme ? darkTexttheme : primaryTexttheme),
            ),
            onTap: () {
              Auth().signOut();
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: isDarkTheme
                ? Icon(
                    Icons.sunny,
                    color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                  )
                : Icon(
                    Icons.nights_stay_outlined,
                    color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                  ),
            tileColor: isDarkTheme ? darkPrimay : primaryColor,
            title: Text(
              "DarkTheme",
              style: TextStyle(
                  color: isDarkTheme ? darkTexttheme : primaryTexttheme),
            ),
            onTap: () {
              Provider.of<NotesProvider>(context, listen: false).darkTheme();
            },
          )
        ],
      ),
    );
  }
}
