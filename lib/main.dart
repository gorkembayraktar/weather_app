import 'package:flutter/material.dart';
import 'package:havadurumu/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hava Durumu',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Hava Durumu'),
    );
  }
}

