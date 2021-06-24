import 'package:flutter/material.dart';
import 'package:image_to_pdf/provider/create_pdf.dart';
import 'package:provider/provider.dart';
//
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => CreatePdfProvider())],
        child: MaterialApp(
          home: HomeScreen(),
        ));
  }
}
