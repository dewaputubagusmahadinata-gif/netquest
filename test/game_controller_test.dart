import 'package:flutter_test/flutter_test.dart';
import 'package:netquest/models/game_mode.dart';
import 'package:netquest/models/level.dart';
import 'package:netquest/services/audio_service.dart';
import 'package:netquest/state/game_controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  AudioService.enableAudio = false;
  group('GameController - Penempatan Level (Readiness Placement)', () {
    test('Skor 0-2 menghasilkan Level 1 (Pijakan)', () {
      final controller = GameController();
      controller.applyPlacement(0);
      expect(controller.recommendedLevel, GameLevel.level1);
      expect(controller.currentLevel, GameLevel.level1);

      controller.applyPlacement(2);
      expect(controller.recommendedLevel, GameLevel.level1);
      expect(controller.currentLevel, GameLevel.level1);
    });

    test('Skor 3-4 menghasilkan Level 2 (Jelajah)', () {
      final controller = GameController();
      controller.applyPlacement(3);
      expect(controller.recommendedLevel, GameLevel.level2);
      expect(controller.currentLevel, GameLevel.level2);

      controller.applyPlacement(4);
      expect(controller.recommendedLevel, GameLevel.level2);
      expect(controller.currentLevel, GameLevel.level2);
    });

    test('Skor 5 menghasilkan Level 3 (Tantang)', () {
      final controller = GameController();
      controller.applyPlacement(5);
      expect(controller.recommendedLevel, GameLevel.level3);
      expect(controller.currentLevel, GameLevel.level3);
    });
  });

  group('GameController - Poin dan Bonus Streak', () {
    test('Jawaban benar menghasilkan +10 poin, streak ke-3 dst bonus +5 (total +15)', () {
      final controller = GameController();
      controller.selectLevel(GameLevel.level1);
      controller.startMission();

      expect(controller.score, 0);
      expect(controller.streak, 0);

      // Jawaban 1 benar
      int correctIndex1 = _findCorrectShuffledIndex(controller);
      controller.submitAnswer(correctIndex1);
      expect(controller.score, 10);
      expect(controller.streak, 1);
      controller.nextQuestion();

      // Jawaban 2 benar
      int correctIndex2 = _findCorrectShuffledIndex(controller);
      controller.submitAnswer(correctIndex2);
      expect(controller.score, 20); // 10 + 10
      expect(controller.streak, 2);
      controller.nextQuestion();

      // Jawaban 3 benar (streak 3 -> bonus 5 -> +15)
      int correctIndex3 = _findCorrectShuffledIndex(controller);
      controller.submitAnswer(correctIndex3);
      expect(controller.score, 35); // 20 + 15
      expect(controller.streak, 3);
      controller.nextQuestion();

      // Jawaban 4 benar (streak 4 -> bonus 5 -> +15)
      int correctIndex4 = _findCorrectShuffledIndex(controller);
      controller.submitAnswer(correctIndex4);
      expect(controller.score, 50); // 35 + 15
      expect(controller.streak, 4);
    });
  });

  group('GameController - Pengurangan Nyawa dan Game Over', () {
    test('Jawaban salah mengurangi 1 nyawa dan mereset streak ke 0', () {
      final controller = GameController();
      controller.selectLevel(GameLevel.level1);
      controller.startMission();

      expect(controller.lives, 3);

      // Jawab benar 1x dulu agar ada streak
      int correctIndex = _findCorrectShuffledIndex(controller);
      controller.submitAnswer(correctIndex);
      expect(controller.streak, 1);
      controller.nextQuestion();

      // Jawab salah
      int wrongIndex = _findWrongShuffledIndex(controller);
      controller.submitAnswer(wrongIndex);

      expect(controller.lives, 2);
      expect(controller.streak, 0);
      expect(controller.isGameOver, false);
    });

    test('3 kali salah menyebabkan kondisi isGameOver = true', () {
      final controller = GameController();
      controller.selectLevel(GameLevel.level1);
      controller.startMission();

      expect(controller.lives, 3);

      // Salah 1
      controller.submitAnswer(_findWrongShuffledIndex(controller));
      expect(controller.lives, 2);
      expect(controller.isGameOver, false);
      controller.nextQuestion();

      // Salah 2
      controller.submitAnswer(_findWrongShuffledIndex(controller));
      expect(controller.lives, 1);
      expect(controller.isGameOver, false);
      controller.nextQuestion();

      // Salah 3
      controller.submitAnswer(_findWrongShuffledIndex(controller));
      expect(controller.lives, 0);
      expect(controller.isGameOver, true);
    });

    test('Cek kesiapan tidak mengurangi nyawa dan tidak menambah poin', () {
      final controller = GameController();
      controller.startReadiness();

      expect(controller.mode, GameMode.readiness);
      expect(controller.lives, 3);
      expect(controller.score, 0);

      // Jawab salah di cek kesiapan
      int wrongIndex = _findWrongShuffledIndex(controller);
      controller.submitAnswer(wrongIndex);

      expect(controller.lives, 3);
      expect(controller.score, 0);
      expect(controller.readinessScore, 0);
      expect(controller.isGameOver, false);
    });

    test('Downgrade level berpindah ke level N-1 jika level > 1', () {
      final controller = GameController();
      controller.selectLevel(GameLevel.level3);
      expect(controller.currentLevel, GameLevel.level3);

      bool downgraded = controller.downgradeLevel();
      expect(downgraded, true);
      expect(controller.currentLevel, GameLevel.level2);

      downgraded = controller.downgradeLevel();
      expect(downgraded, true);
      expect(controller.currentLevel, GameLevel.level1);

      downgraded = controller.downgradeLevel();
      expect(downgraded, false);
      expect(controller.currentLevel, GameLevel.level1);
    });

    test('Alur Lengkap: Cek Kesiapan -> Penempatan -> Misi -> Boss -> Hasil Akhir', () {
      final controller = GameController();

      // 1. Cek Kesiapan
      controller.startReadiness();
      expect(controller.mode, GameMode.readiness);
      for (int i = 0; i < 5; i++) {
        expect(controller.currentIndex, i);
        controller.submitAnswer(_findCorrectShuffledIndex(controller));
        controller.nextQuestion();
      }
      expect(controller.isReadinessFinished, true);
      expect(controller.readinessScore, 5);

      // 2. Penempatan
      controller.applyPlacement(controller.readinessScore);
      expect(controller.recommendedLevel, GameLevel.level3);
      expect(controller.currentLevel, GameLevel.level3);

      // 3. Misi
      controller.startMission();
      expect(controller.mode, GameMode.mission);
      expect(controller.isReadinessFinished, false);
      final missionTotal = controller.totalQuestions;
      for (int i = 0; i < missionTotal; i++) {
        expect(controller.currentIndex, i);
        controller.submitAnswer(_findCorrectShuffledIndex(controller));
        controller.nextQuestion();
      }
      expect(controller.isMissionFinished, true);
      expect(controller.missionCorrectCount, missionTotal);

      // 4. Boss
      controller.startBoss();
      expect(controller.mode, GameMode.boss);
      expect(controller.isMissionFinished, false);
      for (int i = 0; i < 3; i++) {
        expect(controller.currentIndex, i);
        controller.submitAnswer(_findCorrectShuffledIndex(controller));
        controller.nextQuestion();
      }
      expect(controller.isBossFinished, true);
      expect(controller.bossCorrectCount, 3);
      expect(controller.finalTitle, 'Arsitek Jaringan');
    });
  });
}

int _findCorrectShuffledIndex(GameController controller) {
  final q = controller.currentQuestion!;
  for (int i = 0; i < q.shuffledOptions.length; i++) {
    if (q.isCorrect(i)) return i;
  }
  return 0;
}

int _findWrongShuffledIndex(GameController controller) {
  final q = controller.currentQuestion!;
  for (int i = 0; i < q.shuffledOptions.length; i++) {
    if (!q.isCorrect(i)) return i;
  }
  return 0;
}
