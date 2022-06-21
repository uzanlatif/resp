// @dart=2.9

import 'package:flutter/material.dart';
import 'package:genshin_responsi/view/home_page.dart';

//Abdul Latif Fauzan
//123190068

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}