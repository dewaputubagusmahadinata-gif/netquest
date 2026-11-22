import 'dart:math';

/// Representasi data soal asli dari bank data.
class Question {
  final String id;
  final String text;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  const Question({
    required this.id,
    required this.text,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });

  /// Membuat representasi soal dengan opsi yang teracak.
  /// Urutan dilacak menggunakan [ShuffledOption.originalIndex].
  ShuffledQuestion toShuffled([Random? random]) {
    final rng = random ?? Random();
    final items = List.generate(
      options.length,
      (i) => ShuffledOption(text: options[i], originalIndex: i),
    );
    items.shuffle(rng);
    return ShuffledQuestion(
      question: this,
      shuffledOptions: items,
    );
  }
}

/// Opsi jawaban dengan pelacakan indeks asli agar pengacakan aman.
class ShuffledOption {
  final String text;
  final int originalIndex;

  const ShuffledOption({
    required this.text,
    required this.originalIndex,
  });
}

/// Soal dengan daftar opsi yang sudah diacak untuk sesi kuis.
class ShuffledQuestion {
  final Question question;
  final List<ShuffledOption> shuffledOptions;

  const ShuffledQuestion({
    required this.question,
    required this.shuffledOptions,
  });

  String get text => question.text;
  String get explanation => question.explanation;
  int get correctIndex => question.correctIndex;

  bool isCorrect(int shuffledIndex) {
    if (shuffledIndex < 0 || shuffledIndex >= shuffledOptions.length) {
      return false;
    }
    return shuffledOptions[shuffledIndex].originalIndex == question.correctIndex;
  }
}
