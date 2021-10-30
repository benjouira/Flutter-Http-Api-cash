import 'package:flutter/material.dart';
import 'package:my_api_project/futureBuilder.dart';
import 'package:my_api_project/http&api.dart';
import 'package:my_api_project/pagetow.dart';
import 'package:my_api_project/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Shared_PreferencesClass(),
      routes: {
        "two": (context) => PageTwo(),
      },
    );
  }
}
