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


Tugas 8
1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

Navigator.push() ini "mendorong" sebuah halaman baru (route) ke atas stack navigasi. Halaman sebelumnya tetap ada di dalam stack di bawahnya. Pengguna bisa kembali ke halaman sebelumnya dengan menekan tombol "kembali" (baik di AppBar atau tombol fisik perangkat).

Pada aplikasi ini, push() idealnya digunakan saat berpindah dari Halaman Utama ke halaman Tambah Produk (baik melalui tombol "Tambah Item" atau menu di drawer). Ini penting agar setelah pengguna selesai (atau batal) mengisi form, mereka bisa kembali ke Halaman Utama dengan mudah.

Navigator.pushReplacement() ini juga mendorong halaman baru, tetapi ia "mengganti" halaman saat ini di stack. Halaman sebelumnya (yang diganti) akan dihapus dari stack dan di-dispose. Pengguna tidak bisa kembali ke halaman yang diganti tersebut.

Pada aplikasi ini, ini sangat cocok digunakan saat berpindah dari Halaman Login ke Halaman Utama. Setelah login berhasil, pengguna tidak seharusnya bisa "kembali" ke Halaman Login. Begitu pula saat logout, kita menggunakan pushReplacement untuk kembali ke Halaman Login dan menghapus Halaman Utama dari riwayat navigasi.

2. Bagaimana kamu memanfaatkan hierarki widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

Scaffold: Digunakan sebagai kerangka dasar atau template untuk setiap halaman utama di aplikasi (seperti MyHomePage dan PlayfieldFormPage). Scaffold menyediakan slot standar untuk appBar, body, dan drawer. Dengan menerapkan Scaffold di setiap halaman, kita mendapatkan struktur visual yang konsisten secara otomatis.

AppBar: Ditempatkan di slot appBar pada Scaffold. Ini menyediakan area di bagian atas layar untuk judul halaman dan tombol navigasi (seperti tombol "kembali" atau ikon menu drawer). Penggunaan AppBar yang seragam di MyHomePage dan PlayfieldFormPage memberikan tampilan yang familier bagi pengguna.

Drawer: Agar tidak perlu membuat ulang menu navigasi di setiap halaman, Drawer dibuat sebagai widget terpisah (LeftDrawer.dart). Kemudian, pada setiap Scaffold yang membutuhkannya (seperti MyHomePage dan PlayfieldFormPage), kita cukup mengimpor dan menempatkan widget LeftDrawer tersebut di slot drawer. Hasilnya, menu navigasi samping akan identik dan konsisten di seluruh bagian aplikasi.

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form?

Padding memberikan "ruang" visual (spasi) di sekitar elemen form, seperti TextFormField atau tombol. Tanpa Padding, semua widget akan saling menempel dan menempel di tepi layar, membuatnya terlihat sesak dan sulit digunakan. Padding secara signifikan meningkatkan keterbacaan dan estetika antarmuka.

SingleChildScrollView ini sangat penting untuk form. Widget ini memastikan konten yang lebih panjang dari ukuran layar (misalnya form dengan banyak isian) dapat di-scroll. Saat keyboard virtual muncul dan menutupi sebagian layar, SingleChildScrollView memungkinkan pengguna untuk tetap menggeser tampilan dan mengakses field yang tertutup.

ListView sangat ideal untuk menampilkan daftar elemen secara vertikal dan secara otomatis menyediakan fungsionalitas scroll. Untuk daftar yang datanya sangat banyak atau dinamis, ListView.builder menawarkan efisiensi memori yang sangat baik.

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Cara yang paling efektif adalah mengaturnya secara terpusat di dalam MaterialApp (pada berkas lib/main.dart) menggunakan properti theme. Dengan mendefinisikan ThemeData di satu lokasi, kita bisa mengatur colorScheme (skema warna). Cukup dengan menentukan seedColor (misalnya, warna Colors.indigo sesuai brand "Playfield"), Flutter akan secara cerdas menghasilkan palet warna yang harmonis untuk berbagai komponen (seperti primary, secondary, tertiary).

Keuntungannya adalah kita tidak perlu lagi mendefinisikan warna secara manual di setiap AppBar, ElevatedButton, atau DrawerHeader. Semua widget di dalam aplikasi akan secara otomatis mengadopsi skema warna ini, sehingga menciptakan identitas visual yang konsisten.
