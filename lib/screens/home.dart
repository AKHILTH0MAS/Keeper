import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes/providers/notesprovider.dart';
import 'package:provider/provider.dart';

import '../colors.dart';
import '../notescomponents/notesclass.dart';
import '../services/auth.dart';
import '../notescomponents/bottomnavigation.dart';
import '../notescomponents/notesmini.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  final User? user = Auth().currentUser;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<Note> notesresults = [];
    final notes = Provider.of<List<Note>?>(context);

    void searchNotes(String keyword) {
      notesresults.clear();
      for (int index = 0; index < notes!.length; index++) {
        if (notes[index].call().toLowerCase().contains(keyword.toLowerCase())) {
          notesresults.add(notes[index]);
        }
      }
    }

    bool search = Provider.of<NotesProvider>(context).search;
    Size size = MediaQuery.of(context).size;
    const int selectedindex = 0;
    final TextEditingController searchController = TextEditingController();
    final isDarkTheme = Provider.of<NotesProvider>(context).isDarktheme;

    return notes == null
        ? Scaffold(
            backgroundColor: isDarkTheme ? darkThemeB : backgroundColor,
            body: Center(
              child: CircularProgressIndicator(
                color: isDarkTheme ? darkTexttheme : primaryTexttheme,
              ),
            ),
          )
        : Scaffold(
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
                      Provider.of<NotesProvider>(context, listen: false)
                          .darkTheme();
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
                    Container(
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            const Icon(Icons.search, color: Colors.black),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: size.width * 0.68,
                              child: TextField(
                                controller: searchController,
                                decoration: InputDecoration(
                                  hintText: search
                                      ? 'Search'
                                      : 'press enter again to go back',
                                  hintStyle:
                                      const TextStyle(color: Colors.black),
                                  border: InputBorder.none,
                                ),
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  searchNotes(searchController.text);
                                },
                                icon: const Icon(Icons.arrow_right_alt,
                                    color: Colors.black))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (notes.isEmpty)
                      Center(
                        child: Text(
                          'No Notes',
                          style: TextStyle(
                            color:
                                isDarkTheme ? darkTexttheme : primaryTexttheme,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    else
                      GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        physics: const ScrollPhysics(),
                        itemCount: notesresults.isNotEmpty
                            ? notesresults.length
                            : notes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return notesresults.isNotEmpty
                              ? NotesMini(
                                  note: notesresults[index],
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
