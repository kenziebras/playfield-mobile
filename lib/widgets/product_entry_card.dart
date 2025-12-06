import 'package:flutter/material.dart';
import 'package:playfield_mobile/models/product_entry.dart'; // Pastikan path ini sesuai

class ProductEntryCard extends StatelessWidget {
  final ProductEntry product;

  const ProductEntryCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail (Menggunakan Proxy Image sesuai fitur backend kamu)
            // Pastikan product.fields.thumbnail tidak null atau kosong
            if (product.fields.thumbnail != null && product.fields.thumbnail!.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  // Ganti localhost dengan 10.0.2.2 jika di emulator Android
                  'http://10.0.2.2:8000/proxy-image/?url=${Uri.encodeComponent(product.fields.thumbnail!)}',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 150,
                    color: Colors.grey[300],
                    child: const Center(child: Icon(Icons.broken_image)),
                  ),
                ),
              ),
            const SizedBox(height: 12),

            // Nama Produk
            Text(
              product.fields.name,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),

            // Harga
            Text(
              'Rp ${product.fields.price}',
              style: TextStyle(
                color: Colors.green[700],
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 6),

            // Kategori
            Text(
              'Category: ${product.fields.category}',
              style: const TextStyle(
                color: Colors.black54,
                fontStyle: FontStyle.italic
              ),
            ),
            const SizedBox(height: 8),

            // Deskripsi
            Text(
              product.fields.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.black87),
            ),
            
            // Indikator Featured/Hot
            const SizedBox(height: 8),
            Row(
              children: [
                if (product.fields.isFeatured)
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.amber),
                    ),
                    child: const Text('Featured', style: TextStyle(fontSize: 10, color: Colors.amber)),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}