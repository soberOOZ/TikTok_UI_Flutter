import 'package:flutter/material.dart';
import 'package:tik_tok_ui/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: Theme.of(context)
        .textTheme
        .apply(bodyColor: Colors.white, displayColor: Colors.white)
      ),
      title: 'TikTokUI',
      home: Home(),
    );
  }
}