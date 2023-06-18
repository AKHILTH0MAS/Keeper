import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../notescomponents/notesprovider.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task});
  final String task;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(task, style: Theme.of(context).textTheme.headlineSmall),
          IconButton(
            onPressed: () {
              Provider.of<NotesProvider>(context, listen: false)
                  .deleteTask(task);
            },
            icon: const Icon(Icons.delete),
          )
        ],
      ),
    );
  }
}
