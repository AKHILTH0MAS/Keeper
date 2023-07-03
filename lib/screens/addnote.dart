import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../colors.dart';
import '../notescomponents/addnotebutton.dart';
import '../notescomponents/descritionfield.dart';
import '../notescomponents/providers/notesprovider.dart';
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
    int selectedindex = 0;
    final isDarkTheme = Provider.of<NotesProvider>(context).isDarktheme;
    final emptyNote = Provider.of<NotesProvider>(context).emptyNote;

    return Scaffold(
      backgroundColor: isDarkTheme ? darkThemeB : backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: isDarkTheme ? darkThemeB : backgroundColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'ADD NOTE',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.task_alt),
              label: 'ADD POINTS',
              backgroundColor: Colors.black,
            ),
          ],
          unselectedIconTheme: IconThemeData(
              color: isDarkTheme ? darkTexttheme : primaryTexttheme),
          unselectedItemColor: isDarkTheme ? darkTexttheme : primaryTexttheme,
          selectedIconTheme: IconThemeData(color: Colors.amber[800]),
          selectedItemColor: Colors.amber[800],
          currentIndex: selectedindex,
          onTap: (index) {
            if (index == 0) {
              Navigator.pushReplacementNamed(context, '/addnote');
            }
            if (index == 1) {
              Navigator.pushReplacementNamed(context, '/bulletlist');
            }
          }),
      appBar: AppBar(
        backgroundColor: isDarkTheme ? darkThemeB : backgroundColor,
        centerTitle: true,
        title: Text(
          "Add Note",
          style: TextStyle(
            color: isDarkTheme ? darkTexttheme : primaryTexttheme,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<NotesProvider>(context, listen: false)
                    .addnote(titlecontroller.text, descriptioncontroller.text);
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.save,
                color: isDarkTheme ? darkTexttheme : primaryTexttheme,
              ))
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
                keyboard: TextInputType.text,
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
              if (emptyNote) ...[
                Text(
                  "Title and description cannot be empty",
                  style: TextStyle(
                    color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
