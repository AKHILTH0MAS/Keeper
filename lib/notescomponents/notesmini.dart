import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notesprovider.dart';

class NotesMini extends StatelessWidget {
  const NotesMini({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              titleTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              content: Text(description),
              contentTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.normal,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Provider.of<NotesProvider>(context, listen: false)
                        .deletenote(title, description);
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
          color: const Color.fromARGB(86, 178, 215, 220),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              description,
              maxLines: 4,
              style: const TextStyle(
                color: Colors.black,
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
