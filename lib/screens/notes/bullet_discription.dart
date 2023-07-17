import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../colors.dart';
import '../../providers/notesprovider.dart';

class BulletDiscription extends StatelessWidget {
  const BulletDiscription({
    super.key,
    required this.descriptioncontroller,
  });

  final TextEditingController descriptioncontroller;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<NotesProvider>(context).isDarktheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(10),
      child: TextField(
        style: TextStyle(
          color: isDarkTheme ? darkTexttheme : primaryTexttheme,
        ),
        controller: descriptioncontroller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "• - Your point...",
          hintStyle:
              TextStyle(color: isDarkTheme ? darkTexttheme : primaryTexttheme),
        ),
      ),
    );
  }
}
