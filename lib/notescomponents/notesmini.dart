import 'package:flutter/material.dart';
import 'package:notes/colors.dart';
import 'package:provider/provider.dart';

import '../services/db.dart';
import 'notesclass.dart';
import '../providers/notesprovider.dart';

class NotesMini extends StatelessWidget {
  const NotesMini({
    super.key,
    required this.note,
  });

  final Note note;
  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<NotesProvider>(context).isDarktheme;

    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(note.title),
              titleTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              content: Text(note.description),
              contentTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.normal,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    DB().deletenote(note);
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Delete note 🗑",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          }),
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: size.height * 0.7,
        width: size.width * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isDarkTheme ? darkPrimay : primaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                note.title,
                style: TextStyle(
                  color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              note.description,
              maxLines: 4,
              style: TextStyle(
                color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
