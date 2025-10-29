Tugas 7

1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

Widget tree adalah struktur hierarki dari semua widget yang membangun UI aplikasi Anda, bayangkan seperti pohon silsilah. Di paling atas ada widget "root", yang memiliki widget "anak" (child), dan anak-anak itu bisa memiliki anak-anak mereka sendiri. Hubungan parent-child ini sangat penting karena parent (induk) adalah yang mengontrol dan menentukan posisi, ukuran, dan tata letak dari child (anak) yang dibungkusnya. Misalnya, Column (parent) akan memaksa semua child-nya untuk tersusun secara vertikal.

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

Dalam proyek ini, MaterialApp adalah widget root yang menyediakan tema dan navigasi. Scaffold bertindak sebagai kerangka utama halaman, memberi kita AppBar untuk judul dan body untuk konten. Di dalam body, kita menggunakan Column untuk menyusun ShopButton (widget kustom kita) secara vertikal, dengan SizedBox untuk memberi jarak. Terakhir, ShopButton menggunakan InkWell agar bisa diklik untuk memicu ScaffoldMessenger yang menampilkan SnackBar.

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

MaterialApp adalah widget pembungkus utama yang menyediakan semua fungsionalitas dan standar Material Design dari Google. Fungsinya adalah untuk mengatur tema global, font, dan yang terpenting, menyediakan sistem navigasi (Navigator) untuk berpindah antar halaman. Ia harus digunakan sebagai widget root karena hampir semua widget dasar lainnya, seperti Scaffold, bergantung padanya untuk bisa berfungsi dengan benar. Tanpa MaterialApp, aplikasi Anda tidak memiliki struktur dasar untuk tema atau navigasi.

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

StatelessWidget adalah widget yang tetap dan tidak bisa berubah setelah dibuat; tampilannya murni bergantung pada konfigurasi awal yang diterimanya. StatefulWidget bersifat dinamis, artinya ia memiliki objek State internal yang bisa menyimpan data dan berubah selama aplikasi berjalan. Ketika datanya berubah menggunakan setState(), widget tersebut akan digambar ulang. Pilih StatelessWidget untuk UI statis seperti ikon atau teks, dan gunakan StatefulWidget hanya jika Anda perlu UI tersebut berubah secara internal.

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

BuildContext adalah "alamat" atau lokasi unik dari sebuah widget di dalam widget tree. Ini sangat penting karena berfungsi sebagai penghubung yang memungkinkan sebuah widget berinteraksi dengan widget tree di atasnya. Ia tidak bisa melihat widget lain secara langsung, jadi ia menggunakan BuildContext untuk "mencari" layanan parent. Dalam metode build, kita menggunakannya untuk menemukan hal-hal seperti Theme.of(context), Navigator.of(context), atau seperti di proyek kita, ScaffoldMessenger.of(context) untuk menampilkan SnackBar.

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

Hot Reload adalah fitur yang menyuntikkan kode baru ke aplikasi yang sedang berjalan tanpa menghilangkan state (data) saat ini. Ini sangat cepat dan ideal untuk mengutak-atik UI, seperti mengubah warna atau layout, karena Anda tetap berada di halaman yang sama. Hot Restart, di sisi lain, akan memulai ulang seluruh aplikasi dan menghapus semua state yang tersimpan. Gunakan Hot Restart ketika Anda mengubah logika state yang kompleks atau saat Hot Reload tidak berfungsi.

7. Jelaskan bagaimana kamu menambahkan navigasi untuk berpindah antar layar di aplikasi Flutter.

Navigasi di Flutter dikelola oleh Navigator, yang bekerja seperti sebuah tumpukan (stack) layar. Saat aplikasi dimulai, layar utama diletakkan di dasar tumpukan. Untuk berpindah ke layar baru, Anda menggunakan Navigator.push(), yang mendorong (push) layar baru ke atas tumpukan, menutupi layar lama. Untuk kembali, Navigator.pop() digunakan untuk mengeluarkan (pop) layar saat ini dari tumpukan, yang akan menampilka layar di bawahnya.