# NetQuest: Misi Jaringan Komputer

[![Deploy Web & APK](https://github.com/dewaputubagusmahadinata-gif/netquest/actions/workflows/deploy.yml/badge.svg)](https://github.com/dewaputubagusmahadinata-gif/netquest/actions/workflows/deploy.yml)
[![Live Web Demo](https://img.shields.io/badge/Web_Demo-Online-brightgreen?logo=googlechrome&logoColor=white)](https://dewaputubagusmahadinata-gif.github.io/netquest/)
[![Download APK](https://img.shields.io/badge/Download-Android_APK-blue?logo=android&logoColor=white)](https://github.com/dewaputubagusmahadinata-gif/netquest/releases)
[![Flutter](https://img.shields.io/badge/Flutter-3.47.2-02569B?logo=flutter&logoColor=white)](https://flutter.dev)

> **NetQuest** adalah aplikasi *learning game* interaktif untuk mata pelajaran Informatika SMA Kelas X (topik Jaringan Komputer dan Internet) yang dirancang dengan pendekatan pedagogis **Diferensiasi Konten Berbasis Kesiapan Belajar (*Readiness-based Content Differentiation*)**.

---

### 🚀 Cara Akses & Mencoba Aplikasi

1. 🌐 **Versi Web (Bisa Dibagikan Langsung)**:  
   👉 **[https://dewaputubagusmahadinata-gif.github.io/netquest/](https://dewaputubagusmahadinata-gif.github.io/netquest/)**  
   *(Bisa dimainkan di browser desktop maupun HP tanpa perlu instal aplikasi)*

2. 📱 **Versi Android (File APK Siap Pakai)**:  
   👉 **[Download NetQuest.apk di Halaman Releases](https://github.com/dewaputubagusmahadinata-gif/netquest/releases)**  
   *(Unduh file `NetQuest.apk`, lalu buka di smartphone Android untuk instalasi)*

---

## 🎯 Konsep Pedagogis: Diferensiasi Konten Berbasis Kesiapan

1. **Aspek Kebutuhan Belajar: Kesiapan Belajar (*Readiness*)**
   - Siswa memiliki tingkat pengetahuan awal (*prior knowledge*) yang beragam mengenai jaringan komputer.
   - Di awal sesi, siswa mengerjakan **Cek Kesiapan** (5 soal diagnostik cepat tanpa nyawa & poin).
2. **Elemen Diferensiasi: Diferensiasi Konten**
   - Berdasarkan skor diagnostik (0–5), siswa mendapatkan rekomendasi level belajar yang disesuaikan:
     - **Skor 0–2 $\to$ Level 1: Pijakan (🌱 Hijau)**: Fokus pada pondasi intuitif, analogi jalan raya, perangkat utama (switch, router), LAN, dan topologi star.
     - **Skor 3–4 $\to$ Level 2: Jelajah (🧭 Biru)**: Eksplorasi jangkauan (LAN, MAN, WAN), perbandingan karakteristik topologi (bus, star, ring, mesh), media transmisi (UTP, fiber optik, nirkabel), dan alamat IP.
     - **Skor 5 $\to$ Level 3: Tantang (🚀 Oranye)**: Pendalaman teknis subnetting IPv4 `/24`, layanan jaringan pendukung (DNS, DHCP, default gateway), dan troubleshooting bertingkat (*ping*).
   - Setiap level memiliki **Kartu Materi** khusus dengan kedalaman berbeda dan bank soal misi (4 soal) yang berbeda.
3. **Tujuan Pembelajaran Bersama (Boss Tantangan)**
   - Meskipun materi dan misi terdiferensiasi, **SEMUA siswa bermuara pada misi Boss yang sama** (*"Bangun Jaringan Sekolah"*). Hal ini memastikan standar kompetensi kelulusan yang setara bagi seluruh peserta didik.
4. **Fleksibilitas (Level Bersifat Sementara)**
   - Siswa tidak dikotakkan secara permanen. Siswa dapat berpindah level kapan saja melalui tombol **"Pindah level"**, **"Pilih level lain"**, atau opsi **"Turun ke Level N-1"** saat nyawa habis.

---

## 🎮 Aturan & Mekanika Permainan

- **Skor & Streak**:
  - Jawaban benar: **+10 poin**.
  - **Streak**: Menghitung jawaban benar beruntun. Mulai streak ke-3 dan seterusnya, siswa memperoleh bonus **+5 poin** (total **+15 poin**) serta lencana *"Beruntun N!"*.
- **Nyawa & Tantangan**:
  - Jawaban salah: Nyawa berkurang 1, streak tereset ke 0.
  - Nyawa awal: 3 per sesi misi / Boss.
  - Nyawa habis: Menampilkan layar opsi ramah belajar (*Baca materi lagi*, *Turun ke Level N-1*, *Coba misi lagi*).
  - Cek Kesiapan tidak menggunakan nyawa maupun poin agar siswa merasa aman dan rileks dalam asesmen awal.
- **Pengacakan Opsi**:
  - Urutan 4 pilihan jawaban selalu diacak di setiap soal dengan pelacakan indeks asli agar adil.
- **Umpan Balik Instan**:
  - Setelah menjawab, seluruh tombol terkunci, ditandai centang (jawaban benar) dan silang (jika salah memilih), disertai banner umpan balik penjelasan konsep.
- **Gelar Akhir**:
  - Skor Boss 3: **"Arsitek Jaringan"** 🏆
  - Skor Boss 2: **"Teknisi Jaringan"** 🛠️
  - Selain itu: **"Calon Teknisi"** 🌱
  - Dilengkapi 3 pertanyaan **Refleksi Belajar** interaktif.

---

## 🎨 Desain Visual (Quizizz / Wayground Style)

- **Palet Warna**:
  - Gradien ungu khas: `#7B3FD6` ke `#34188A`.
  - Kartu putih melengkung (radius 18) dengan garis bawah tebal `#D9D1EE` untuk efek 3D timbul.
  - Tombol aksi kuning Quizizz: `#FFC93C`, teks `#2B1B00`, bayangan bawah `#D8A600`.
- **4 Pilihan Jawaban Berwarna & Berbentuk**:
  - 🔴 Merah `#E21B3C` — Segitiga `▲`
  - 🔵 Biru `#1368CE` — Belah Ketupat `◆`
  - 🟡 Kuning `#D89E00` — Lingkaran `●`
  - 🟢 Hijau `#26890C` — Persegi `■`
- **Responsif & Aksesibel**:
  - Layout 2 kolom pada layar lebar ($\ge 520\text{ dp}$), 1 kolom pada ponsel.
  - Tinggi tombol jawaban minimal $68\text{ dp}$ (target sentuh aman $> 48\text{ dp}$).
  - Konten utama dipusatkan dengan batas maksimal lebar $640\text{ dp}$.
  - Label Semantics lengkap dan menghormati opsi *reduce motion* pengguna.

---

## 📁 Struktur Folder Proyek

```
lib/
├── data/
│   └── game_content.dart         # Bank soal Cek Kesiapan, Level 1-3, Boss & Kartu Materi
├── models/
│   ├── game_mode.dart            # Enum mode: readiness, mission, boss
│   ├── level.dart                # Model level (Pijakan, Jelajah, Tantang) & formula kesiapan
│   ├── material_card.dart        # Model kartu materi per level
│   └── question.dart             # Model soal, opsi teracak aman, validasi jawaban
├── screens/
│   ├── boss_intro_screen.dart    # Intro misi Boss dan total poin
│   ├── game_over_screen.dart     # Layar nyawa habis dengan opsi pedagogis adaptif
│   ├── intro_screen.dart         # Halaman muka aplikasi & petunjuk cara bermain
│   ├── level_select_screen.dart  # Halaman eksplorasi & pemilihan level mandiri
│   ├── material_screen.dart      # Kartu materi spesifik level belajar
│   ├── placement_screen.dart     # Hasil tes diagnostik & rekomendasi level
│   ├── quiz_screen.dart          # Layar kuis responsif untuk Cek Kesiapan, Misi, & Boss
│   └── result_screen.dart        # Hasil akhir, lencana gelar, skor, & refleksi siswa
├── state/
│   └── game_controller.dart      # State controller ChangeNotifier (logika poin, nyawa, streak)
├── theme/
│   └── app_theme.dart            # Tema visual Material 3, font Nunito, palet warna Quizizz
├── widgets/
│   ├── answer_button.dart        # Tombol 4 warna & bentuk geometris dengan efek 3D
│   ├── app_scaffold.dart         # Wrapper responsif (gradien ungu, max-width 640 dp)
│   ├── custom_button.dart        # Tombol 3D Quizizz tactile dengan animasi tekan
│   ├── feedback_banner.dart      # Banner penjelasan benar/salah bawah layar
│   ├── game_card.dart            # Kartu putih 3D dengan garis bawah tebal
│   ├── hud_bar.dart              # Status bar (mode, nyawa hati, skor bintang, streak api)
│   ├── level_card.dart           # Kartu informasi level belajar
│   └── route_dots.dart           # Jalur kemajuan soal terhubung garis
└── main.dart                     # Entry point & inisialisasi Provider GameController
```

---

## 🚀 Cara Menjalankan

### 1. Prasyarat
- Pastikan Flutter SDK sudah terpasang (`>= 3.13.2`).
- Pastikan Google Chrome terpasang (untuk target Web).

### 2. Instalasi Paket
```bash
flutter pub get
```

### 3. Pengujian (Testing & Analisis)
```bash
# Menjalankan unit tests dan widget tests
flutter test

# Memeriksa kepatuhan linter Dart
flutter analyze
```

### 4. Menjalankan di Chrome (Web)
```bash
flutter run -d chrome
```

### 5. Menjalankan di Android
```bash
# Pastikan emulator Android berjalan atau perangkat terhubung via USB
flutter run -d android
```

### 6. Build Web Rilis
```bash
flutter build web --release
```
