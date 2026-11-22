import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import 'custom_button.dart';

class FeedbackBanner extends StatelessWidget {
  final bool isCorrect;
  final String explanation;
  final VoidCallback onNext;

  const FeedbackBanner({
    super.key,
    required this.isCorrect,
    required this.explanation,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final Color bgColor = isCorrect
        ? AppColors.feedbackCorrectBg
        : AppColors.feedbackWrongBg;
    final Color accentColor = isCorrect
        ? AppColors.feedbackCorrectBorder
        : AppColors.feedbackWrongBorder;
    final IconData icon = isCorrect ? Icons.check_circle : Icons.cancel;
    final String title = isCorrect ? 'Tepat!' : 'Belum tepat.';

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            offset: const Offset(0, -3),
            blurRadius: 10,
          ),
        ],
        border: Border(
          top: BorderSide(color: accentColor, width: 4),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(icon, color: accentColor, size: 28),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: GoogleFonts.nunito(
                    color: accentColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Penjelasan: $explanation',
              style: GoogleFonts.nunito(
                color: const Color(0xFF2C2C34),
                fontSize: 15,
                fontWeight: FontWeight.w600,
                height: 1.35,
              ),
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Lanjut',
              icon: const Icon(Icons.arrow_forward_rounded, color: AppColors.primaryButtonText),
              onPressed: onNext,
              height: 52,
            ),
          ],
        ),
      ),
    );
  }
}
