import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/game_mode.dart';
import '../models/level.dart';
import '../state/game_controller.dart';
import '../theme/app_theme.dart';

class HudBar extends StatelessWidget {
  final GameMode mode;
  final GameLevel level;
  final int lives;
  final int score;
  final int streak;
  final VoidCallback? onLevelSwitch;

  const HudBar({
    super.key,
    required this.mode,
    required this.level,
    required this.lives,
    required this.score,
    required this.streak,
    this.onLevelSwitch,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<GameController>();

    String modeLabel;
    if (mode == GameMode.mission) {
      modeLabel = '${level.emoji} ${level.title}';
    } else {
      modeLabel = mode.title;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Kiri: Chip Mode / Level & Tombol Pindah Level
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.35),
                      width: 1.5,
                    ),
                  ),
                  child: Text(
                    modeLabel,
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 13,
                    ),
                  ),
                ),
                if (onLevelSwitch != null) ...[
                  const SizedBox(width: 6),
                  IconButton(
                    onPressed: onLevelSwitch,
                    tooltip: 'Pindah level',
                    icon: const Icon(Icons.swap_horiz, color: Colors.white, size: 20),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white.withValues(alpha: 0.15),
                      minimumSize: const Size(34, 34),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ],
            ),

            const SizedBox(width: 8),

            // Kanan: Streak, Poin, Nyawa, & Tombol Audio
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Badge Streak jika >= 3
                if (mode.usesScore && streak >= 3) ...[
                  Container(
                    margin: const EdgeInsets.only(right: 6),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF5722),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orange.withValues(alpha: 0.4),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('🔥', style: TextStyle(fontSize: 12)),
                        const SizedBox(width: 3),
                        Text(
                          '$streak!',
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],

                // Poin (Bintang)
                if (mode.usesScore) ...[
                  Semantics(
                    label: 'Total poin: $score',
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.hudStar.withValues(alpha: 0.6),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: AppColors.hudStar,
                            size: 18,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            '$score',
                            style: GoogleFonts.nunito(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                ],

                // Nyawa (Hati)
                if (mode.usesLives) ...[
                  Semantics(
                    label: 'Sisa nyawa: $lives dari 3',
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.hudHeart.withValues(alpha: 0.6),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(3, (i) {
                          final bool hasLife = i < lives;
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1.5),
                            child: Icon(
                              hasLife ? Icons.favorite : Icons.favorite_border,
                              color: hasLife
                                  ? AppColors.hudHeart
                                  : Colors.white.withValues(alpha: 0.4),
                              size: 16,
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                ],

                // Tombol Audio Mute/Unmute
                IconButton(
                  onPressed: () => controller.toggleAudioMute(),
                  tooltip: controller.isAudioMuted ? 'Nyalakan audio' : 'Bisukan audio',
                  icon: Icon(
                    controller.isAudioMuted ? Icons.volume_off_rounded : Icons.volume_up_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white.withValues(alpha: 0.15),
                    minimumSize: const Size(34, 34),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
