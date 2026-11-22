// Conditional import untuk web vs non-web
import 'storage_service_stub.dart'
    if (dart.library.html) 'storage_service_web.dart';

/// Service untuk menyimpan data lokal (highscore, sesi terakhir).
class StorageService {
  static final StorageService instance = StorageService._internal();
  StorageService._internal();

  static const String _keyHighscore = 'nq_highscore';
  static const String _keyTotalSessions = 'nq_total_sessions';
  static const String _keyLastScore = 'nq_last_score';
  static const String _keyLastTitle = 'nq_last_title';

  /// Simpan skor jika lebih tinggi dari highscore
  void saveSession({required int score, required String title}) {
    final current = getHighscore();
    if (score > current) {
      setLocalValue(_keyHighscore, score.toString());
    }
    setLocalValue(_keyLastScore, score.toString());
    setLocalValue(_keyLastTitle, title);
    final sessions = getTotalSessions() + 1;
    setLocalValue(_keyTotalSessions, sessions.toString());
  }

  int getHighscore() {
    final val = getLocalValue(_keyHighscore);
    return int.tryParse(val ?? '') ?? 0;
  }

  int getTotalSessions() {
    final val = getLocalValue(_keyTotalSessions);
    return int.tryParse(val ?? '') ?? 0;
  }

  int getLastScore() {
    final val = getLocalValue(_keyLastScore);
    return int.tryParse(val ?? '') ?? 0;
  }

  String getLastTitle() {
    return getLocalValue(_keyLastTitle) ?? '';
  }

  void clearAll() {
    removeLocalValue(_keyHighscore);
    removeLocalValue(_keyTotalSessions);
    removeLocalValue(_keyLastScore);
    removeLocalValue(_keyLastTitle);
  }
}
