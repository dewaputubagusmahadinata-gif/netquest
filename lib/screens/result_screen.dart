import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../data/game_content.dart';
import '../state/game_controller.dart';
import '../theme/app_theme.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/custom_button.dart';
import '../widgets/game_card.dart';
import 'intro_screen.dart';
import 'level_select_screen.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  // Simpan input refleksi siswa agar interaktif
  final Map<int, String> _reflections = {};
  final Map<int, TextEditingController> _controllers = {};

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < GameContent.reflectionPrompts.length; i++) {
      _controllers[i] = TextEditingController();
    }
  }

  @override
  void dispose() {
    for (var c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<GameController>();
    final int bossCorrect = controller.bossCorrectCount;
    final int totalScore = controller.score;
    final String title = controller.finalTitle;

    String badgeEmoji;
    Color badgeColor;
    String badgeDesc;

    if (bossCorrect >= 3) {
      badgeEmoji = '🏆';
      badgeColor = const Color(0xFFFFD166);
      badgeDesc =
          'Sempurna! Kamu memahami arsitektur jaringan secara menyeluruh dari konsep dasar hingga pemecahan masalah.';
    } else if (bossCorrect == 2) {
      badgeEmoji = '🛠️';
      badgeColor = const Color(0xFF64B5F6);
      badgeDesc =
          'Hebat! Pemahaman teknismu sudah sangat solid dalam mengonfigurasi dan memahami alur data jaringan.';
    } else {
      badgeEmoji = '🌱';
      badgeColor = const Color(0xFF81C784);
      badgeDesc =
          'Langkah awal yang baik! Terus eksplorasi level lain untuk memperkaya wawasan jaringan komputermu.';
    }

    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 12),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'HASIL AKHIR PEMBELAJARAN',
                style: GoogleFonts.nunito(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: AppColors.hudStar,
                  letterSpacing: 1.1,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Kartu Gelar & Skor
          GameCard(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                Container(
                  width: 84,
                  height: 84,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: badgeColor.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                    border: Border.all(color: badgeColor, width: 3),
                  ),
                  child: Text(
                    badgeEmoji,
                    style: const TextStyle(fontSize: 42),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Gelar Akhir:',
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF6B6880),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: GoogleFonts.nunito(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF1F1F24),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  badgeDesc,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF555566),
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 18),

                // Bar Skor Boss & Total Poin
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3E8FF),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: AppColors.gradientStart.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Skor Boss',
                              style: GoogleFonts.nunito(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF6B6880),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '$bossCorrect / 3',
                              style: GoogleFonts.nunito(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: AppColors.gradientStart,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF9E6),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: AppColors.hudStar.withValues(alpha: 0.6),
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Total Poin Game',
                              style: GoogleFonts.nunito(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF6B6880),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '$totalScore',
                              style: GoogleFonts.nunito(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: const Color(0xFFB57D00),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Kartu Refleksi Belajar (3 Pertanyaan Wajib)
          GameCard(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.psychology_rounded,
                        color: AppColors.gradientStart, size: 26),
                    const SizedBox(width: 10),
                    Text(
                      'Refleksi Belajar',
                      style: GoogleFonts.nunito(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF1F1F24),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Renungkan pengalaman belajarmu untuk memperkuat pemahaman konsep:',
                  style: GoogleFonts.nunito(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF6B6880),
                  ),
                ),
                const SizedBox(height: 16),
                ...GameContent.reflectionPrompts.asMap().entries.map((entry) {
                  final int index = entry.key;
                  final String prompt = entry.value;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${index + 1}. $prompt',
                          style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF2C2C34),
                          ),
                        ),
                        const SizedBox(height: 6),
                        TextField(
                          controller: _controllers[index],
                          onChanged: (val) {
                            setState(() {
                              _reflections[index] = val;
                            });
                          },
                          maxLines: 2,
                          style: GoogleFonts.nunito(fontSize: 14),
                          decoration: InputDecoration(
                            hintText: 'Tuliskan refleksimu di sini...',
                            hintStyle: GoogleFonts.nunito(
                              fontSize: 13,
                              color: Colors.grey.shade500,
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF8F9FA),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 10,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey.shade300),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey.shade300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: AppColors.gradientStart,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Tombol Aksi: Coba Level Lain & Kembali ke Awal
          CustomButton(
            text: 'Coba Level Lain',
            icon: const Icon(Icons.tune_rounded, color: AppColors.primaryButtonText),
            height: 56,
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LevelSelectScreen()),
                (route) => false,
              );
            },
          ),
          const SizedBox(height: 12),
          CustomButton(
            text: 'Kembali ke Awal',
            type: CustomButtonType.secondary,
            icon: const Icon(Icons.home_rounded, color: AppColors.secondaryButtonText),
            height: 52,
            onPressed: () {
              controller.resetAll();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const IntroScreen()),
                (route) => false,
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
