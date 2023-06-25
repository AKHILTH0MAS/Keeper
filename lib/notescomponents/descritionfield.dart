import 'package:flutter/material.dart';
import 'package:notes/colors.dart';
import 'package:provider/provider.dart';

import 'notesprovider.dart';

class TextfeildDescription extends StatelessWidget {
  const TextfeildDescription({
    super.key,
    required this.descriptioncontroller,
  });

  final TextEditingController descriptioncontroller;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<NotesProvider>(context).isDarktheme;

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: descriptioncontroller,
        style: TextStyle(color: isDarkTheme ? darkTexttheme : primaryTexttheme),
        maxLines: 10,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Description',
        ),
      ),
    );
  }
}
