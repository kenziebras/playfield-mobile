import 'package:flutter/material.dart';
// Impor halaman form
import 'package:playfield_mobile/screens/playfield_form.dart'; 

// Kelas Model Data Anda (dipindahkan dari menu.dart)
class ItemHomepage {
  final String name;
  final IconData icon;

  ItemHomepage(this.name, this.icon);
}

// Widget Card Anda (dipindahkan dari menu.dart dan dimodifikasi)
class ItemCard extends StatelessWidget {
  final ItemHomepage item;
  final Color color; // Ambil warna dari menu.dart

  const ItemCard(this.item, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color, // Gunakan warna yang di-pass
      child: InkWell(
        // Modifikasi onTap
        onTap: () {
          // Menampilkan pesan SnackBar (kode Anda yang sudah ada)
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
          
          // Tambahkan Navigasi (Sesuai Tugas 8)
          // Cek nama item (sesuai data di menu.dart Anda)
          if (item.name == "Tambah Item") { // "Tambah Item" dari repo Anda
            // Navigasi ke halaman form
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PlayfieldFormPage()),
            );
          }
        },
        child: Container(
          // ... (Sisa kode Container Anda tidak berubah) ...
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}