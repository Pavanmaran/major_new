import 'package:flutter/material.dart';

import 'package:milkizz/contact.dart';

void main() async {

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your applicati(on.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Database',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        accentColor: Colors.redAccent,
      ),
      home: Contacts(),
    );
  }
}
