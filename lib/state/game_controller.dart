import 'dart:math';
import 'package:flutter/foundation.dart';
import '../data/game_content.dart';
import '../models/game_mode.dart';
import '../models/level.dart';
import '../models/question.dart';
import '../services/audio_service.dart';
import '../services/storage_service.dart';

/// State controller terpusat yang memegang seluruh aturan dan alur game.
class GameController extends ChangeNotifier {
  final Random _random;

  // Mode & Level Aktif
  GameMode _mode = GameMode.readiness;
  GameLevel _currentLevel = GameLevel.level1;
  GameLevel? _recommendedLevel;

  // Daftar soal yang sedang aktif (dengan opsi teracak)
  List<ShuffledQuestion> _questions = [];
  int _currentIndex = 0;

  // Status Jawaban pada Soal Aktif
  int? _selectedAnswerIndex;
  bool _isAnswerSubmitted = false;

  // Skor, Streak, dan Nyawa
  int _score = 0;
  int _streak = 0;
  int _lives = 3;
  static const int maxLives = 3;

  // Statistik Kuis
  int _readinessScore = 0;
  int _missionCorrectCount = 0;
  int _bossCorrectCount = 0;

  // Status Layar
  bool _isGameOver = false;
  bool _isReadinessFinished = false;
  bool _isMissionFinished = false;
  bool _isBossFinished = false;

  GameController({Random? random}) : _random = random ?? Random();

  // Getters
  GameMode get mode => _mode;
  GameLevel get currentLevel => _currentLevel;
  GameLevel? get recommendedLevel => _recommendedLevel;

  List<ShuffledQuestion> get questions => _questions;
  int get currentIndex => _currentIndex;
  int get totalQuestions => _questions.length;
  ShuffledQuestion? get currentQuestion =>
      (_questions.isNotEmpty && _currentIndex < _questions.length)
          ? _questions[_currentIndex]
          : null;

  int? get selectedAnswerIndex => _selectedAnswerIndex;
  bool get isAnswerSubmitted => _isAnswerSubmitted;

  int get score => _score;
  int get streak => _streak;
  int get lives => _lives;
  bool get isGameOver => _isGameOver;

  int get readinessScore => _readinessScore;
  int get missionCorrectCount => _missionCorrectCount;
  int get bossCorrectCount => _bossCorrectCount;

  bool get isReadinessFinished => _isReadinessFinished;
  bool get isMissionFinished => _isMissionFinished;
  bool get isBossFinished => _isBossFinished;

  bool get isAudioMuted => AudioService.instance.isMuted;

  void toggleAudioMute() {
    AudioService.instance.toggleMute();
    notifyListeners();
  }

  /// Memeriksa apakah jawaban yang dipilih benar
  bool get isCurrentAnswerCorrect {
    if (!_isAnswerSubmitted || _selectedAnswerIndex == null || currentQuestion == null) {
      return false;
    }
    return currentQuestion!.isCorrect(_selectedAnswerIndex!);
  }

  /// Gelar akhir berdasarkan capaian Boss
  String get finalTitle {
    if (_bossCorrectCount >= 3) {
      return 'Arsitek Jaringan';
    } else if (_bossCorrectCount == 2) {
      return 'Teknisi Jaringan';
    } else {
      return 'Calon Teknisi';
    }
  }

  // ==========================================
  // Navigasi & Setup Mode Game
  // ==========================================

  /// Memulai sesi Cek Kesiapan (ambil 5 acak dari pool 15)
  void startReadiness() {
    AudioService.instance.playBgm();
    _mode = GameMode.readiness;
    _readinessScore = 0;
    _isReadinessFinished = false;
    _isMissionFinished = false;
    _isBossFinished = false;
    _isGameOver = false;
    _resetQuestionState();
    final pool = List<Question>.from(GameContent.readinessQuestions)..shuffle(_random);
    _questions = pool.take(5).map((q) => q.toShuffled(_random)).toList();
    notifyListeners();
  }

  /// Memilih level tertentu secara eksplisit
  void selectLevel(GameLevel level) {
    _currentLevel = level;
    _isGameOver = false;
    _isMissionFinished = false;
    _isBossFinished = false;
    _missionCorrectCount = 0;
    notifyListeners();
  }

  /// Menetapkan level berdasarkan hasil Cek Kesiapan
  void applyPlacement(int score) {
    _readinessScore = score;
    _recommendedLevel = GameLevel.fromReadinessScore(score);
    _currentLevel = _recommendedLevel!;
    notifyListeners();
  }

