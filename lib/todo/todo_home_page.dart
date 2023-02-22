import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/change_notifiers/todo_provider.dart';

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _controller,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<TodoProvider>().add(
                          Todo(
                            isCompleted: false,
                            title: _controller.text,
                          ),
                        );
                    _controller.clear();
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<TodoProvider>(
              builder: (context, todoProvider, child) {
                if (todoProvider.todoList.isEmpty) {
                  return const Center(
                    child: Text('No todo found'),
                  );
                }
                return ListView.builder(
                  itemCount: todoProvider.todoList.length,
                  itemBuilder: (_, index) {
                    return CheckboxListTile(
                      value: todoProvider.todoList[index].isCompleted,
                      onChanged: (value) {
                        if (value == null) return;
                        context.read<TodoProvider>().toggle(index);
                      },
                      title: Text(todoProvider.todoList[index].title),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
