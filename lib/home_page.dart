import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/bread_crumb_page.dart';
import 'package:provider_tutorial/change_notifiers/bread_crumb_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Consumer<BreadCrumbProvider>(
              builder: (context, value, child) {
                return Wrap(
                  children: value.items.map((e) {
                    return Text(
                      e.title + (e.isActive ? ' > ' : ''),
                      style: TextStyle(
                        color: e.isActive ? Colors.blue : Colors.black,
                      ),
                    );
                  }).toList(),
                );
              },
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const CreateBreadCrumbPage(),
                    ),
                  );
                },
                child: const Text('Create a new breadcrumb'),
              ),
            ),
            TextButton(
              onPressed: () {
                context.read<BreadCrumbProvider>().reset();
              },
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
