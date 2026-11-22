import 'package:flutter/material.dart';

enum GameLevel {
  level1(
    id: 1,
    name: 'Level 1: Pijakan',
    title: 'Pijakan',
    emoji: '🌱',
    color: Color(0xFF2E7D32),
    accentColor: Color(0xFFE8F5E9),
    description: 'Pahami pondasi jaringan komputer, perangkat dasar, dan analogi sederhana.',
  ),
  level2(
    id: 2,
    name: 'Level 2: Jelajah',
    title: 'Jelajah',
    emoji: '🧭',
    color: Color(0xFF1565C0),
    accentColor: Color(0xFFE3F2FD),
    description: 'Jelajahi jangkauan jaringan (LAN/MAN/WAN), topologi, media kabel & nirkabel.',
  ),
  level3(
    id: 3,
    name: 'Level 3: Tantang',
    title: 'Tantang',
    emoji: '🚀',
    color: Color(0xFFE65100),
    accentColor: Color(0xFFFFF3E0),
    description: 'Tantang pemahaman subnet IPv4, DNS, DHCP, default gateway, dan troubleshooting.',
  );

  final int id;
  final String name;
  final String title;
  final String emoji;
  final Color color;
  final Color accentColor;
  final String description;

  const GameLevel({
    required this.id,
    required this.name,
    required this.title,
    required this.emoji,
    required this.color,
    required this.accentColor,
    required this.description,
  });

  static GameLevel fromId(int id) {
    switch (id) {
      case 1:
        return GameLevel.level1;
      case 2:
        return GameLevel.level2;
      case 3:
        return GameLevel.level3;
      default:
        return GameLevel.level1;
    }
  }

  static GameLevel fromReadinessScore(int score) {
    if (score <= 2) {
      return GameLevel.level1;
    } else if (score <= 4) {
      return GameLevel.level2;
    } else {
      return GameLevel.level3;
    }
  }
}
