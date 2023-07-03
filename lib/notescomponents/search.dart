import 'package:flutter/material.dart';
import 'package:notes/colors.dart';
import 'package:provider/provider.dart';

import 'providers/notesprovider.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({
    super.key,
  });

  @override
  State<Searchbar> createState() => _SearchbarState();
}

final TextEditingController searchController = TextEditingController();

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    bool search = Provider.of<NotesProvider>(context).search;
    Size size = MediaQuery.of(context).size;
    return Container(
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
                  hintText: search ? 'Search' : 'press enter again to go back',
                  hintStyle: const TextStyle(color: Colors.black),
                  border: InputBorder.none,
                ),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            IconButton(
                onPressed: () {
                  Provider.of<NotesProvider>(context, listen: false)
                      .searchNotes(searchController.text);
                  Provider.of<NotesProvider>(context, listen: false)
                      .searchTasks(searchController.text);
                  searchController.clear();
                  Provider.of<NotesProvider>(context, listen: false)
                      .searchbool();
                },
                icon: const Icon(Icons.arrow_right_alt, color: Colors.black))
          ],
        ),
      ),
    );
  }
}
