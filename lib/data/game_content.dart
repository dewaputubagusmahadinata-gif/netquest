import '../models/level.dart';
import '../models/material_card.dart';
import '../models/question.dart';

/// Bank data materi dan pertanyaan NetQuest persis sesuai spesifikasi kurikulum.
class GameContent {
  // ==========================================
  // Cek Kesiapan (Pool 15 Soal – ambil 5 acak)
  // ==========================================
  static List<Question> readinessQuestions = [
    Question(
      id: 'readiness_1',
      text: 'Perangkat yang menghubungkan banyak komputer dalam satu LAN adalah…',
      options: ['Switch', 'Printer', 'Webcam', 'Flashdisk'],
      correctIndex: 0,
      explanation:
          'Switch adalah terminal pusat LAN yang menghubungkan banyak perangkat di satu jaringan lokal.',
    ),
    Question(
      id: 'readiness_2',
      text: 'Jaringan dalam satu gedung disebut…',
      options: ['WAN', 'LAN', 'Satelit', 'Radio'],
      correctIndex: 1,
      explanation:
          'LAN (Local Area Network) mencakup area kecil seperti satu ruangan atau gedung.',
    ),
    Question(
      id: 'readiness_3',
      text: 'Internet termasuk jaringan berjangkauan…',
      options: ['Sangat luas (WAN)', 'Satu meja', 'Satu ruangan', 'Satu kabel'],
      correctIndex: 0,
      explanation:
          'Internet adalah WAN (Wide Area Network) yang menghubungkan jaringan di seluruh dunia.',
    ),
    Question(
      id: 'readiness_4',
      text: 'Topologi dengan satu titik pusat adalah…',
      options: ['Bus', 'Star', 'Ring', 'Tidak ada'],
      correctIndex: 1,
      explanation:
          'Topologi Star: semua komputer tersambung ke satu perangkat pusat (biasanya switch).',
    ),
    Question(
      id: 'readiness_5',
      text: 'Alamat IP berfungsi sebagai…',
      options: [
        'Warna kabel',
        'Identitas perangkat di jaringan',
        'Kecepatan prosesor',
        'Nama pengguna email',
      ],
      correctIndex: 1,
      explanation:
          'Alamat IP adalah identitas unik setiap perangkat agar paket data sampai ke tujuan yang benar.',
    ),
    Question(
      id: 'readiness_6',
      text: 'Perangkat yang menghubungkan jaringan rumah ke internet adalah…',
      options: ['Switch', 'Hub', 'Router', 'Repeater'],
      correctIndex: 2,
      explanation:
          'Router berfungsi sebagai gerbang (gateway) yang menghubungkan LAN rumah ke jaringan internet yang lebih luas.',
    ),
    Question(
      id: 'readiness_7',
      text: 'Pada topologi ring, data dikirim dengan cara…',
      options: [
        'Langsung ke tujuan tanpa melewati node lain',
        'Berputar satu arah melewati setiap node',
        'Disiarkan ke semua node sekaligus',
        'Dikirim melalui satelit',
      ],
      correctIndex: 1,
      explanation:
          'Topologi ring: data berputar satu arah melewati setiap node hingga sampai ke tujuan.',
    ),
    Question(
      id: 'readiness_8',
      text: 'Layanan yang mengubah nama domain (seperti google.com) menjadi alamat IP adalah…',
      options: ['DHCP', 'FTP', 'DNS', 'HTTP'],
      correctIndex: 2,
      explanation:
          'DNS (Domain Name System) menerjemahkan nama domain yang mudah diingat manusia menjadi alamat IP yang dimengerti komputer.',
    ),
    Question(
      id: 'readiness_9',
      text: 'Media transmisi yang paling cepat dan tahan gangguan elektromagnetik adalah…',
      options: ['Kabel UTP', 'Kabel coaxial', 'Fiber optik', 'Wi-Fi'],
      correctIndex: 2,
      explanation:
          'Fiber optik menggunakan cahaya sebagai media pengiriman data, sehingga sangat cepat dan kebal terhadap gangguan elektromagnetik.',
    ),
    Question(
      id: 'readiness_10',
      text:
          'Perbedaan utama antara hub dan switch adalah…',
      options: [
        'Hub lebih mahal dari switch',
        'Hub meneruskan data ke semua port; switch hanya ke port tujuan',
        'Switch tidak bisa dipakai untuk LAN',
        'Hub lebih cepat dari switch',
      ],
      correctIndex: 1,
      explanation:
          'Hub menyiarkan (broadcast) data ke semua perangkat yang terhubung, sedangkan switch hanya mengirim data ke perangkat tujuan sehingga lebih efisien.',
    ),
    Question(
      id: 'readiness_11',
      text: 'Topologi yang menggunakan satu kabel utama (backbone) bersama adalah…',
      options: ['Star', 'Ring', 'Bus', 'Mesh'],
      correctIndex: 2,
      explanation:
          'Topologi bus: semua perangkat terhubung ke satu kabel utama bersama; jika kabel putus, seluruh jaringan terganggu.',
    ),
    Question(
      id: 'readiness_12',
      text: 'MAN (Metropolitan Area Network) mencakup area…',
      options: [
        'Satu ruangan',
        'Satu gedung',
        'Satu kota atau beberapa wilayah kota',
        'Seluruh dunia',
      ],
      correctIndex: 2,
      explanation:
          'MAN menghubungkan jaringan dalam satu kota atau metropolitan, lebih luas dari LAN tetapi lebih sempit dari WAN.',
    ),
    Question(
      id: 'readiness_13',
      text: 'Perintah yang digunakan untuk memeriksa konektivitas ke perangkat lain di jaringan adalah…',
      options: ['ipconfig', 'ping', 'tracert', 'netstat'],
      correctIndex: 1,
      explanation:
          'Perintah ping mengirim paket ICMP ke alamat tujuan untuk menguji apakah perangkat tersebut dapat dijangkau.',
    ),
    Question(
      id: 'readiness_14',
      text: 'Protokol yang digunakan untuk mentransfer halaman web dari server ke browser adalah…',
      options: ['FTP', 'SMTP', 'HTTP', 'SSH'],
      correctIndex: 2,
      explanation:
          'HTTP (HyperText Transfer Protocol) adalah protokol standar untuk mengirim halaman web dari server ke browser pengguna.',
    ),
    Question(
      id: 'readiness_15',
      text: 'Layanan yang secara otomatis memberikan alamat IP kepada perangkat yang terhubung ke jaringan adalah…',
      options: ['DNS', 'DHCP', 'NAT', 'HTTP'],
      correctIndex: 1,
      explanation:
          'DHCP (Dynamic Host Configuration Protocol) secara otomatis mengalokasikan alamat IP, subnet mask, gateway, dan DNS ke perangkat yang baru terhubung.',
    ),
  ];

