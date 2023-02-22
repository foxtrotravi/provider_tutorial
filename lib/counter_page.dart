import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/main.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final count = Provider.of<Translation>(context).text;
    return Text(count);
  }
}
