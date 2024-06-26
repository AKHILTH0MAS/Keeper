import 'package:flutter/material.dart';
import 'package:notes/colors.dart';
import 'package:provider/provider.dart';

import '../providers/notesprovider.dart';
import '../services/db.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({
    super.key,
    required this.titlecontroller,
    required this.descriptioncontroller,
  });

  final TextEditingController titlecontroller;
  final TextEditingController descriptioncontroller;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<NotesProvider>(context).isDarktheme;
    return Row(
      children: [
        const Spacer(),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                isDarkTheme ? darkPrimay : primaryColor),
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          onPressed: () {
            if (titlecontroller.text.isNotEmpty &&
                descriptioncontroller.text.isNotEmpty) {
              FocusScope.of(context).unfocus();

              DB().saveNote(
                titlecontroller.text,
                descriptioncontroller.text,
              );

              Navigator.pop(context);
            }
          },
          child: Text('Add Note',
              style: TextStyle(
                  color: isDarkTheme ? darkTexttheme : primaryTexttheme)),
        ),
      ],
    );
  }
}

class AddBulletButton extends StatelessWidget {
  const AddBulletButton({
    super.key,
    required this.titlecontroller,
    required this.descriptioncontroller1,
    required this.descriptioncontroller2,
    required this.descriptioncontroller3,
    required this.descriptioncontroller4,
    required this.descriptioncontroller5,
    required this.descriptioncontroller6,
    required this.descriptioncontroller7,
  });

  final TextEditingController titlecontroller;
  final TextEditingController descriptioncontroller1;
  final TextEditingController descriptioncontroller2;
  final TextEditingController descriptioncontroller3;
  final TextEditingController descriptioncontroller4;
  final TextEditingController descriptioncontroller5;
  final TextEditingController descriptioncontroller6;
  final TextEditingController descriptioncontroller7;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<NotesProvider>(context).isDarktheme;
    return Row(
      children: [
        const Spacer(),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: isDarkTheme
                ? MaterialStateProperty.all(darkPrimay)
                : MaterialStateProperty.all(primaryColor),
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          onPressed: () {
            if (titlecontroller.text.isNotEmpty &&
                descriptioncontroller1.text.isNotEmpty) {
              DB().addbulletnote(
                titlecontroller.text,
                descriptioncontroller1.text,
                descriptioncontroller2.text,
                descriptioncontroller3.text,
                descriptioncontroller4.text,
                descriptioncontroller5.text,
                descriptioncontroller6.text,
                descriptioncontroller7.text,
              );
              Navigator.pop(context);
            }
          },
          child: const Text('Add Note', style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
