import 'package:flutter/material.dart';
import 'package:notes/components/notesprovider.dart';
import 'package:provider/provider.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({
    super.key,
    required this.titlecontroller,
    required this.descriptioncontroller,
  });

  final TextEditingController titlecontroller;
  final TextEditingController descriptioncontroller;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            color: Colors.black12,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onPressed: () {
        Provider.of<NotesProvider>(context, listen: false).addnote(
          titlecontroller.text,
          descriptioncontroller.text,
        );
        Navigator.pop(context);
      },
      child: const Text('Add Note', style: TextStyle(color: Colors.black)),
    );
  }
}
