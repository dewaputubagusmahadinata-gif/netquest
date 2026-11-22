import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../data/game_content.dart';
import '../state/game_controller.dart';
import '../theme/app_theme.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/custom_button.dart';
import '../widgets/game_card.dart';
import 'quiz_screen.dart';

class BossIntroScreen extends StatelessWidget {
  const BossIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<GameController>();

    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.redAccent.withValues(alpha: 0.5), width: 1.5),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('👑', style: TextStyle(fontSize: 20)),
                  const SizedBox(width: 8),
                  Text(
                    'TANTANGAN AKHIR BERSAMA',
                    style: GoogleFonts.nunito(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: 1.1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          GameCard(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                // Boss Badge Icon
                Container(
                  width: 80,
                  height: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF8E1),
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFFFC107), width: 3),
                  ),
                  child: const Text('🏫', style: TextStyle(fontSize: 42)),
                ),
                const SizedBox(height: 16),
                Text(
                  GameContent.bossTitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF1F1F24),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  GameContent.bossIntro,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.gradientStart,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Selamat! Kamu telah menyelesaikan 4 misi level. Sekarang satukan seluruh pemahamanmu untuk memecahkan 3 soal skenario perancangan jaringan sekolah.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF4A4A58),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 20),
                // Kartu Skor Sementara
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEDE7F6),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.star_rounded, color: AppColors.primaryButtonShadow, size: 28),
                      const SizedBox(width: 8),
                      Text(
                        'Total Poin Saat Ini: ${controller.score}',
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: AppColors.gradientEnd,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          CustomButton(
            text: 'Mulai Hadapi Boss!',
            icon: const Icon(Icons.flash_on_rounded, color: AppColors.primaryButtonText, size: 24),
            height: 56,
            onPressed: () {
              controller.startBoss();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const QuizScreen()),
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
