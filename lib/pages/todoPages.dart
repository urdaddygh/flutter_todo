import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List todoList = [];
  String _textValue = '';
  String _changedTodoText = '';
  List<TextEditingController> controllers = [];

  @override
  void initState() {
    todoList.addAll(['dsad', '2', '3']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text("Todo page"),
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            TextEditingController controller;
            if (controllers.length > index) {
              controller = controllers[index];
            } else {
              controller = TextEditingController(text: todoList[index]);
              controllers.add(controller);
            }
            return Dismissible(
              onDismissed: (direction) {
                setState(() {
                  todoList.removeAt(index);
                  controllers.removeAt(index);
                });
              },
              key: Key(todoList[index]),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Изменить элемент'),
                        content: TextField(
                          autofocus: true,
                          controller: controller,
                          onChanged: (value) {
                            _changedTodoText = value;
                          },
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                todoList[index] = _changedTodoText;
                              });
                              Navigator.of(context).pop();
                            },
                            child: const Icon(Icons.change_circle),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  margin: const EdgeInsets.only(top: 20),
                  color: Colors.amberAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(todoList[index]),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            todoList.removeAt(index);
                            controllers.removeAt(index);
                          });
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Добавить элемент'),
                  content: TextField(
                    autofocus: true,
                    onChanged: (value) {
                      _textValue = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            todoList.add(_textValue);
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Icon(Icons.add))
                  ],
                );
              });
        },
        backgroundColor: Colors.amberAccent,
        child: const Icon(Icons.add_box),
      ),
    );
  }
}