  /// Memulai Misi Level Aktif (ambil 6 acak dari pool 12)
  void startMission() {
    AudioService.instance.playBgm();
    _mode = GameMode.mission;
    _lives = maxLives;
    _streak = 0;
    _isGameOver = false;
    _isReadinessFinished = false;
    _isMissionFinished = false;
    _isBossFinished = false;
    _missionCorrectCount = 0;
    _resetQuestionState();
    final sourceQuestions = GameContent.missionQuestions[_currentLevel] ?? [];
    final pool = List<Question>.from(sourceQuestions)..shuffle(_random);
    _questions = pool.take(6).map((q) => q.toShuffled(_random)).toList();
    notifyListeners();
  }

  /// Mengulang misi saat ini setelah nyawa habis
  void retryCurrentMission() {
    startMission();
  }

  /// Menurunkan level ke N-1 jika nyawa habis dan level > 1
  bool downgradeLevel() {
    if (_currentLevel.id > 1) {
      _currentLevel = GameLevel.fromId(_currentLevel.id - 1);
      _isGameOver = false;
      notifyListeners();
      return true;
    }
    return false;
  }

  /// Memulai Boss Level (ambil 3 acak dari pool 9)
  void startBoss() {
    AudioService.instance.playBgm();
    _mode = GameMode.boss;
    _lives = maxLives;
    _streak = 0;
    _bossCorrectCount = 0;
    _isGameOver = false;
    _isReadinessFinished = false;
    _isMissionFinished = false;
    _isBossFinished = false;
    _resetQuestionState();
    final pool = List<Question>.from(GameContent.bossQuestions)..shuffle(_random);
    _questions = pool.take(3).map((q) => q.toShuffled(_random)).toList();
    notifyListeners();
  }

  /// Mereset seluruh permainan kembali ke Intro
  void resetAll() {
    _mode = GameMode.readiness;
    _currentLevel = GameLevel.level1;
    _recommendedLevel = null;
    _score = 0;
    _streak = 0;
    _lives = maxLives;
    _readinessScore = 0;
    _missionCorrectCount = 0;
    _bossCorrectCount = 0;
    _isGameOver = false;
    _isReadinessFinished = false;
    _isMissionFinished = false;
    _isBossFinished = false;
    _resetQuestionState();
    _questions = [];
    notifyListeners();
  }

  // ==========================================
  // Logika Menjawab Soal
  // ==========================================

  void _resetQuestionState() {
    _currentIndex = 0;
    _selectedAnswerIndex = null;
    _isAnswerSubmitted = false;
  }

  /// Siswa memilih salah satu opsi jawaban
  void submitAnswer(int shuffledIndex) {
    if (_isAnswerSubmitted || currentQuestion == null) return;

    _selectedAnswerIndex = shuffledIndex;
    _isAnswerSubmitted = true;

    final isCorrect = currentQuestion!.isCorrect(shuffledIndex);

    if (isCorrect) {
      AudioService.instance.playCorrect();
      _handleCorrectAnswer();
    } else {
      AudioService.instance.playWrong();
      _handleWrongAnswer();
    }

    notifyListeners();
  }

  void _handleCorrectAnswer() {
    if (_mode == GameMode.readiness) {
      _readinessScore++;
    } else {
      // Misi atau Boss
      _streak++;
      if (_mode == GameMode.mission) {
        _missionCorrectCount++;
      } else if (_mode == GameMode.boss) {
        _bossCorrectCount++;
      }

      // Hitung Poin: Dasar +10, Mulai streak 3 bertambah bonus +5 (total +15)
      int pointsEarned = 10;
      if (_streak >= 3) {
        pointsEarned += 5;
      }
      _score += pointsEarned;
    }
  }

  void _handleWrongAnswer() {
    if (_mode != GameMode.readiness) {
      // Misi atau Boss
      _streak = 0;
      _lives--;

      if (_lives <= 0) {
        _isGameOver = true;
      }
    }
  }

  /// Menekan tombol "Lanjut" setelah melihat umpan balik
  void nextQuestion() {
    if (!_isAnswerSubmitted) return;

    // Jika nyawa habis saat menjawab salah, tetap di kondisi game over
    if (_isGameOver) {
      notifyListeners();
      return;
    }

    if (_currentIndex + 1 < _questions.length) {
      _currentIndex++;
      _selectedAnswerIndex = null;
      _isAnswerSubmitted = false;
    } else {
      // Soal pada sesi ini sudah selesai
      if (_mode == GameMode.readiness) {
        _isReadinessFinished = true;
      } else if (_mode == GameMode.mission) {
        _isMissionFinished = true;
        StorageService.instance.saveSession(
          score: _score,
          title: finalTitle,
        );
      } else if (_mode == GameMode.boss) {
        _isBossFinished = true;
        StorageService.instance.saveSession(
          score: _score,
          title: finalTitle,
        );
      }
    }

    notifyListeners();
  }
}
