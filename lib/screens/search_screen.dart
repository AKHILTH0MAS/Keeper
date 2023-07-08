import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../colors.dart';
import '../providers/notesprovider.dart';
import '../taskcomponets/task.dart';
import '../taskcomponets/taskcard.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, required this.tasksresults});

  final List<Task> tasksresults;
  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<NotesProvider>(context).isDarktheme;
    return Scaffold(
      backgroundColor: isDarkTheme ? darkThemeB : backgroundColor,
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: (tasksresults.isEmpty)
          ? Center(
              child: Text(
                "NO TASKS",
                style: TextStyle(
                  color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : Expanded(
              child: ListView.builder(
                itemCount: tasksresults.length,
                itemBuilder: (context, index) {
                  return TaskCard(task: tasksresults[index]);
                },
              ),
            ),
    );
  }
}
