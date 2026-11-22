/// Mode permainan dalam NetQuest.
enum GameMode {
  readiness(
    title: 'Cek Kesiapan',
    usesLives: false,
    usesScore: false,
  ),
  mission(
    title: 'Misi Jaringan',
    usesLives: true,
    usesScore: true,
  ),
  boss(
    title: 'Tantangan Boss',
    usesLives: true,
    usesScore: true,
  );

  final String title;
  final bool usesLives;
  final bool usesScore;

  const GameMode({
    required this.title,
    required this.usesLives,
    required this.usesScore,
  });
}
