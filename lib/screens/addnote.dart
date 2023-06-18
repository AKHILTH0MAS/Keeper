import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../notescomponents/addnotebutton.dart';
import '../notescomponents/descritionfield.dart';
import '../notescomponents/notesprovider.dart';
import '../notescomponents/textfieldtitle.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final titlecontroller = TextEditingController();

  final descriptioncontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Note"),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<NotesProvider>(context, listen: false)
                    .addnote(titlecontroller.text, descriptioncontroller.text);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text("Title", style: Theme.of(context).textTheme.headlineSmall),
              Textfield(
                titlecontroller: titlecontroller,
                hint: "Title",
              ),
              const SizedBox(height: 10),
              Text("Description",
                  style: Theme.of(context).textTheme.headlineSmall),
              TextfeildDescription(
                  descriptioncontroller: descriptioncontroller),
              const SizedBox(height: 10),
              AddNoteButton(
                  titlecontroller: titlecontroller,
                  descriptioncontroller: descriptioncontroller),
            ],
          ),
        ),
      ),
    );
  }
}
