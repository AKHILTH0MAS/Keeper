import 'package:flutter/material.dart';
import 'package:notes/colors.dart';
import 'package:provider/provider.dart';

import '../notescomponents/notesprovider.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task});
  final String task;
  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<NotesProvider>(context).isDarktheme;

    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: isDarkTheme ? darkPrimay : primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(task,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: isDarkTheme ? darkTexttheme : primaryTexttheme)),
            IconButton(
              onPressed: () {
                Provider.of<NotesProvider>(context, listen: false)
                    .deleteTask(task);
              },
              icon: Icon(
                Icons.delete,
                color: isDarkTheme ? darkTexttheme : primaryTexttheme,
              ),
            )
          ],
        ),
      ),
    );
  }
}