  // ==========================================
  // Kartu Materi per Level
  // ==========================================
  static const Map<GameLevel, List<MaterialCardItem>> materialCards = {
    GameLevel.level1: [
      MaterialCardItem(
        title: 'Jaringan komputer itu apa?',
        content:
            'Bayangkan jalan raya yang menghubungkan rumah-rumah. Jaringan komputer adalah kumpulan komputer dan perangkat yang saling terhubung agar bisa berbagi data, printer, dan koneksi internet.',
      ),
      MaterialCardItem(
        title: 'Perangkat penting',
        content:
            'Kabel/Wi-Fi: jalan tempat data lewat. Switch: seperti terminal pusat yang menghubungkan banyak komputer dalam satu ruangan atau gedung. Router: gerbang yang menghubungkan jaringan kita ke internet.',
      ),
      MaterialCardItem(
        title: 'Jenis berdasarkan luas',
        content:
            'LAN: satu ruangan atau gedung (lab sekolah, Wi-Fi rumah). WAN: sangat luas, antarkota atau negara (internet).',
      ),
      MaterialCardItem(
        title: 'Bentuk susunan (topologi)',
        content:
            'Star: semua komputer tersambung ke satu titik pusat, seperti jari-jari roda sepeda.',
      ),
    ],
    GameLevel.level2: [
      MaterialCardItem(
        title: 'Jenis jaringan menurut jangkauan',
        content:
            'LAN: gedung atau kampus kecil. MAN: satu kota. WAN: antarkota atau antarnegara, contohnya internet.',
      ),
      MaterialCardItem(
        title: 'Topologi dan sifatnya',
        content:
            'Bus: satu kabel utama; murah, tetapi kabel utama putus berarti jaringan mati. Star: mudah dikembangkan dan dilacak masalahnya; bergantung pada switch. Ring: data berputar satu arah. Mesh: banyak jalur alternatif; andal tetapi mahal.',
      ),
      MaterialCardItem(
        title: 'Media transmisi',
        content:
            'Kabel UTP: murah, jarak pendek. Fiber optik: cahaya, jarak jauh, kebal gangguan elektromagnetik. Nirkabel: praktis, tetapi lebih rentan gangguan.',
      ),
      MaterialCardItem(
        title: 'Alamat IP',
        content:
            'Setiap perangkat butuh alamat IP agar data sampai ke tujuan yang benar, mirip alamat rumah.',
      ),
    ],
    GameLevel.level3: [
      MaterialCardItem(
        title: 'Alamat IPv4 dan jaringan',
        content:
            'Contoh 192.168.1.10/24: /24 berarti tiga oktet pertama (192.168.1) adalah bagian jaringan, sisanya bagian host. Dua perangkat dengan bagian jaringan sama dapat berkomunikasi langsung tanpa router.',
      ),
      MaterialCardItem(
        title: 'Layanan pendukung',
        content:
            'Gateway: pintu keluar menuju jaringan lain. DNS: mengubah nama (google.com) menjadi alamat IP. DHCP: membagikan alamat IP otomatis.',
      ),
      MaterialCardItem(
        title: 'Strategi pemecahan masalah',
        content:
            'Uji berlapis dari bawah: kabel/Wi-Fi, alamat IP, gateway, lalu DNS. Perintah ping memeriksa konektivitas ke alamat tertentu.',
      ),
    ],
  };

