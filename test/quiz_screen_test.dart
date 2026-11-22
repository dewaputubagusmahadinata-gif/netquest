import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:netquest/models/level.dart';
import 'package:netquest/screens/quiz_screen.dart';
import 'package:netquest/state/game_controller.dart';
import 'package:netquest/theme/app_theme.dart';
import 'package:netquest/widgets/answer_button.dart';
import 'package:netquest/widgets/feedback_banner.dart';
import 'package:netquest/widgets/hud_bar.dart';
import 'package:netquest/widgets/route_dots.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('QuizScreen menampilkan soal, 4 opsi bentuk, HUD, dan umpan balik', (WidgetTester tester) async {
    final controller = GameController();
    controller.selectLevel(GameLevel.level1);
    controller.startMission();

    await tester.pumpWidget(
      ChangeNotifierProvider<GameController>.value(
        value: controller,
        child: MaterialApp(
          theme: AppTheme.themeData,
          home: const QuizScreen(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Verifikasi HUD Bar dan RouteDots ada
    expect(find.byType(HudBar), findsOneWidget);
    expect(find.byType(RouteDots), findsOneWidget);

    // Verifikasi teks pertanyaan tampil
    final currentQ = controller.currentQuestion!;
    expect(find.text(currentQ.text), findsOneWidget);

    // Verifikasi 4 AnswerButton tersedia
    expect(find.byType(AnswerButton), findsNWidgets(4));

    // Belum ada FeedbackBanner sebelum menjawab
    expect(find.byType(FeedbackBanner), findsNothing);

    // Tekan salah satu tombol jawaban (misal tombol pertama)
    await tester.tap(find.byType(AnswerButton).first);
    await tester.pumpAndSettle();

    // Verifikasi status kuis terkunci dan banner umpan balik muncul
    expect(controller.isAnswerSubmitted, true);
    expect(find.byType(FeedbackBanner), findsOneWidget);
    expect(find.text('Lanjut'), findsOneWidget);

    // Tekan tombol "Lanjut" untuk melanjutkan ke soal berikutnya
    await tester.tap(find.text('Lanjut'));
    await tester.pumpAndSettle();

    // Verifikasi berpindah ke soal ke-2 (indeks 1)
    expect(controller.currentIndex, 1);
  });
}
