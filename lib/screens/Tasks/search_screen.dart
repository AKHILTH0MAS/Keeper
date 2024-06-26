import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../colors.dart';
import '../../providers/notesprovider.dart';
import '../../taskcomponets/task.dart';
import '../../taskcomponets/taskcard.dart';

class SearchScreenTask extends StatefulWidget {
  const SearchScreenTask({super.key, required this.tasksresults});

  final List<Task> tasksresults;

  @override
  State<SearchScreenTask> createState() => _SearchScreenTaskState();
}

class _SearchScreenTaskState extends State<SearchScreenTask> {
  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<NotesProvider>(context).isDarktheme;
    return Scaffold(
      backgroundColor: isDarkTheme ? darkThemeB : primaryBColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: isDarkTheme ? darkTexttheme : primaryTexttheme,
          ),
        ),
        backgroundColor: isDarkTheme ? darkThemeB : primaryBColor,
        title: Text("Search",
            style: TextStyle(
              color: isDarkTheme ? darkTexttheme : primaryTexttheme,
            )),
      ),
      body: (widget.tasksresults.isEmpty)
          ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "NO TASKS",
                    style: TextStyle(
                      color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Image.asset("assets/icons/search.png"),
                ],
              ),
            )
          : ListView.builder(
              itemCount: widget.tasksresults.length,
              itemBuilder: (context, index) {
                return TaskCard(task: widget.tasksresults[index]);
              },
            ),
    );
  }
}
