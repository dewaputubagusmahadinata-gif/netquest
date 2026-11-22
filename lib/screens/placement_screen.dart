import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/level.dart';
import '../state/game_controller.dart';
import '../theme/app_theme.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/custom_button.dart';
import '../widgets/game_card.dart';
import 'level_select_screen.dart';
import 'material_screen.dart';

class PlacementScreen extends StatelessWidget {
  const PlacementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<GameController>();
    final int score = controller.readinessScore;
    final GameLevel recLevel = controller.recommendedLevel ?? GameLevel.fromReadinessScore(score);

    String motivationText;
    if (score <= 2) {
      motivationText =
          'Awal yang baik! Mari perkuat pondasi dasar jaringan komputer dengan analogi yang menyenangkan.';
    } else if (score <= 4) {
      motivationText =
          'Hebat! Kamu sudah memahami konsep dasar. Sekarang saatnya menjelajahi topologi dan jangkauan jaringan lebih dalam.';
    } else {
      motivationText =
          'Luar biasa! Pemahamanmu sangat tajam. Siap menaklukkan tantangan subnetting dan pemecahan masalah jaringan?';
    }

    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          // Heading Hasil
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'HASIL CEK KESIAPAN',
                style: GoogleFonts.nunito(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: AppColors.hudStar,
                  letterSpacing: 1.1,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Kartu Skor & Rekomendasi
          GameCard(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                // Lingkaran Skor
                Container(
                  width: 90,
                  height: 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3E8FF),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.gradientStart,
                      width: 3,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$score',
                        style: GoogleFonts.nunito(
                          fontSize: 34,
                          fontWeight: FontWeight.w900,
                          color: AppColors.gradientStart,
                          height: 1.0,
                        ),
                      ),
                      Text(
                        'dari 5',
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF6B6880),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Rekomendasi Level Belajarmu:',
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF6B6880),
                  ),
                ),
                const SizedBox(height: 8),

                // Chip Level Rekomendasi
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    decoration: BoxDecoration(
                      color: recLevel.accentColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: recLevel.color, width: 2),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(recLevel.emoji, style: const TextStyle(fontSize: 26)),
                        const SizedBox(width: 10),
                        Text(
                          recLevel.name,
                          style: GoogleFonts.nunito(
                            fontSize: 19,
                            fontWeight: FontWeight.w900,
                            color: recLevel.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                Text(
                  motivationText,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF444455),
                    height: 1.35,
                  ),
                ),

                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FA),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline, color: AppColors.gradientStart, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Level ini bersifat sementara. Kamu bebas berpindah level kapan pun.',
                          style: GoogleFonts.nunito(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF555566),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // Tombol Mulai Level Rekomendasi
          CustomButton(
            text: 'Mulai ${recLevel.title} (${recLevel.emoji})',
            icon: const Icon(Icons.arrow_forward_rounded, color: AppColors.primaryButtonText),
            height: 56,
            onPressed: () {
              controller.selectLevel(recLevel);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const MaterialScreen()),
              );
            },
          ),
          const SizedBox(height: 14),

          // Tombol Pilih Level Lain
          CustomButton(
            text: 'Pilih Level Lain',
            type: CustomButtonType.secondary,
            icon: const Icon(Icons.tune_rounded, color: AppColors.secondaryButtonText),
            height: 52,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LevelSelectScreen()),
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
