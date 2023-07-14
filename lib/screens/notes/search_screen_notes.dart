import 'package:flutter/material.dart';
import 'package:notes/notescomponents/notesmini.dart';
import 'package:provider/provider.dart';
import '../../colors.dart';
import '../../notescomponents/notesclass.dart';
import '../../providers/notesprovider.dart';

class SearchScreenNotes extends StatefulWidget {
  const SearchScreenNotes({super.key, required this.noteresults});

  final List<Note> noteresults;

  @override
  State<SearchScreenNotes> createState() => _SearchScreenNotesState();
}

class _SearchScreenNotesState extends State<SearchScreenNotes> {
  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<NotesProvider>(context).isDarktheme;
    return Scaffold(
      backgroundColor: isDarkTheme ? darkThemeB : primaryBColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: isDarkTheme ? darkTexttheme : primaryTexttheme,
          ),
        ),
        backgroundColor: isDarkTheme ? darkThemeB : primaryBColor,
        title: Text("Search",
            style: TextStyle(
              color: isDarkTheme ? darkTexttheme : primaryTexttheme,
            )),
      ),
      body: (widget.noteresults.isEmpty)
          ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "NO Notes",
                    style: TextStyle(
                      color: isDarkTheme ? darkTexttheme : primaryTexttheme,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Image.asset("assets/icons/search.png"),
                ],
              ),
            )
          : ListView.builder(
              itemCount: widget.noteresults.length,
              itemBuilder: (context, index) {
                return NotesMini(note: widget.noteresults[index]);
              },
            ),
    );
  }
}
