import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/notesmini.dart';
import '../components/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _selectedindex = 0;
  List<String> noteTitle = [];
  List<String> noteDiscription = [];
  @override
  void initState() {
    super.initState();
    getNotesData();
  }

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
              if (noteTitle.isEmpty)
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
                  itemCount: noteTitle.length,
                  itemBuilder: (BuildContext context, int index) {
                    return NotesMini(
                        title: noteTitle[index],
                        description: noteDiscription[index]);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getNotesData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    noteTitle = pref.getStringList('titleData')!;
    noteDiscription = pref.getStringList('discriptiondata')!;
    setState(() {});
  }
}
