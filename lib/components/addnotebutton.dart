import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        setNotes(titlecontroller.text, descriptioncontroller.text);
        Navigator.pop(context);
      },
      child: const Text('Add Note', style: TextStyle(color: Colors.black)),
    );
  }

  Future<void> setNotes(titleData, descriptionData) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList('titleData', titleData);
    pref.setStringList('discriptiondata', descriptionData);
  }
}
