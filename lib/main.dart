import 'package:ecodesh/presentation/user_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ecodesh',
      theme: ThemeData(
        // Sets the primary color theme for the app.
        primarySwatch: Colors.green,
        // Sets the default brightness and colors.
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF2F5EA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF669D31),
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        // Customizes the BottomAppBar theme.
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Color(0xFF0F5257),
          elevation: 8,
        ),
      ),
      home: const UserScreen(),
    );
  }
}