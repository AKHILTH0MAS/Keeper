import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/addnotebutton.dart';
import '../components/descritionfield.dart';
import '../components/notesprovider.dart';
import '../components/textfieldtitle.dart';

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
    int selectedindex = 0;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            label: "Camera",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mic_rounded),
            label: "Mic",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist),
            label: 'Checklist',
          ),
        ],
        selectedItemColor: Colors.amber[800],
        currentIndex: selectedindex,
        onTap: (index) async {
          if (index == 0) {}
          // if (index == 1) {
          //   Navigator.pushNamed(context, '/mic');
          // }
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Note"),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<NotesProvider>(context, listen: false).addnote(
                    titlecontroller.text, descriptioncontroller.text, "");
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
              TextfieldTitle(titlecontroller: titlecontroller),
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
