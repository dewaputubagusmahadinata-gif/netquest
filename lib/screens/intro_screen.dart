import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../services/audio_service.dart';
import '../services/storage_service.dart';
import '../state/game_controller.dart';
import '../theme/app_theme.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/custom_button.dart';
import '../widgets/game_card.dart';
import 'level_select_screen.dart';
import 'quiz_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      topBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Consumer<GameController>(
            builder: (context, controller, _) {
              return IconButton(
                onPressed: () {
                  controller.toggleAudioMute();
                  if (!controller.isAudioMuted) {
                    AudioService.instance.playBgm();
                  }
                },
                tooltip: controller.isAudioMuted ? 'Nyalakan audio' : 'Bisukan audio',
                icon: Icon(
                  controller.isAudioMuted ? Icons.volume_off_rounded : Icons.volume_up_rounded,
                  color: Colors.white,
                  size: 22,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white.withValues(alpha: 0.18),
                  minimumSize: const Size(40, 40),
                ),
              );
            },
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 12),
          // Logo & Judul
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('🌐', style: TextStyle(fontSize: 22)),
                  const SizedBox(width: 8),
                  Text(
                    'INFORMATIKA KELAS X',
                    style: GoogleFonts.nunito(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: AppColors.hudStar,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'NetQuest',
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: -0.5,
              shadows: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  offset: const Offset(0, 3),
                  blurRadius: 8,
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Misi Jaringan Komputer',
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: const Color(0xFFFFD166),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Pelajari konsep jaringan komputer melalui petualangan bertahap sesuai kesiapan belajarmu!',
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white.withValues(alpha: 0.92),
            ),
          ),
          const SizedBox(height: 24),

          // Kartu Cara Bermain
          GameCard(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.sports_esports_rounded,
                        color: AppColors.gradientStart, size: 28),
                    const SizedBox(width: 10),
                    Text(
                      'Cara Bermain',
                      style: GoogleFonts.nunito(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF1F1F24),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                _buildRuleItem(
                  icon: '1️⃣',
                  title: 'Cek Kesiapan',
                  desc: 'Jawab 5 pertanyaan kilat tanpa nyawa untuk mencari level belajar yang paling pas untukmu.',
                ),
                const SizedBox(height: 10),
                _buildRuleItem(
                  icon: '2️⃣',
                  title: 'Pelajari Materi & Mulai Misi',
                  desc: 'Baca kartu materi ringkas, lalu taklukkan 4 soal misi. Raih poin dan kumpulkan bonus streak!',
                ),
                const SizedBox(height: 10),
                _buildRuleItem(
                  icon: '3️⃣',
                  title: 'Tantang Boss yang Sama',
                  desc: 'Semua level bermuara ke tantangan Boss: rancang jaringan lab sekolah dan raih gelarmu.',
                ),
                const SizedBox(height: 10),
                _buildRuleItem(
                  icon: '🔄',
                  title: 'Bebas Pindah Level',
                  desc: 'Level bersifat fleksibel: kamu bisa beralih level kapan saja sesuai kebutuhan belajarmu.',
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // Tombol Aksi
          CustomButton(
            text: 'Mulai Cek Kesiapan',
            icon: const Icon(Icons.play_arrow_rounded, color: AppColors.primaryButtonText, size: 24),
            height: 56,
            onPressed: () {
              AudioService.instance.playBgm();
              final controller = context.read<GameController>();
              controller.startReadiness();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const QuizScreen()),
              );
            },
          ),
          const SizedBox(height: 14),
          CustomButton(
            text: 'Pilih Level Sendiri',
            type: CustomButtonType.secondary,
            icon: const Icon(Icons.tune_rounded, color: AppColors.secondaryButtonText, size: 20),
            height: 52,
            onPressed: () {
              AudioService.instance.playBgm();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LevelSelectScreen()),
              );
            },
          ),
          const SizedBox(height: 8),
          Builder(builder: (context) {
            final hs = StorageService.instance.getHighscore();
            final sessions = StorageService.instance.getTotalSessions();
            if (hs == 0) return const SizedBox.shrink();
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '🏆 Highscore: $hs poin  |  🎮 ${sessions}x main',
                  style: GoogleFonts.nunito(
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildRuleItem({
    required String icon,
    required String title,
    required String desc,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(icon, style: const TextStyle(fontSize: 18)),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.nunito(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF2C2C34),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                desc,
                style: GoogleFonts.nunito(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF555566),
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
