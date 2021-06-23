import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_to_pdf/pick_image.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
