import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes/notescomponents/providers/notesprovider.dart';
import 'package:provider/provider.dart';

import '../colors.dart';
import '../services/auth.dart';
import '../notescomponents/bottomnavigation.dart';
import '../notescomponents/notesmini.dart';
import '../notescomponents/search.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  final User? user = Auth().currentUser;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final resultNotes = Provider.of<NotesProvider>(context).notesresults;

    const int selectedindex = 0;
    final notes = Provider.of<NotesProvider>(context).notes;

    final isDarkTheme = Provider.of<NotesProvider>(context).isDarktheme;

    return Scaffold(
      backgroundColor: isDarkTheme ? darkThemeB : backgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: isDarkTheme ? darkPrimay : primaryColor,
        onPressed: () {
          Navigator.pushNamed(context, '/addnote');
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationcustom(
          isDarkTheme: isDarkTheme, selectedindex: selectedindex),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: isDarkTheme ? darkPrimay : primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              Auth().signOut();
            },
            icon: Icon(
              Icons.logout,
              color: isDarkTheme ? darkTexttheme : primaryTexttheme,
            ),
          ),
          IconButton(
              onPressed: () {
                Provider.of<NotesProvider>(context, listen: false).darkTheme();
              },
              icon: Icon(isDarkTheme ? Icons.sunny : Icons.dark_mode,
                  color: isDarkTheme ? darkTexttheme : primaryTexttheme)),
        ],
        title: Text('Notes',
            style: TextStyle(
                color: isDarkTheme ? darkTexttheme : primaryTexttheme)),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Searchbar(),
              const SizedBox(height: 10),
              if (notes.isEmpty)
                Center(
                  child: Text(
                    'No Notes',
                    style: TextStyle(
                      color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              else
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  physics: const ScrollPhysics(),
                  itemCount: resultNotes.isNotEmpty
                      ? resultNotes.length
                      : notes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return resultNotes.isNotEmpty
                        ? NotesMini(
                            note: resultNotes[index],
                          )
                        : NotesMini(note: notes[index]);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