  // ==========================================
  // Soal Misi per Level (Pool 12 Soal – ambil 6 acak)
  // ==========================================
  static Map<GameLevel, List<Question>> missionQuestions = {
    GameLevel.level1: [
      Question(
        id: 'l1_1',
        text:
            'Sepuluh komputer di lab memakai satu printer bersama. Apa manfaat jaringan yang terlihat di sini?',
        options: [
          'Berbagi sumber daya',
          'Menambah kecepatan prosesor',
          'Mengurangi ukuran layar',
          'Menghemat listrik komputer',
        ],
        correctIndex: 0,
        explanation:
            'Jaringan memungkinkan perangkat seperti printer dipakai bersama-sama oleh banyak komputer.',
      ),
      Question(
        id: 'l1_2',
        text: 'Perangkat yang menghubungkan banyak komputer dalam satu LAN adalah…',
        options: ['Router', 'Switch', 'Monitor', 'Speaker'],
        correctIndex: 1,
        explanation:
            'Switch adalah terminal pusat LAN. Router menghubungkan ke jaringan lain seperti internet.',
      ),
      Question(
        id: 'l1_3',
        text: 'Wi-Fi yang hanya dipakai di dalam satu rumah termasuk jenis jaringan…',
        options: ['WAN', 'LAN', 'Internet', 'Satelit'],
        correctIndex: 1,
        explanation:
            'Jangkauan satu rumah masuk kategori LAN (Local Area Network).',
      ),
      Question(
        id: 'l1_4',
        text: 'Topologi yang semua komputernya tersambung ke satu titik pusat disebut…',
        options: ['Star', 'Bus', 'Ring', 'Mesh'],
        correctIndex: 0,
        explanation:
            'Topologi star berpusat pada satu perangkat (biasanya switch), sehingga mudah ditambah dan dilacak masalahnya.',
      ),
      Question(
        id: 'l1_5',
        text: 'Fungsi utama router dalam jaringan rumah adalah…',
        options: [
          'Menghubungkan komputer dalam satu ruangan saja',
          'Menghubungkan LAN rumah ke jaringan internet',
          'Mencetak dokumen secara nirkabel',
          'Menyimpan file dari seluruh komputer',
        ],
        correctIndex: 1,
        explanation:
            'Router berperan sebagai gerbang (gateway) yang menghubungkan jaringan lokal rumah (LAN) ke internet (WAN).',
      ),
      Question(
        id: 'l1_6',
        text:
            'Contoh jaringan LAN adalah lab komputer sekolah, sedangkan contoh WAN adalah…',
        options: [
          'Dua komputer dalam satu meja',
          'Printer yang terhubung ke PC',
          'Internet yang menghubungkan antarnegara',
          'Flashdisk yang dibagikan',
        ],
        correctIndex: 2,
        explanation:
            'WAN (Wide Area Network) mencakup area sangat luas; internet adalah contoh WAN terbesar yang menghubungkan jutaan jaringan di seluruh dunia.',
      ),
      Question(
        id: 'l1_7',
        text: 'Keuntungan utama topologi star dibanding topologi bus adalah…',
        options: [
          'Lebih murah karena cukup satu kabel',
          'Mudah menambah perangkat baru dan mudah melacak kerusakan',
          'Data berputar sehingga tidak ada tabrakan',
          'Tidak memerlukan perangkat pusat',
        ],
        correctIndex: 1,
        explanation:
            'Pada star, setiap komputer punya jalur tersendiri ke switch, sehingga penambahan mudah dan kerusakan satu jalur tidak memengaruhi yang lain.',
      ),
      Question(
        id: 'l1_8',
        text: 'Selain berbagi printer, contoh lain sumber daya yang dapat dibagikan melalui jaringan adalah…',
        options: [
          'Layar monitor',
          'File dan koneksi internet',
          'Keyboard dan mouse',
          'Baterai laptop',
        ],
        correctIndex: 1,
        explanation:
            'Jaringan memungkinkan berbagi file, folder, printer, dan koneksi internet antar perangkat.',
      ),
      Question(
        id: 'l1_9',
        text: 'Kabel UTP digunakan untuk jaringan LAN karena…',
        options: [
          'Harganya sangat mahal dan kecepatan tinggi',
          'Harganya terjangkau dan mudah dipasang untuk jarak dekat',
          'Dapat mentransmisikan data menggunakan cahaya',
          'Tidak memerlukan konektor tambahan',
        ],
        correctIndex: 1,
        explanation:
            'Kabel UTP (Unshielded Twisted Pair) populer untuk LAN karena harganya murah, mudah dipasang, dan cukup andal untuk jarak pendek.',
      ),
      Question(
        id: 'l1_10',
        text: 'NIC (Network Interface Card) berfungsi untuk…',
        options: [
          'Menyimpan data secara permanen',
          'Menghubungkan komputer ke jaringan',
          'Menampilkan gambar di layar',
          'Memproses perintah pengguna',
        ],
        correctIndex: 1,
        explanation:
            'NIC adalah kartu jaringan yang memungkinkan komputer terhubung ke jaringan, baik melalui kabel maupun nirkabel (Wi-Fi).',
      ),
      Question(
        id: 'l1_11',
        text: 'Wi-Fi adalah teknologi jaringan yang bersifat…',
        options: [
          'Berkabel dengan konektor khusus',
          'Nirkabel (wireless) menggunakan gelombang radio',
          'Optik menggunakan cahaya laser',
          'Satelit menggunakan orbit bumi',
        ],
        correctIndex: 1,
        explanation:
            'Wi-Fi menggunakan gelombang radio (frekuensi 2,4 GHz atau 5 GHz) untuk menghubungkan perangkat tanpa kabel fisik.',
      ),
      Question(
        id: 'l1_12',
        text:
            'Di rumah, perangkat yang sekaligus berfungsi sebagai router dan access point Wi-Fi biasanya disebut…',
        options: ['Switch', 'Hub', 'Modem router (modem Wi-Fi)', 'Repeater'],
        correctIndex: 2,
        explanation:
            'Modem router (sering disebut modem Wi-Fi) menggabungkan fungsi modem (menghubungkan ke ISP), router (mengatur lalu lintas), dan access point (memancarkan Wi-Fi).',
      ),
    ],
    GameLevel.level2: [
      Question(
        id: 'l2_1',
        text:
            'Perusahaan menghubungkan kantor cabang di dua kota berbeda. Jenis jaringannya paling tepat…',
        options: ['PAN', 'LAN', 'WAN', 'Bluetooth'],
        correctIndex: 2,
        explanation:
            'Koneksi antarkota mencakup area sangat luas sehingga termasuk WAN (Wide Area Network).',
      ),
      Question(
        id: 'l2_2',
        text: 'Apa kelemahan utama topologi star?',
        options: [
          'Sulit menambah komputer',
          'Jika switch pusat rusak seluruh jaringan terganggu',
          'Tidak bisa memakai kabel UTP',
          'Data hanya bisa satu arah',
        ],
        correctIndex: 1,
        explanation:
            'Switch pusat menjadi titik tunggal kegagalan (single point of failure); jika rusak, semua komputer kehilangan koneksi.',
      ),
      Question(
        id: 'l2_3',
        text:
            'Untuk jarak jauh dan kebal gangguan elektromagnetik, media transmisi terbaik adalah…',
        options: ['Kabel UTP', 'Fiber optik', 'Kabel listrik', 'Infrared'],
        correctIndex: 1,
        explanation:
            'Fiber optik mengirim data menggunakan cahaya sehingga tidak terpengaruh gangguan elektromagnetik dan mampu menjangkau jarak sangat jauh.',
      ),
      Question(
        id: 'l2_4',
        text: 'Keunggulan topologi mesh adalah…',
        options: [
          'Biaya termurah',
          'Banyak jalur alternatif sehingga lebih andal',
          'Hanya butuh satu kabel',
          'Tidak perlu alamat IP',
        ],
        correctIndex: 1,
        explanation:
            'Topologi mesh menyediakan banyak jalur alternatif; jika satu jalur putus, data masih bisa melewati jalur lain sehingga jaringan tetap aktif.',
      ),
      Question(
        id: 'l2_5',
        text: 'Kelemahan utama topologi bus adalah…',
        options: [
          'Membutuhkan banyak switch',
          'Jika kabel utama (backbone) putus, seluruh jaringan mati',
          'Data berputar satu arah saja',
          'Sulit menambah komputer baru',
        ],
        correctIndex: 1,
        explanation:
            'Pada topologi bus, semua perangkat berbagi satu kabel utama; jika kabel tersebut putus, tidak ada data yang bisa mengalir.',
      ),
      Question(
        id: 'l2_6',
        text: 'Pada topologi ring, bagaimana alur data bergerak?',
        options: [
          'Langsung dari pengirim ke penerima',
          'Berputar satu arah melewati setiap node hingga sampai tujuan',
          'Disiarkan ke semua node sekaligus',
          'Melewati beberapa jalur sekaligus',
        ],
        correctIndex: 1,
        explanation:
            'Topologi ring: data berputar searah (seperti lingkaran) melewati setiap node sampai mencapai tujuan.',
      ),
      Question(
        id: 'l2_7',
        text:
            'Dibanding kabel UTP, kabel fiber optik memiliki kecepatan transmisi yang…',
        options: [
          'Lebih lambat karena menggunakan cahaya',
          'Sama saja, hanya warnanya berbeda',
          'Jauh lebih cepat dan jangkauan lebih jauh',
          'Lebih lambat namun lebih murah',
        ],
        correctIndex: 2,
        explanation:
            'Fiber optik dapat mencapai kecepatan hingga ratusan Gbps dengan jangkauan puluhan kilometer, jauh melampaui kabel UTP.',
      ),
      Question(
        id: 'l2_8',
        text: 'Perbedaan antara hub dan switch yang paling tepat adalah…',
        options: [
          'Hub lebih cerdas karena menyimpan tabel MAC address',
          'Switch mengirim data ke semua port; hub hanya ke tujuan',
          'Hub meneruskan data ke semua port; switch hanya ke port tujuan',
          'Hub dan switch bekerja persis sama',
        ],
        correctIndex: 2,
        explanation:
            'Hub adalah repeater sederhana yang menyiarkan data ke semua port, sedangkan switch mempelajari alamat MAC dan mengirim data hanya ke port tujuan.',
      ),
      Question(
        id: 'l2_9',
        text: 'Keunggulan topologi mesh dibandingkan topologi bus dan star adalah…',
        options: [
          'Paling murah dan mudah dipasang',
          'Paling andal karena ada banyak jalur cadangan',
          'Hanya butuh satu kabel untuk semua perangkat',
          'Tidak memerlukan router',
        ],
        correctIndex: 1,
        explanation:
            'Mesh menyediakan redundansi jalur; keandalan jaringan sangat tinggi meski biayanya juga paling mahal.',
      ),
      Question(
        id: 'l2_10',
        text: 'Jaringan MAN (Metropolitan Area Network) biasanya mencakup…',
        options: [
          'Satu ruangan kantor',
          'Satu gedung sekolah',
          'Satu kota atau beberapa wilayah kota',
          'Seluruh negara',
        ],
        correctIndex: 2,
        explanation:
            'MAN menghubungkan beberapa LAN dalam satu kota, misalnya jaringan antar-kampus atau antar-kantor di kota yang sama.',
      ),
      Question(
        id: 'l2_11',
        text: 'Contoh media transmisi nirkabel yang umum digunakan di sekolah adalah…',
        options: [
          'Kabel UTP Cat6',
          'Fiber optik single-mode',
          'Wi-Fi (gelombang radio)',
          'Kabel coaxial',
        ],
        correctIndex: 2,
        explanation:
            'Wi-Fi menggunakan gelombang radio sebagai media transmisi nirkabel; mudah dipasang dan mendukung mobilitas pengguna.',
      ),
      Question(
        id: 'l2_12',
        text: 'Topologi yang paling mahal dalam implementasi adalah…',
        options: ['Bus', 'Star', 'Ring', 'Mesh'],
        correctIndex: 3,
        explanation:
            'Topologi mesh membutuhkan koneksi langsung antara setiap perangkat, sehingga jumlah kabel dan port yang dibutuhkan sangat banyak dan biayanya paling tinggi.',
      ),
    ],
    GameLevel.level3: [
      Question(
        id: 'l3_1',
        text:
            'Komputer A berIP 192.168.1.10/24. Perangkat mana yang berada di jaringan yang sama?',
        options: [
          '192.168.2.10',
          '10.0.0.10',
          '192.168.1.200',
          '172.16.1.10',
        ],
        correctIndex: 2,
        explanation:
            'Subnet /24 berarti tiga oktet pertama (192.168.1) adalah bagian jaringan. Hanya 192.168.1.200 yang memiliki tiga oktet pertama sama.',
      ),
      Question(
        id: 'l3_2',
        text:
            'Komputer dapat ping 8.8.8.8 tetapi tidak bisa membuka google.com. Penyebab paling mungkin…',
        options: ['Kabel putus', 'Gateway salah', 'Masalah DNS', 'Switch mati'],
        correctIndex: 2,
        explanation:
            'Koneksi IP berhasil (ping angka OK), tetapi nama domain tidak dapat diterjemahkan ke IP. Ini adalah tugas DNS, sehingga masalahnya ada pada DNS.',
      ),
      Question(
        id: 'l3_3',
        text:
            'Laptop baru yang tersambung Wi-Fi langsung mendapat IP tanpa diatur manual. Layanan yang bekerja…',
        options: ['DNS', 'DHCP', 'FTP', 'HTTP'],
        correctIndex: 1,
        explanation:
            'DHCP (Dynamic Host Configuration Protocol) secara otomatis membagikan alamat IP, subnet mask, gateway, dan DNS kepada perangkat yang terhubung.',
      ),
      Question(
        id: 'l3_4',
        text: 'Fungsi default gateway pada sebuah komputer adalah…',
        options: [
          'Menyimpan halaman web',
          'Menjadi pintu keluar ke jaringan lain',
          'Menerjemahkan nama domain',
          'Memberi daya ke switch',
        ],
        correctIndex: 1,
        explanation:
            'Default gateway (biasanya alamat router) adalah pintu keluar; semua paket menuju jaringan lain dikirim ke gateway terlebih dahulu.',
      ),
      Question(
        id: 'l3_5',
        text: 'Subnet mask /24 berarti…',
        options: [
          'Hanya 24 perangkat yang boleh terhubung',
          '24 bit pertama adalah bagian jaringan, sisanya bagian host',
          'Jaringan dapat menjangkau 24 kilometer',
          'Kecepatan jaringan 24 Mbps',
        ],
        correctIndex: 1,
        explanation:
            '/24 berarti 24 bit pertama dari alamat IP digunakan sebagai Network ID. Dalam notasi desimal: 255.255.255.0, menyisakan 8 bit untuk host (256 − 2 = 254 host valid).',
      ),
      Question(
        id: 'l3_6',
        text:
            'Dua komputer dengan IP 192.168.1.5 dan 192.168.2.5 (keduanya /24) ingin berkomunikasi. Yang dibutuhkan adalah…',
        options: [
          'Cukup switch karena sama-sama pakai IP 192.168',
          'Router karena keduanya berada di subnet berbeda',
          'Hub karena lebih cepat',
          'Tidak bisa berkomunikasi sama sekali',
        ],
        correctIndex: 1,
        explanation:
            'Subnet /24 membuat 192.168.1.x dan 192.168.2.x menjadi dua jaringan berbeda. Komunikasi antar-jaringan berbeda membutuhkan router.',
      ),
      Question(
        id: 'l3_7',
        text: 'Perintah `ipconfig` (Windows) digunakan untuk…',
        options: [
          'Mengirim paket ke alamat tujuan',
          'Menampilkan konfigurasi IP perangkat saat ini',
          'Memperbaiki koneksi jaringan secara otomatis',
          'Mengganti nama domain',
        ],
        correctIndex: 1,
        explanation:
            'Perintah ipconfig menampilkan alamat IP, subnet mask, dan default gateway dari antarmuka jaringan komputer.',
      ),
      Question(
        id: 'l3_8',
        text: 'NAT (Network Address Translation) berfungsi untuk…',
        options: [
          'Menerjemahkan nama domain ke alamat IP',
          'Mengubah alamat IP privat menjadi IP publik agar bisa mengakses internet',
          'Membagi jaringan menjadi beberapa subnet',
          'Mengamankan data dengan enkripsi',
        ],
        correctIndex: 1,
        explanation:
            'NAT memungkinkan banyak perangkat dengan IP privat (seperti 192.168.x.x) berbagi satu IP publik saat mengakses internet.',
      ),
      Question(
        id: 'l3_9',
        text:
            'Urutan troubleshooting jaringan yang benar dari lapisan terbawah adalah…',
        options: [
          'DNS → Gateway → IP → Kabel',
          'Kabel → Alamat IP → Gateway → DNS',
          'Gateway → DNS → Kabel → IP',
          'IP → DNS → Kabel → Gateway',
        ],
        correctIndex: 1,
        explanation:
            'Troubleshooting dilakukan berlapis dari bawah: cek fisik (kabel/Wi-Fi) → alamat IP → gateway → DNS. Jika lapisan bawah bermasalah, lapisan atas pasti ikut terdampak.',
      ),
      Question(
        id: 'l3_10',
        text: 'Perbedaan antara IPv4 dan IPv6 yang paling mendasar adalah…',
        options: [
          'IPv4 menggunakan 128 bit; IPv6 menggunakan 32 bit',
          'IPv4 menggunakan 32 bit; IPv6 menggunakan 128 bit',
          'IPv4 dan IPv6 menggunakan panjang bit yang sama',
          'IPv6 hanya dipakai untuk jaringan lokal',
        ],
        correctIndex: 1,
        explanation:
            'IPv4 menggunakan 32 bit (sekitar 4,3 miliar alamat), sedangkan IPv6 menggunakan 128 bit (menyediakan ruang alamat yang jauh lebih besar).',
      ),
      Question(
        id: 'l3_11',
        text: 'Port 80 secara default digunakan oleh protokol…',
        options: ['FTP', 'SSH', 'HTTP', 'SMTP'],
        correctIndex: 2,
        explanation:
            'Port 80 adalah port standar untuk protokol HTTP yang digunakan oleh web server untuk melayani permintaan halaman web.',
      ),
      Question(
        id: 'l3_12',
        text:
            'Langkah pertama yang paling tepat saat komputer tiba-tiba tidak bisa terhubung ke jaringan adalah…',
        options: [
          'Langsung ganti router',
          'Periksa fisik kabel atau koneksi Wi-Fi terlebih dahulu',
          'Hubungi teknisi ISP segera',
          'Format ulang komputer',
        ],
        correctIndex: 1,
        explanation:
            'Troubleshooting dimulai dari lapisan terbawah. Memeriksa kabel atau sinyal Wi-Fi adalah langkah paling cepat dan mudah sebelum mengecek konfigurasi software.',
      ),
    ],
  };

