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


Tugas 9
1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?

Pembuatan model Dart sangat krusial untuk menjamin keamanan tipe data (type safety) dan meminimalisir kesalahan saat kompilasi (compile-time errors). Dengan model, kita mendefinisikan struktur data yang jelas, sehingga IDE dapat memberikan saran (autocomplete) dan mencegah akses ke properti yang tidak ada atau salah ketik.

Sebaliknya, menggunakan Map<String, dynamic> secara langsung membuat data menjadi tidak terstruktur dan rentan terhadap kesalahan runtime, seperti typo pada kunci (key) atau ketidakcocokan tipe data yang baru terdeteksi saat aplikasi berjalan. Hal ini juga menyulitkan pemeliharaan kode (maintainability) karena struktur data tersebar tanpa definisi tunggal yang jelas.

2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

Package http berfungsi sebagai pustaka dasar untuk melakukan permintaan HTTP standar (seperti GET dan POST) ke server, namun sifatnya stateless, artinya tidak menyimpan informasi sesi antar permintaan. CookieRequest (dari pbp_django_auth) adalah pembungkus (wrapper) di atas http yang dirancang khusus untuk menangani manajemen sesi secara otomatis.

Perbedaan utamanya terletak pada pengelolaan cookies. CookieRequest secara otomatis menyimpan dan menyertakan cookies (seperti sessionid dari Django) pada setiap permintaan berikutnya, memungkinkan aplikasi untuk mempertahankan status login pengguna, sedangkan http biasa memerlukan pengelolaan header cookie secara manual.

3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

Instance CookieRequest perlu dibagikan ke seluruh komponen aplikasi agar status login dan sesi pengguna tetap konsisten di setiap halaman. Jika setiap halaman membuat instance CookieRequest baru, maka data sesi (cookie) yang didapat saat login akan hilang, dan server akan menganggap pengguna tersebut belum terautentikasi di halaman lain.

Oleh karena itu, kita menggunakan Provider di root widget (main.dart) untuk menciptakan satu instance tunggal (singleton) CookieRequest. Instance ini kemudian diteruskan ke semua widget turunan, memastikan bahwa "tiket" sesi yang sama digunakan untuk semua interaksi dengan server.

4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

Agar Flutter di emulator Android dapat berkomunikasi dengan Django di localhost komputer, kita harus menggunakan IP 10.0.2.2 karena localhost di emulator merujuk pada emulator itu sendiri. Di sisi Django, kita perlu menambahkan IP ini ke ALLOWED_HOSTS di settings.py untuk mengizinkan akses, serta mengonfigurasi CORS agar server menerima permintaan dari domain asal aplikasi.

Selain itu, pada Android, kita wajib menambahkan izin android.permission.INTERNET di AndroidManifest.xml agar aplikasi diizinkan melakukan koneksi jaringan. Tanpa konfigurasi ini, komunikasi akan gagal dengan pesan error seperti Connection Refused atau aplikasi akan macet karena akses jaringan diblokir oleh sistem operasi.

5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

Proses dimulai saat pengguna menginput data di form Flutter, yang kemudian dikonversi menjadi format JSON. Menggunakan CookieRequest, data JSON ini dikirim melalui HTTP POST ke endpoint Django. Di server, Django memvalidasi data tersebut, menyimpannya ke database, dan mengembalikan respons sukses.

Untuk menampilkannya kembali, Flutter melakukan permintaan HTTP GET ke endpoint JSON Django. Data JSON yang diterima kemudian di-decode dan dikonversi menjadi objek model Dart. Terakhir, widget seperti FutureBuilder atau ListView digunakan untuk menyusun dan menampilkan data tersebut ke layar pengguna secara dinamis.

6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Proses autentikasi dimulai dengan pengiriman kredensial (username/password) dari Flutter ke endpoint Django (/auth/login/ atau /auth/register/) menggunakan POST request. Jika valid, Django membuat sesi di server dan mengirimkan cookie sessionid ke Flutter. CookieRequest menyimpan cookie ini sehingga status "loggedIn" menjadi true.

Untuk logout, Flutter mengirim permintaan ke endpoint /auth/logout/ dengan menyertakan cookie sesi tersebut. Django kemudian menghapus sesi di server, dan Flutter merespons dengan menghapus cookie lokal serta mengubah status login menjadi false, mengembalikan pengguna ke halaman login.

7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

Pertama, saya menyiapkan backend Django dengan menambahkan corsheaders, mengatur ALLOWED_HOSTS, dan membuat view khusus untuk autentikasi serta endpoint JSON produk. Kemudian di Flutter, saya menginstal package provider dan pbp_django_auth, serta memodifikasi main.dart untuk menyediakan CookieRequest ke seluruh aplikasi.

Selanjutnya, saya membuat model Dart (product_entry.dart) untuk memetakan data JSON. Saya mengimplementasikan halaman Login dan Register yang terhubung ke Django, serta membuat halaman daftar produk yang mengambil data via GET request dan menampilkannya. Terakhir, saya menambahkan logika Logout pada widget menu/drawer untuk menghapus sesi pengguna.