import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/counter_page.dart';

void main() {
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MultiProvider(
            providers: [
              ProxyProvider0<int>(
                update: (context, _) => count,
                child: const CounterPage(),
              ),
              ProxyProvider<int, Translation>(
                update: (context, count, _) {
                  return Translation('You pressed $count times');
                },
              ),
            ],
            child: const CounterPage(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              count++;
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class Translation {
  final String _text;
  const Translation(this._text);
  String get text => _text;
}
