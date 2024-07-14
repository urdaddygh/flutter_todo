import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("Main page"),
      ),
      body: Column(
        children: [
          const Text("Нажми на кнопку чтобы начать заполнять задачи на день",
              style: TextStyle(color: Colors.black, fontSize: 20)),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/todo', (route) => false);
            },
            child: const Icon(Icons.navigate_next_outlined),
          )
        ],
      ),
    );
  }
}
