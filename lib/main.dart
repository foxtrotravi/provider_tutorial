import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/providers/counter_provider.dart';

void main() {
  runApp(
    Provider(
      create: (context) => const Counter(0),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final count = Provider.of<Counter>(context).count.toString();

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(count),
        ),
      ),
    );
  }
}
