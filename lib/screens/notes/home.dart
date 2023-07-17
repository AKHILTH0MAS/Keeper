import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes/providers/notesprovider.dart';
import 'package:notes/screens/notes/search_screen_notes.dart';
import 'package:provider/provider.dart';

import '../../colors.dart';
import '../../notescomponents/drawer.dart';
import '../../notescomponents/notesclass.dart';
import '../../services/auth.dart';
import '../../notescomponents/bottomnavigation.dart';
import '../../notescomponents/notesmini.dart';

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
    final username = Provider.of<String?>(context);

    Size size = MediaQuery.of(context).size;
    const int selectedindex = 0;
    final TextEditingController searchController = TextEditingController();
    final isDarkTheme = Provider.of<NotesProvider>(context).isDarktheme;

    return notes == null || username == null
        ? Scaffold(
            backgroundColor: isDarkTheme ? darkThemeB : primaryBColor,
            body: Center(
              child: CircularProgressIndicator(
                color: isDarkTheme ? darkTexttheme : primaryTexttheme,
              ),
            ),
          )
        : Scaffold(
            drawer: HomeDrawer(isDarkTheme: isDarkTheme, username: username),
            backgroundColor: isDarkTheme ? darkThemeB : primaryBColor,
            floatingActionButton: FloatingActionButton(
                backgroundColor: isDarkTheme ? darkPrimay : primaryColor,
                onPressed: () {
                  Navigator.pushNamed(context, '/addnote');
                },
                child: Icon(Icons.add,
                    color: isDarkTheme ? darkTexttheme : primaryTexttheme)),
            bottomNavigationBar: BottomNavigationcustom(
                isDarkTheme: isDarkTheme, selectedindex: selectedindex),
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: isDarkTheme ? darkTexttheme : primaryTexttheme,
              ),
              elevation: 0,
              backgroundColor: isDarkTheme ? darkPrimay : primaryColor,
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
                    SearchBarHome(
                        isDarkTheme: isDarkTheme,
                        size: size,
                        searchController: searchController,
                        notesresults: notesresults),
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

class SearchBarHome extends StatelessWidget {
  const SearchBarHome({
    super.key,
    required this.isDarkTheme,
    required this.size,
    required this.searchController,
    required this.notesresults,
  });

  final bool isDarkTheme;
  final Size size;
  final TextEditingController searchController;
  final List<Note> notesresults;

  @override
  Widget build(BuildContext context) {
    final notes = Provider.of<List<Note>?>(context);
    void searchNotes(String keyword) {
      notesresults.clear();
      for (int index = 0; index < notes!.length; index++) {
        if (notes[index].call().toLowerCase().contains(keyword.toLowerCase())) {
          notesresults.add(notes[index]);
        }
      }
    }

    final isDarkTheme = Provider.of<NotesProvider>(context).isDarktheme;
    return Container(
      decoration: BoxDecoration(
        color: isDarkTheme ? darkPrimay : primaryColor,
        borderRadius: BorderRadius.circular(50),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Icon(Icons.search,
                color: isDarkTheme ? darkTexttheme : primaryTexttheme),
            const SizedBox(width: 10),
            SizedBox(
              width: size.width * 0.68,
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                      color: isDarkTheme ? darkTexttheme : primaryTexttheme),
                  border: InputBorder.none,
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            IconButton(
                onPressed: () {
                  searchNotes(searchController.text);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SearchScreenNotes(noteresults: notesresults)));
                  FocusScope.of(context).unfocus();
                },
                icon: Icon(Icons.arrow_right_alt,
                    color: isDarkTheme ? darkTexttheme : primaryTexttheme))
          ],
        ),
      ),
    );
  }
}
