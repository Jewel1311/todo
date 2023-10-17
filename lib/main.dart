import 'package:flutter/material.dart';
import 'package:todo/screens/add_task.dart';
import 'package:todo/screens/edit_task.dart';
import 'package:todo/screens/list_tasks.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://bucomozxjrujaeallbog.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ1Y29tb3p4anJ1amFlYWxsYm9nIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTczNjU1MjIsImV4cCI6MjAxMjk0MTUyMn0.IJZzkHqqaEWMBPCv1RZ0m43ZXkBSnmb5U9tdWXyLdzw',
  );
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo App",
      initialRoute: '/',
      routes: {
        '/' : (context) => ListTasks(),
        '/addtask' : (context) => AddTask(),
        '/edittask' : (context) =>  EditTask(),
      },
    );
  }
}