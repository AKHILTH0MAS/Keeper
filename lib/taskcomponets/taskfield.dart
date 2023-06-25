import 'package:flutter/material.dart';
import 'package:notes/colors.dart';
import 'package:provider/provider.dart';

import '../notescomponents/notesprovider.dart';

class Taskfield extends StatelessWidget {
  const Taskfield({
    super.key,
    required this.titlecontroller,
    required this.hint,
  });

  final TextEditingController titlecontroller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<NotesProvider>(context).isDarktheme;

    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            width: MediaQuery.of(context).size.width * 0.78,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isDarkTheme ? darkPrimay : primaryColor,
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              style: TextStyle(
                color: isDarkTheme ? darkTexttheme : primaryTexttheme,
              ),
              controller: titlecontroller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: TextStyle(
                  color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    isDarkTheme ? darkPrimay : primaryColor,
                  ),
                  padding: const MaterialStatePropertyAll(EdgeInsets.all(10))),
              onPressed: () {
                if (titlecontroller.text.isNotEmpty) {
                  Provider.of<NotesProvider>(context, listen: false)
                      .addTask(titlecontroller.text);
                  titlecontroller.clear();
                }
              },
              child: Text(
                "ADD",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                    ),
              ))
        ],
      ),
    );
  }
}
