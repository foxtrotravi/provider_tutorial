import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/change_notifiers/randomizer_change_notifier.dart';
import 'package:provider_tutorial/randomizer_page.dart';

class RandomizerHomePage extends StatefulWidget {
  const RandomizerHomePage({super.key});

  @override
  State<RandomizerHomePage> createState() => _RandomizerHomePageState();
}

class _RandomizerHomePageState extends State<RandomizerHomePage> {
  late final TextEditingController minController;
  late final TextEditingController maxController;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Randomizer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Min'),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (int.tryParse(value) != null) {
                    context.read<RandomizerProvider>().setMin(
                          int.parse(value),
                        );
                  }
                },
                validator: (value) {
                  if (int.tryParse(value ?? '') == null) {
                    return 'Please enter value';
                  }
                  return null;
                },
                onSaved: (value) {
                  if (int.tryParse(value ?? '') != null) {
                    context.read<RandomizerProvider>().setMin(
                          int.parse(value!),
                        );
                  }
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Max'),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (int.tryParse(value) != null) {
                    context.read<RandomizerProvider>().setMax(
                          int.parse(value),
                        );
                  }
                },
                validator: (value) {
                  if (int.tryParse(value ?? '') == null) {
                    return 'Please enter value';
                  }

                  if (context.read<RandomizerProvider>().min >
                      int.parse(value!)) {
                    return 'Max should be greater than min';
                  }
                  return null;
                },
                onSaved: (value) {
                  if (int.tryParse(value ?? '') != null) {
                    context.read<RandomizerProvider>().setMax(
                          int.parse(value!),
                        );
                  }
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState?.validate() == true) {
                    formKey.currentState!.save();
                    navigateToRandomizerPage();
                  }
                },
                child: const Text('Generate random'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToRandomizerPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return const RandomizerPage();
        },
      ),
    );
  }
}
