import 'package:flutter/material.dart';
import 'package:playfield_mobile/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Playfield Mobile',
      theme: ThemeData(
        // Mengatur tema gelap
        brightness: Brightness.dark,
        primaryColor: Colors.grey[850],
        scaffoldBackgroundColor: Colors.grey[900],

        // Mengatur warna dasar dari swatch
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.grey,
          brightness: Brightness.dark,
        ).copyWith(
          // Sesuaikan warna sekunder jika perlu
          secondary: Colors.blueAccent,
        ),

        // Mengatur tema AppBar
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[850],
          elevation: 2.0,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),

        useMaterial3: true,
      ),
      home: MyHomePage(), // Halaman utama kita
    );
  }
}