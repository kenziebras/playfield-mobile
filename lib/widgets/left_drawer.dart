import 'package:flutter/material.dart';
// Sesuaikan path ini dengan lokasi file menu.dart Anda setelah dipindah
import 'package:playfield_mobile/screens/menu.dart'; 
// Impor halaman form yang akan kita buat selanjutnya
import 'package:playfield_mobile/screens/playfield_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo, // Ganti warna sesuai tema "Playfield" Anda
            ),
            child: Column(
              children: [
                Text(
                  'Playfield', // Judul aplikasi Anda
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Catat semua item-mu di sini!", // Deskripsi aplikasi Anda
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          
          // Opsi "Halaman Utama" (Sesuai Tugas 8)
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            onTap: () {
              // Navigasi ke halaman utama (MyHomePage)
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(), // Gunakan nama kelas halaman utama Anda
                ),
              );
            },
          ),
          
          // Opsi "Tambah Produk" (Sesuai Tugas 8)
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Produk'),
            onTap: () {
              // Navigasi ke halaman form
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PlayfieldFormPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}