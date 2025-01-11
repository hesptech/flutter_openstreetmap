import 'package:flutter/material.dart';
import 'package:flutter_openstreetmap/custom_bottom_navigation.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const CustomBottomNavigation(),
    );
  }
}
