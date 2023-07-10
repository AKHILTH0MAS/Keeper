import 'package:flutter/material.dart';
import 'package:notes/screens/Tasks/tasklist.dart';
import 'package:provider/provider.dart';

import '../../services/db.dart';

class TaskWidgetTree extends StatefulWidget {
  const TaskWidgetTree({super.key});

  @override
  State<TaskWidgetTree> createState() => _TaskWidgetTreeState();
}

class _TaskWidgetTreeState extends State<TaskWidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: DB().readTasks(),
      initialData: null,
      child: const Taskslist(),
    );
  }
}
