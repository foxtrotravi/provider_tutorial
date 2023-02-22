import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/change_notifiers/counter_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterModel(0),
        ),
        ProxyProvider<CounterModel, Translation>(
          update: (context, counterModel, translation) =>
              Translation('You pressed ${counterModel.count} times'),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text(
            Provider.of<Translation>(context).text,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<CounterModel>(context, listen: false).increment();
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
