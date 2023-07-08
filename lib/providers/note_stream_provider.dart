import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/home.dart';
import '../services/db.dart';

class HomeStreamProvider extends StatefulWidget {
  const HomeStreamProvider({super.key});

  @override
  State<HomeStreamProvider> createState() => _HomeStreamProviderState();
}

class _HomeStreamProviderState extends State<HomeStreamProvider> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      StreamProvider.value(
        value: DB().readNotes(),
        initialData: null,
      ),
    ], child: HomePage());
  }
}
