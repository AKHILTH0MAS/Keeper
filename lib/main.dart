import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/screens/addnote.dart';
import 'package:notes/screens/bulletlist.dart';
import 'package:notes/screens/home.dart';
import 'package:notes/screens/login.dart';
import 'package:notes/screens/tasklist.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'notescomponents/notesprovider.dart';
import 'notescomponents/preference.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesManager.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NotesProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        routes: {
          '/home': (context) => const HomePage(),
          '/': (context) => LoginPage(),
          '/addnote': (context) => const AddNote(),
          '/tasklist': (context) => const Tasks(),
          '/bulletlist': (context) => const BulletList(),
        },
        initialRoute: '/',
      ),
    );
  }
}
