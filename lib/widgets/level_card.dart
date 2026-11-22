import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/level.dart';
import 'game_card.dart';

class LevelCard extends StatelessWidget {
  final GameLevel level;
  final bool isSelected;
  final bool isRecommended;
  final VoidCallback onTap;

  const LevelCard({
    super.key,
    required this.level,
    this.isSelected = false,
    this.isRecommended = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: '${level.name}. ${level.description}${isRecommended ? ", Rekomendasi Hasil Cek Kesiapan" : ""}',
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: GameCard(
          bottomBorderColor: isSelected
              ? level.color
              : const Color(0xFFD9D1EE),
          bottomBorderSize: isSelected ? 6.0 : 4.0,
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Emoji Box
                  Container(
                    width: 48,
                    height: 48,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: level.accentColor,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: level.color.withValues(alpha: 0.3), width: 1.5),
                    ),
                    child: Text(
                      level.emoji,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                  const SizedBox(width: 14),
                  // Judul & Badge
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                level.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.nunito(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: const Color(0xFF1F1F24),
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (isRecommended) ...[
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFC93C),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '⭐ Direkomendasikan',
                              style: GoogleFonts.nunito(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xFF2B1B00),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey.shade400,
                    size: 18,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                level.description,
                style: GoogleFonts.nunito(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF555566),
                  height: 1.35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