  // ==========================================
  // Boss Level (Pool 9 Soal – ambil 3 acak)
  // ==========================================
  static const String bossTitle = 'Bangun Jaringan Sekolah';
  static const String bossIntro = 'Rancang jaringan lab komputer sekolah dari nol.';

  static List<Question> bossQuestions = [
    Question(
      id: 'boss_1',
      text:
          'Sekolah ingin menghubungkan 30 komputer lab: mudah ditambah dan mudah dilacak kerusakannya. Rancangan terbaik…',
      options: [
        'Topologi bus tanpa switch',
        'Topologi star dengan switch',
        'Satu kabel antar-komputer berantai',
        'Tanpa jaringan',
      ],
      correctIndex: 1,
      explanation:
          'Topologi star memudahkan penambahan perangkat dan pelacakan kerusakan karena setiap komputer punya jalur tersendiri ke switch.',
    ),
    Question(
      id: 'boss_2',
      text: 'Perangkat yang menghubungkan LAN sekolah ke internet adalah…',
      options: ['Switch', 'Router', 'Hub USB', 'Proyektor'],
      correctIndex: 1,
      explanation:
          'Router berfungsi sebagai gerbang yang menghubungkan dua jaringan berbeda, dalam hal ini LAN sekolah dan internet (WAN).',
    ),
    Question(
      id: 'boss_3',
      text: 'Mengapa setiap komputer harus punya alamat IP yang unik?',
      options: [
        'Agar layar lebih terang',
        'Agar data sampai ke tujuan yang tepat tanpa bentrok',
        'Agar kabel lebih pendek',
        'Agar komputer lebih murah',
      ],
      correctIndex: 1,
      explanation:
          'Dua perangkat dengan IP sama menyebabkan konflik (IP conflict) sehingga pengiriman data menjadi kacau.',
    ),
    Question(
      id: 'boss_4',
      text:
          'Lab komputer sekolah terdiri dari 3 lantai. Media transmisi yang paling tepat untuk menghubungkan antar lantai adalah…',
      options: [
        'Kabel UTP Cat5 karena murah',
        'Fiber optik karena cepat dan tahan gangguan',
        'Bluetooth karena nirkabel',
        'Kabel listrik biasa',
      ],
      correctIndex: 1,
      explanation:
          'Untuk koneksi antar-lantai atau antar-gedung, fiber optik adalah pilihan terbaik karena kecepatannya tinggi, jarak jangkauan jauh, dan kebal gangguan elektromagnetik.',
    ),
    Question(
      id: 'boss_5',
      text:
          'Seorang admin akan mengatur IP address untuk 30 komputer lab. Rentang alamat IP privat yang sesuai adalah…',
      options: [
        '8.8.8.1 – 8.8.8.30',
        '192.168.1.1 – 192.168.1.30',
        '100.0.0.1 – 100.0.0.30',
        '0.0.0.1 – 0.0.0.30',
      ],
      correctIndex: 1,
      explanation:
          'Rentang 192.168.x.x adalah IP privat kelas C yang umum digunakan untuk LAN. IP privat tidak dapat diakses langsung dari internet sehingga aman untuk jaringan internal.',
    ),
    Question(
      id: 'boss_6',
      text:
          'Semua komputer di lab mendapat IP, tetapi tidak ada yang bisa membuka website. Penyebab yang paling mungkin adalah…',
      options: [
        'Switch rusak',
        'Kabel antar komputer putus',
        'Router tidak terhubung ke internet atau DNS bermasalah',
        'IP address terlalu panjang',
      ],
      correctIndex: 2,
      explanation:
          'Jika IP sudah ada tetapi internet tidak bisa diakses, kemungkinan besar gateway (router) tidak terhubung ke ISP atau server DNS tidak merespons.',
    ),
    Question(
      id: 'boss_7',
      text:
          'Agar setiap laptop yang baru terhubung ke Wi-Fi sekolah langsung mendapat IP secara otomatis, layanan apa yang harus diaktifkan?',
      options: ['DNS Server', 'FTP Server', 'DHCP Server', 'HTTP Server'],
      correctIndex: 2,
      explanation:
          'DHCP Server secara otomatis mengalokasikan IP address, subnet mask, gateway, dan DNS ke perangkat yang baru terhubung ke jaringan.',
    ),
    Question(
      id: 'boss_8',
      text:
          'Sekolah ingin jaringannya tetap berjalan meski salah satu kabel putus (redundancy). Topologi yang paling tepat adalah…',
      options: [
        'Bus, karena satu kabel untuk semua',
        'Ring, karena data berputar',
        'Mesh, karena ada banyak jalur alternatif',
        'Star, karena berpusat pada switch',
      ],
      correctIndex: 2,
      explanation:
          'Topologi mesh menyediakan banyak jalur alternatif antar-node. Jika satu jalur putus, data masih bisa melewati jalur lain sehingga jaringan tetap berjalan (redundancy).',
    ),
    Question(
      id: 'boss_9',
      text:
          'Di lab, kapan dibutuhkan router dibandingkan cukup menggunakan switch?',
      options: [
        'Saat menghubungkan 30 komputer dalam satu subnet yang sama',
        'Saat ingin menghubungkan LAN lab ke jaringan internet atau ke subnet lain',
        'Saat ingin menambah port untuk lebih banyak komputer',
        'Saat ingin mencetak dokumen dari banyak komputer',
      ],
      correctIndex: 1,
      explanation:
          'Switch menghubungkan perangkat dalam satu jaringan (subnet) yang sama. Router diperlukan untuk menghubungkan dua jaringan berbeda, misalnya LAN ke internet atau antar-subnet.',
    ),
  ];

  // ==========================================
  // Pertanyaan Refleksi Siswa (3 Pertanyaan)
  // ==========================================
  static const List<String> reflectionPrompts = [
    'Bagian materi mana yang paling membantu?',
    'Apakah levelmu terasa pas, terlalu mudah, atau terlalu sulit?',
    'Level berapa yang ingin kamu coba berikutnya?',
  ];
}
