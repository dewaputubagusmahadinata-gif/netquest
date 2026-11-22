import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/game_mode.dart';
import '../models/question.dart';
import '../state/game_controller.dart';
import '../widgets/answer_button.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/feedback_banner.dart';
import '../widgets/game_card.dart';
import '../widgets/hud_bar.dart';
import '../widgets/route_dots.dart';
import 'boss_intro_screen.dart';
import 'game_over_screen.dart';
import 'level_select_screen.dart';
import 'placement_screen.dart';
import 'result_screen.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<GameController>();
    final ShuffledQuestion? question = controller.currentQuestion;

    if (question == null) {
      return const AppScaffold(
        body: Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    final bool isSubmitted = controller.isAnswerSubmitted;
    final int? selectedIndex = controller.selectedAnswerIndex;
    final bool isCorrect = controller.isCurrentAnswerCorrect;

    return AppScaffold(
      scrollable: true,
      topBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HudBar(
            mode: controller.mode,
            level: controller.currentLevel,
            lives: controller.lives,
            score: controller.score,
            streak: controller.streak,
            onLevelSwitch: controller.mode == GameMode.mission
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LevelSelectScreen(),
                      ),
                    );
                  }
                : null,
          ),
          RouteDots(
            totalDots: controller.totalQuestions,
            currentIndex: controller.currentIndex,
          ),
        ],
      ),
      bottomBar: isSubmitted
          ? FeedbackBanner(
              isCorrect: isCorrect,
              explanation: question.explanation,
              onNext: () {
                controller.nextQuestion();

                if (controller.isGameOver) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const GameOverScreen(),
                    ),
                  );
                } else if (controller.mode == GameMode.readiness && controller.isReadinessFinished) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PlacementScreen(),
                    ),
                  );
                } else if (controller.mode == GameMode.mission && controller.isMissionFinished) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const BossIntroScreen(),
                    ),
                  );
                } else if (controller.mode == GameMode.boss && controller.isBossFinished) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ResultScreen(),
                    ),
                  );
                }
              },
            )
          : null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),

          // Kartu Pertanyaan
          GameCard(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'PERTANYAAN ${controller.currentIndex + 1} DARI ${controller.totalQuestions}',
                      style: GoogleFonts.nunito(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF7B3FD6),
                        letterSpacing: 1.0,
                      ),
                    ),
                    if (controller.mode == GameMode.readiness)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3E8FF),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Diagnostik',
                          style: GoogleFonts.nunito(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF7B3FD6),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  question.text,
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF1F1F24),
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // Pilihan Jawaban (Responsif: 2 kolom jika lebar >= 520, 1 kolom jika < 520)
          LayoutBuilder(
            builder: (context, constraints) {
              final bool isWide = constraints.maxWidth >= 520;
              final options = question.shuffledOptions;

              if (isWide) {
                // 2 Kolom Grid
                return Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: List.generate(options.length, (index) {
                    final itemWidth = (constraints.maxWidth - 12) / 2;
                    return SizedBox(
                      width: itemWidth,
                      child: AnswerButton(
                        index: index,
                        text: options[index].text,
                        isSelected: selectedIndex == index,
                        isCorrect: question.isCorrect(index),
                        isSubmitted: isSubmitted,
                        onTap: () => controller.submitAnswer(index),
                      ),
                    );
                  }),
                );
              } else {
                // 1 Kolom Vertikal
                return Column(
                  children: List.generate(options.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: AnswerButton(
                        index: index,
                        text: options[index].text,
                        isSelected: selectedIndex == index,
                        isCorrect: question.isCorrect(index),
                        isSubmitted: isSubmitted,
                        onTap: () => controller.submitAnswer(index),
                      ),
                    );
                  }),
                );
              }
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
