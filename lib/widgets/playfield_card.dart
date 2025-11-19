import 'package:flutter/material.dart';
import 'package:playfield_mobile/screens/playfield_form.dart';
import 'package:playfield_mobile/screens/login.dart'; // Impor halaman Login
import 'package:pbp_django_auth/pbp_django_auth.dart'; // Impor pbp_django_auth
import 'package:provider/provider.dart'; // Impor provider
import 'package:playfield_mobile/screens/product_entry_list.dart'; 

// Kelas Model Data
class ItemHomepage {
  final String name;
  final IconData icon;

  ItemHomepage(this.name, this.icon);
}

// Widget Card
class ItemCard extends StatelessWidget {
  final ItemHomepage item;
  final Color color;

  const ItemCard(this.item, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil request dari Provider untuk autentikasi
    final request = context.watch<CookieRequest>();

    return Material(
      color: color,
      child: InkWell(
        // Aksi ketika kartu ditekan
        onTap: () async {
          // Menampilkan SnackBar pesan default
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));

          // Navigasi ke halaman Tambah Produk
          if (item.name == "Tambah Item") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PlayfieldFormPage()),
            );
          }
          // Logika Logout
          else if (item.name == "Logout") {
            // Melakukan request logout ke backend Django
            // Pastikan URL sesuai dengan konfigurasi server Anda (localhost/10.0.2.2)
            final response = await request.logout(
                "http://localhost:8000/auth/logout/");
            
            String message = response["message"];
            
            if (context.mounted) {
              if (response['status']) {
                String uname = response["username"];
                
                // Tampilkan pesan sukses logout
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("$message Sampai jumpa, $uname."),
                ));

                // REDIRECT KE HALAMAN LOGIN (Ini bagian kuncinya)
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              } else {
                // Tampilkan pesan error jika logout gagal
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(message),
                ));
              }
            }
          }
          else if (item.name == "Lihat Produk") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProductEntryPage()
                ),
            );
          }
        },
        child: Container(
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