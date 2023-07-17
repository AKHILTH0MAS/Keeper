import 'package:flutter/material.dart';
import 'package:notes/colors.dart';
import 'package:notes/notescomponents/drawer.dart';
import 'package:notes/providers/notesprovider.dart';
import 'package:notes/screens/Tasks/search_screen.dart';
import 'package:notes/taskcomponets/taskfield.dart';
import 'package:provider/provider.dart';

import '../../notescomponents/bottomnavigation.dart';
import '../../taskcomponets/task.dart';
import '../../taskcomponets/taskcard.dart';

class Taskslist extends StatefulWidget {
  const Taskslist({super.key});

  @override
  State<Taskslist> createState() => _TaskslistState();
}

class _TaskslistState extends State<Taskslist> {
  final taskcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int selectedindex = 1;
    final tasks = Provider.of<List<Task>?>(context);
    final username = Provider.of<String?>(context);
    final List<Task> tasksresults = [];
    final isDarkTheme = Provider.of<NotesProvider>(context).isDarktheme;
    void searchTasks(String keyword) {
      tasksresults.clear();
      for (int index = 0; index < tasks!.length; index++) {
        if (tasks[index]
            .taskname
            .toLowerCase()
            .contains(keyword.toLowerCase())) {
          tasksresults.add(tasks[index]);
        }
      }
    }

    Size size = MediaQuery.of(context).size;
    final TextEditingController searchController = TextEditingController();
    return tasks == null || username == null
        ? Scaffold(
            backgroundColor: isDarkTheme ? darkThemeB : primaryBColor,
            body: Center(
              child: CircularProgressIndicator(
                color: isDarkTheme ? darkTexttheme : primaryTexttheme,
              ),
            ),
          )
        : Scaffold(
            drawer: HomeDrawer(isDarkTheme: isDarkTheme, username: username),
            backgroundColor: isDarkTheme ? darkThemeB : primaryBColor,
            bottomNavigationBar: BottomNavigationcustom(
              isDarkTheme: isDarkTheme,
              selectedindex: selectedindex,
            ),
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: isDarkTheme ? darkTexttheme : primaryTexttheme,
              ),
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
                  Container(
                    decoration: BoxDecoration(
                      color: isDarkTheme ? darkPrimay : primaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Icon(Icons.search,
                              color: isDarkTheme
                                  ? darkTexttheme
                                  : primaryTexttheme),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: size.width * 0.68,
                            child: TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                    color: isDarkTheme
                                        ? darkTexttheme
                                        : primaryTexttheme),
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                FocusScope.of(context).unfocus();

                                searchTasks(searchController.text);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SearchScreenTask(
                                      tasksresults: tasksresults,
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(Icons.arrow_right_alt,
                                  color: isDarkTheme
                                      ? darkTexttheme
                                      : primaryTexttheme))
                        ],
                      ),
                    ),
                  ),
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
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          return TaskCard(task: tasks[index]);
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
