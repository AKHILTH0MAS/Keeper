import 'package:flutter/material.dart';
import 'package:notes/notescomponents/notesprovider.dart';
import 'package:provider/provider.dart';

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

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addnote');
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt),
            label: 'Tasks',
            backgroundColor: Colors.black,
          ),
        ],
        selectedItemColor: Colors.amber[800],
        currentIndex: selectedindex,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/');
          }
          if (index == 1) {
            Navigator.pushNamed(context, '/tasklist');
          }
        },
      ),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.sunny)),
        ],
        title: const Text('Notes', style: TextStyle(color: Colors.yellow)),
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
                const Center(
                  child: Text(
                    'No Notes',
                    style: TextStyle(
                      color: Colors.black,
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
                  itemCount: titles.length,
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
