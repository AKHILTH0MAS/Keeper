import 'package:flutter/material.dart';
import 'package:notes/colors.dart';
import 'package:provider/provider.dart';

import '../../notescomponents/addnotebutton.dart';
import '../../providers/notesprovider.dart';
import '../../taskcomponets/textfieldtitle.dart';

class BulletList extends StatefulWidget {
  const BulletList({super.key});

  @override
  State<BulletList> createState() => _BulletListState();
}

class _BulletListState extends State<BulletList> {
  final titlecontroller = TextEditingController();

  final descriptioncontroller1 = TextEditingController();
  final descriptioncontroller2 = TextEditingController();
  final descriptioncontroller3 = TextEditingController();
  final descriptioncontroller4 = TextEditingController();
  final descriptioncontroller5 = TextEditingController();
  final descriptioncontroller6 = TextEditingController();
  final descriptioncontroller7 = TextEditingController();
  final descriptioncontroller8 = TextEditingController();
  final descriptioncontroller9 = TextEditingController();
  final descriptioncontroller10 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<NotesProvider>(context).isDarktheme;

    return Scaffold(
      backgroundColor: isDarkTheme ? darkThemeB : primaryBColor,
      appBar: AppBar(
        backgroundColor: isDarkTheme ? darkPrimay : primaryColor,
        title: Text(
          "Bullet List",
          style:
              TextStyle(color: isDarkTheme ? darkTexttheme : primaryTexttheme),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text("Title",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: isDarkTheme ? darkTexttheme : primaryTexttheme)),
              Textfield(
                keyboard: TextInputType.text,
                titlecontroller: titlecontroller,
                hint: "Title",
              ),
              const SizedBox(height: 10),
              Text("Description",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: isDarkTheme ? darkTexttheme : primaryTexttheme)),
              BulletDiscription(descriptioncontroller: descriptioncontroller1),
              BulletDiscription(descriptioncontroller: descriptioncontroller2),
              BulletDiscription(descriptioncontroller: descriptioncontroller3),
              BulletDiscription(descriptioncontroller: descriptioncontroller4),
              BulletDiscription(descriptioncontroller: descriptioncontroller5),
              BulletDiscription(descriptioncontroller: descriptioncontroller6),
              BulletDiscription(descriptioncontroller: descriptioncontroller7),
              const SizedBox(height: 10),
              AddBulletButton(
                titlecontroller: titlecontroller,
                descriptioncontroller1: descriptioncontroller1,
                descriptioncontroller2: descriptioncontroller2,
                descriptioncontroller3: descriptioncontroller3,
                descriptioncontroller4: descriptioncontroller4,
                descriptioncontroller5: descriptioncontroller5,
                descriptioncontroller6: descriptioncontroller6,
                descriptioncontroller7: descriptioncontroller7,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BulletDiscription extends StatelessWidget {
  const BulletDiscription({
    super.key,
    required this.descriptioncontroller,
  });

  final TextEditingController descriptioncontroller;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<NotesProvider>(context).isDarktheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(10),
      child: TextField(
        style: TextStyle(
          color: isDarkTheme ? darkTexttheme : primaryTexttheme,
        ),
        controller: descriptioncontroller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "• - Your point...",
          hintStyle:
              TextStyle(color: isDarkTheme ? darkTexttheme : primaryTexttheme),
        ),
      ),
    );
  }
}
