import 'package:flutter/material.dart';
import 'package:notes/colors.dart';
import 'package:notes/notescomponents/providers/notesprovider.dart';
import 'package:notes/taskcomponets/taskfield.dart';
import 'package:provider/provider.dart';

import '../notescomponents/bottomnavigation.dart';
import '../notescomponents/search.dart';
import '../taskcomponets/taskcard.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  final taskcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    int selectedindex = 1;
    final tasks = Provider.of<NotesProvider>(context).tasks;
    final tasksresults = Provider.of<NotesProvider>(context).tasksresults;
    final isDarkTheme = Provider.of<NotesProvider>(context).isDarktheme;

    return Scaffold(
      backgroundColor: isDarkTheme ? darkThemeB : backgroundColor,
      bottomNavigationBar: BottomNavigationcustom(
        isDarkTheme: isDarkTheme,
        selectedindex: selectedindex,
      ),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: isDarkTheme ? darkPrimay : primaryColor,
        title: Text(
          "Tasks",
          style: TextStyle(
            color: isDarkTheme ? darkTexttheme : primaryTexttheme,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Searchbar(),
            const SizedBox(height: 10),
            if (tasks.isEmpty) ...[
              Text(
                "NO TASKS",
                style: TextStyle(
                    color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Taskfield(titlecontroller: taskcontroller, hint: "ADD TASK")
            ] else ...[
              Expanded(
                child: ListView.builder(
                  itemCount: tasksresults.isNotEmpty
                      ? tasksresults.length
                      : tasks.length,
                  itemBuilder: (context, index) {
                    return tasksresults.isNotEmpty
                        ? TaskCard(task: tasksresults[index])
                        : TaskCard(task: tasks[index]);
                  },
                ),
              ),
              Taskfield(titlecontroller: taskcontroller, hint: "ADD TASK")
            ],
          ],
        ),
      ),
    );
  }
}
