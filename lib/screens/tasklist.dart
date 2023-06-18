import 'package:flutter/material.dart';
import 'package:notes/notescomponents/notesprovider.dart';
import 'package:notes/taskcomponets/taskfield.dart';
import 'package:provider/provider.dart';

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
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt),
            label: 'Tasks',
            backgroundColor: Colors.black,
          ),
        ],
        selectedItemColor: Colors.amber[800],
        currentIndex: selectedindex,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/');
          }
          if (index == 1) {
            Navigator.pushReplacementNamed(context, '/tasklist');
          }
        },
      ),
      appBar: AppBar(
        title: const Text("Tasks"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const Searchbar(),
            const SizedBox(height: 10),
            if (tasks.isEmpty) ...[
              const Text(
                "NO TASKS",
                style: TextStyle(
                    color: Colors.black,
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
