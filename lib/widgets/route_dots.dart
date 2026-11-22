import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class RouteDots extends StatelessWidget {
  final int totalDots;
  final int currentIndex;

  const RouteDots({
    super.key,
    required this.totalDots,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    if (totalDots <= 0) return const SizedBox.shrink();

    return Semantics(
      label: 'Jalur soal: Soal ${currentIndex + 1} dari $totalDots',
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(totalDots * 2 - 1, (index) {
            // Indeks ganjil adalah garis penghubung, indeks genap adalah titik soal
            if (index.isOdd) {
              final int prevDotIndex = index ~/ 2;
              final bool isLineCompleted = prevDotIndex < currentIndex;
              return Expanded(
                child: Container(
                  height: 4,
                  color: isLineCompleted
                      ? AppColors.dotCompleted
                      : AppColors.dotInactive,
                ),
              );
            } else {
              final int dotIndex = index ~/ 2;
              final bool isCompleted = dotIndex < currentIndex;
              final bool isCurrent = dotIndex == currentIndex;

              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: isCurrent ? 24 : 18,
                height: isCurrent ? 24 : 18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted
                      ? AppColors.dotCompleted
                      : (isCurrent ? AppColors.dotActive : AppColors.dotInactive),
                  border: isCurrent
                      ? Border.all(
                          color: AppColors.primaryButton,
                          width: 3.5,
                        )
                      : null,
                  boxShadow: isCurrent
                      ? [
                          BoxShadow(
                            color: Colors.white.withValues(alpha: 0.5),
                            blurRadius: 8,
                            spreadRadius: 2,
                          ),
                        ]
                      : null,
                ),
                child: isCompleted
                    ? const Icon(
                        Icons.check,
                        size: 12,
                        color: Color(0xFF5A2A00),
                      )
                    : null,
              );
            }
          }),
        ),
      ),
    );
  }
}
