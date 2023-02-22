import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/change_notifiers/bread_crumb_provider.dart';

class CreateBreadCrumbPage extends StatefulWidget {
  const CreateBreadCrumbPage({super.key});

  @override
  State<CreateBreadCrumbPage> createState() => _CreateBreadCrumbPageState();
}

class _CreateBreadCrumbPageState extends State<CreateBreadCrumbPage> {
  late final TextEditingController textEditingController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Bread Crumb'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: textEditingController,
                validator: (String? input) {
                  if (input == null || input.isEmpty) {
                    return 'Please enter input';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState?.validate() == true) {
                    context.read<BreadCrumbProvider>().add(
                          BreadCrumb(
                            title: textEditingController.text,
                            isActive: false,
                          ),
                        );
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
