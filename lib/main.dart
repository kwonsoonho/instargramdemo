import 'package:flutter/material.dart';
import 'package:instargramdemo/screen/scr_root.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.black,
        primarySwatch: Colors.blue,
      ),
      home: RootPage(),
    );
  }
}
