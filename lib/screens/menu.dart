import 'package:flutter/material.dart';
// Impor drawer
import 'package:playfield_mobile/widgets/left_drawer.dart';
// Impor card (yang sekarang berisi ItemHomepage dan ItemCard)
import 'package:playfield_mobile/widgets/playfield_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  // Data Anda (tidak berubah)
  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Item", Icons.checklist),
    ItemHomepage("Tambah Item", Icons.add_shopping_cart),
    ItemHomepage("Logout", Icons.logout),
  ];
  
  // Daftar warna untuk card
  final List<Color> colors = [Colors.blue, Colors.green, Colors.red];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Playfield', // Judul aplikasi Anda
        ),
        backgroundColor: Colors.indigo, // Sesuaikan warna
        foregroundColor: Colors.white,
      ),
      
      // TAMBAHKAN DRAWER DI SINI (Sesuai Tugas 8)
      drawer: const LeftDrawer(),
      
      // Body (kode Anda yang sudah ada)
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Welcome to Playfield', // Ganti sapaan
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.asMap().entries.map((entry) {
                  int index = entry.key;
                  ItemHomepage item = entry.value;
                  // Gunakan widget ItemCard yang sudah di-refactor
                  // dan pass warnanya
                  return ItemCard(item, colors[index]);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// KELAS ItemHomepage DAN ItemCard DIHAPUS DARI SINI