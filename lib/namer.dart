import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NamerApp extends StatelessWidget {
  const NamerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NamerAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: const NamerPage(),
      )
    );
  }
}

class NamerAppState extends ChangeNotifier {
  var current = WordPair.random();
}

class NamerPage extends StatelessWidget {
  const NamerPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<NamerAppState>();
    return Scaffold(
        body: Column(
      children: [
        const Text('A random idea:'),
        Text(appState.current.asLowerCase),
      ],
    ));
  }
}
