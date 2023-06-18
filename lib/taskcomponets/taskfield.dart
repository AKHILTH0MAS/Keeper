import 'package:flutter/material.dart';
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
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            width: MediaQuery.of(context).size.width * 0.78,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              controller: titlecontroller,
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: hint),
            ),
          ),
          TextButton(
              onPressed: () {
                Provider.of<NotesProvider>(context, listen: false)
                    .addTask(titlecontroller.text);
              },
              child: Text(
                "ADD",
                style: Theme.of(context).textTheme.bodyMedium!,
              ))
        ],
      ),
    );
  }
}
