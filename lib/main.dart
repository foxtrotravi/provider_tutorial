import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/change_notifiers/bread_crumb_provider.dart';
import 'package:provider_tutorial/change_notifiers/randomizer_change_notifier.dart';
import 'package:provider_tutorial/home_page.dart';
import 'package:provider_tutorial/randomizer_home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BreadCrumbProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RandomizerProvider(max: 0, min: 0),
        ),
      ],
      child: const AppWidget(),
    ),
  );
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RandomizerHomePage(),
    );
  }
}
