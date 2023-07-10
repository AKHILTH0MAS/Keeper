import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/screens/notes/addnote.dart';
import 'package:notes/screens/notes/bulletlist.dart';
import 'package:notes/screens/notes/homewidget.dart';
import 'package:notes/screens/login.dart';
import 'package:notes/screens/regiter.dart';
import 'package:notes/screens/Tasks/taskwidgettree.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'providers/notesprovider.dart';
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
    return MultiProvider(
      providers: [
        //change notifier provider for changing elements like darktheme
        //multiprovider is not neccesary using it is a good technique
        ChangeNotifierProvider(create: (_) => NotesProvider()),
      ],
      child: const Materialapp(),
    );
  }
}

class Materialapp extends StatelessWidget {
  const Materialapp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        '/home': (context) => const HomeWidgetTree(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/addnote': (context) => const AddNote(),
        '/tasklist': (context) => const TaskWidgetTree(),
        '/bulletlist': (context) => const BulletList(),
        '/': (context) => const HomeWidgetTree(),
      },
      initialRoute: '/',
    );
  }
}
