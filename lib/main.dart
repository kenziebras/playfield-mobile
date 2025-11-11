import 'package:flutter/material.dart';
// Update path impor ini
import 'package:playfield_mobile/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Playfield Mobile', // Sesuaikan judul
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo), // Sesuaikan tema
        useMaterial3: true,
      ),
      home: MyHomePage(), // Tidak perlu pass colorScheme jika tidak dipakai
    );
  }
}