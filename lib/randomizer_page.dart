import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/change_notifiers/randomizer_change_notifier.dart';

class RandomizerPage extends StatelessWidget {
  const RandomizerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Number'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<RandomizerProvider>(
              builder: (context, value, child) {
                return Text(
                  '${value.getGeneratedNumber ?? 0}',
                  style: Theme.of(context).textTheme.headlineLarge,
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.read<RandomizerProvider>().generateRandomNumber();
              },
              child: const Text('Generate new random number'),
            ),
          ],
        ),
      ),
    );
  }
}
