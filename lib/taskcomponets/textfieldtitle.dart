import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../colors.dart';
import '../providers/notesprovider.dart';

class Textfield extends StatelessWidget {
  const Textfield({
    super.key,
    required this.titlecontroller,
    required this.hint,
    required this.keyboard,
  });

  final TextEditingController titlecontroller;
  final String hint;
  final TextInputType keyboard;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<NotesProvider>(context).isDarktheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        style: TextStyle(color: isDarkTheme ? darkTexttheme : primaryTexttheme),
        keyboardType: keyboard,
        controller: titlecontroller,
        decoration: InputDecoration(border: InputBorder.none, hintText: hint),
      ),
    );
  }
}
