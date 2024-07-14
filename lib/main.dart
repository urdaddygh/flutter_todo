import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/mainPages.dart';
import 'package:flutter_todo/pages/todoPages.dart';
void main()=> runApp(MaterialApp(
  theme: ThemeData(primaryColor: Colors.greenAccent),
  initialRoute: '/',
  routes: {
    '/':(context)=> const MyApp(),
    '/todo':(context) => const TodoPage()
  },
));