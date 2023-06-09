import 'package:flutter/material.dart';

class TextfieldTitle extends StatelessWidget {
  const TextfieldTitle({
    super.key,
    required this.titlecontroller,
  });

  final TextEditingController titlecontroller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: titlecontroller,
        decoration:
            const InputDecoration(border: InputBorder.none, hintText: "Title"),
      ),
    );
  }
}
