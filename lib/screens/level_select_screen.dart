import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/level.dart';
import '../state/game_controller.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/level_card.dart';
import 'material_screen.dart';

class LevelSelectScreen extends StatelessWidget {
  const LevelSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<GameController>();
    final recommended = controller.recommendedLevel;

    return AppScaffold(
      topBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(width: 8),
            Text(
              'Pilih Level Belajar',
              style: GoogleFonts.nunito(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Sesuaikan tingkat tantangan dengan pemahamanmu saat ini. Kamu dapat berpindah level kapan saja!',
            style: GoogleFonts.nunito(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white.withValues(alpha: 0.9),
            ),
          ),
          const SizedBox(height: 16),
          ...GameLevel.values.map((lvl) {
            final bool isCurrent = controller.currentLevel == lvl;
            final bool isRec = recommended == lvl;

            return Padding(
              padding: const EdgeInsets.only(bottom: 14.0),
              child: LevelCard(
                level: lvl,
                isSelected: isCurrent,
                isRecommended: isRec,
                onTap: () {
                  controller.selectLevel(lvl);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const MaterialScreen()),
                  );
                },
              ),
            );
          }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
