import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  
  String get title => "Playfield Mobile"; // Constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Playfield',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey[850],
        elevation: 2.0,
      ),
      // Ganti body yang lama dengan ini:
      backgroundColor: Colors.grey[900], // Set background utama scaffold
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding di sekeliling
        child: Column(
          // Menyusun widget secara vertikal
          mainAxisAlignment: MainAxisAlignment.start, // Mulai dari atas
          crossAxisAlignment: CrossAxisAlignment.stretch, // Memenuhi lebar
          children: <Widget>[
            // Tambahkan jarak
            const SizedBox(height: 20.0),

            // Tombol All Products [cite: 13, 17]
            ShopButton(
              "All Products",
              Icons.shopping_bag_outlined,
              Colors.blue[700]!, // Warna Biru
            ),

            // Tambahkan jarak
            const SizedBox(height: 16.0),

            // Tombol My Products [cite: 14, 18]
            ShopButton(
              "My Products",
              Icons.person_outline,
              Colors.green[700]!, // Warna Hijau
            ),

            // Tambahkan jarak
            const SizedBox(height: 16.0),

            // Tombol Create Product [cite: 15, 19]
            ShopButton(
              "Create Product",
              Icons.add_circle_outline,
              Colors.red[700]!, // Warna Merah
            ),
          ],
        ),
      ),
    );
  }
}


class ShopButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color; // Warna tombol [cite: 16]

  const ShopButton(this.text, this.icon, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color, // Menggunakan warna yang spesifik [cite: 17, 18, 19]
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          // Menampilkan Snackbar sesuai requirement [cite: 20]
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text("Kamu telah menekan tombol $text"), // [cite: 21, 22, 23]
              ),
            );
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
