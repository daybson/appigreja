import 'package:flutter/material.dart';
import 'package:gtapp/databaseHelper.dart';
import 'package:gtapp/view/home.dart';
import 'package:gtapp/view/singin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.loadDatabase(-1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: false,
        ),
        home: SignIn());
  }
}
