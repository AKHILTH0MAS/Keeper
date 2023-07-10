import 'package:flutter/material.dart';
import 'package:notes/colors.dart';
import 'package:notes/notescomponents/notesmini.dart';
import 'package:notes/providers/notesprovider.dart';
import 'package:provider/provider.dart';

import '../../notescomponents/notesclass.dart';

class NoteSearch extends StatelessWidget {
  const NoteSearch({super.key, required this.resultnotes});
  final List<Note> resultnotes;
  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<NotesProvider>(context).isDarktheme;
    return Scaffold(
      backgroundColor: isDarkTheme ? darkThemeB : primaryBColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: isDarkTheme ? darkTexttheme : primaryTexttheme,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: isDarkTheme ? darkPrimay : primaryColor,
        title: Text(
          "Search",
          style:
              TextStyle(color: isDarkTheme ? darkTexttheme : primaryTexttheme),
        ),
      ),
      body: resultnotes.isEmpty
          ? Center(
              child: Text(
                "Notes not found",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: isDarkTheme ? darkTexttheme : primaryTexttheme),
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: resultnotes.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return NotesMini(
                        note: resultnotes[index],
                      );
                    }),
              ),
            ),
    );
  }
}
