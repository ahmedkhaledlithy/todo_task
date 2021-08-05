import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/providers/todo_provider.dart';
import 'package:todo_task/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => TodoProvider()),
        ],
    child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
