import 'package:flutter/material.dart';
import 'package:notes/components/notesprovider.dart';
import 'package:provider/provider.dart';

import '../components/notesmini.dart';
import '../components/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _selectedindex = 0;

  @override
  Widget build(BuildContext context) {
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
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add Note'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.black,
          ),
        ],
        selectedItemColor: Colors.amber[800],
        currentIndex: _selectedindex,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/');
          }
          if (index == 1) {
            Navigator.pushNamed(context, '/addnote');
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
              if (Provider.of<NotesProvider>(context).title.isEmpty)
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
                  itemCount: int.parse(Provider.of<NotesProvider>(context)
                      .title
                      .length
                      .toString()),
                  itemBuilder: (BuildContext context, int index) {
                    return NotesMini(
                        title: Provider.of<NotesProvider>(context).title[index],
                        description: Provider.of<NotesProvider>(context)
                            .description[index]);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
