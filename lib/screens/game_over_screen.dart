import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/level.dart';
import '../state/game_controller.dart';
import '../theme/app_theme.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/custom_button.dart';
import '../widgets/game_card.dart';
import 'material_screen.dart';
import 'quiz_screen.dart';

class GameOverScreen extends StatelessWidget {
  const GameOverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<GameController>();
    final GameLevel currentLevel = controller.currentLevel;
    final bool canDowngrade = currentLevel.id > 1;
    final GameLevel? prevLevel =
        canDowngrade ? GameLevel.fromId(currentLevel.id - 1) : null;

    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          GameCard(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
            child: Column(
              children: [
                // Icon Hati Retak
                Container(
                  width: 80,
                  height: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFEBEE),
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFEF5350), width: 3),
                  ),
                  child: const Text('💔', style: TextStyle(fontSize: 40)),
                ),
                const SizedBox(height: 18),
                Text(
                  'Nyawa Habis!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFFC62828),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Jangan patah semangat! Kesalahan adalah bagian alami dari belajar. Kamu bisa membaca materi kembali, mengulang misi, atau berpindah level.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF4A4A58),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: currentLevel.accentColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'Level saat ini: ${currentLevel.emoji} ${currentLevel.name}',
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: currentLevel.color,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),

          // Tombol Coba Misi Lagi
          CustomButton(
            text: 'Coba Misi Lagi',
            icon: const Icon(Icons.refresh_rounded, color: AppColors.primaryButtonText, size: 22),
            height: 56,
            onPressed: () {
              controller.retryCurrentMission();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const QuizScreen()),
              );
            },
          ),
          const SizedBox(height: 12),

          // Tombol Baca Materi Lagi
          CustomButton(
            text: 'Baca Materi Lagi',
            type: CustomButtonType.secondary,
            icon: const Icon(Icons.menu_book_rounded, color: AppColors.secondaryButtonText, size: 20),
            height: 52,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const MaterialScreen()),
              );
            },
          ),

          // Tombol Turun ke Level N-1 (Jika Level > 1)
          if (canDowngrade && prevLevel != null) ...[
            const SizedBox(height: 12),
            CustomButton(
              text: 'Turun ke Level ${prevLevel.id} (${prevLevel.title} ${prevLevel.emoji})',
              type: CustomButtonType.secondary,
              icon: const Icon(Icons.arrow_downward_rounded, color: AppColors.secondaryButtonText, size: 20),
              height: 52,
              onPressed: () {
                controller.downgradeLevel();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const MaterialScreen()),
                );
              },
            ),
          ],
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
