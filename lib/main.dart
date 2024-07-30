import 'package:flutter/material.dart';
import 'package:whatsspp_ui/home_screen.dart';

void main() {
runApp(MyApp());
}class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: HomeScreen(),
    );
  }
}
