import 'package:flutter/material.dart';
import 'package:notes/notescomponents/notesprovider.dart';
import 'package:provider/provider.dart';

import '../colors.dart';
import '../notescomponents/bottomnavigation.dart';
import '../notescomponents/notesmini.dart';
import '../notescomponents/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    const int selectedindex = 0;
    final titles = Provider.of<NotesProvider>(context).titles;
    final descriptions = Provider.of<NotesProvider>(context).descriptions;
    final resultstitles =
        Provider.of<NotesProvider>(context).notesresultstitles;
    final resultsdescription =
        Provider.of<NotesProvider>(context).notesresultsdescriptions;
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.sunny)),
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
              if (titles.isEmpty)
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
                  itemCount: resultstitles.isNotEmpty
                      ? resultstitles.length
                      : titles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return resultstitles.isNotEmpty
                        ? NotesMini(
                            title: resultstitles[index],
                            description: resultsdescription[index])
                        : NotesMini(
                            title: titles[index],
                            description: descriptions[index]);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
