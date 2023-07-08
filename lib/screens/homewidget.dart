import 'package:flutter/material.dart';
import 'package:notes/screens/regiter.dart';

import '../providers/note_stream_provider.dart';
import '../services/auth.dart';

class HomeWidgetTree extends StatefulWidget {
  const HomeWidgetTree({super.key});

  @override
  State<HomeWidgetTree> createState() => _HomeWidgetTreeState();
}

class _HomeWidgetTreeState extends State<HomeWidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeStreamProvider();
          } else {
            return const RegisterPage();
          }
        });
  }
}
