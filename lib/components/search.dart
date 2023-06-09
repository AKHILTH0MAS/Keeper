import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(50),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.white),
            const SizedBox(width: 10),
            SizedBox(
              width: size.width * 0.68,
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.filter_alt, color: Colors.white))
          ],
        ),
      ),
    );
  }
}
