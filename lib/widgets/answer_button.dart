import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class AnswerButton extends StatefulWidget {
  final int index;
  final String text;
  final bool isSelected;
  final bool isCorrect;
  final bool isSubmitted;
  final VoidCallback? onTap;

  const AnswerButton({
    super.key,
    required this.index,
    required this.text,
    required this.isSelected,
    required this.isCorrect,
    required this.isSubmitted,
    required this.onTap,
  });

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final int colorIndex = widget.index % AppShapes.optionColors.length;
    final Color baseColor = AppShapes.optionColors[colorIndex];
    final Color shadowColor = AppShapes.optionShadowColors[colorIndex];
    final String shapeIcon = AppShapes.optionShapes[colorIndex];
    final String shapeName = AppShapes.shapeNames[colorIndex];

    final bool isEnabled = !widget.isSubmitted && widget.onTap != null;
    final bool disableAnimations = MediaQuery.disableAnimationsOf(context);

    // Styling saat status kuis submitted
    Color cardColor = baseColor;
    Color bottomBorderColor = shadowColor;
    Widget? statusBadge;
    double opacity = 1.0;

    if (widget.isSubmitted) {
      if (widget.isCorrect) {
        // Jawaban yang benar selalu ditandai dengan centang
        statusBadge = Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check, color: AppColors.optionGreen, size: 20),
        );
      } else if (widget.isSelected && !widget.isCorrect) {
        // Jawaban yang salah dipilih ditandai silang
        statusBadge = Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.close, color: AppColors.optionRed, size: 20),
        );
      } else {
        // Pilihan lain yang tidak dipilih dan bukan jawaban benar
        opacity = 0.55;
      }
    }

    const double shadowDepth = 4.0;
    final double currentOffset = (_isPressed && isEnabled) ? shadowDepth : 0.0;

    String semanticState = '';
    if (widget.isSubmitted) {
      if (widget.isCorrect) {
        semanticState = ', Jawaban Benar';
      } else if (widget.isSelected) {
        semanticState = ', Jawaban Salah Dipilih';
      }
    }

    return Semantics(
      button: true,
      enabled: isEnabled,
      label: 'Pilihan ${widget.index + 1} ($shapeName): ${widget.text}$semanticState',
      child: Opacity(
        opacity: opacity,
        child: GestureDetector(
          onTapDown: isEnabled ? (_) => setState(() => _isPressed = true) : null,
          onTapUp: isEnabled
              ? (_) {
                  setState(() => _isPressed = false);
                  widget.onTap?.call();
                }
              : null,
          onTapCancel: isEnabled ? () => setState(() => _isPressed = false) : null,
          child: AnimatedContainer(
            duration: disableAnimations
                ? Duration.zero
                : const Duration(milliseconds: 70),
            constraints: const BoxConstraints(minHeight: 68),
            transform: Matrix4.translationValues(0, currentOffset, 0),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(16),
              border: widget.isSubmitted && (widget.isCorrect || widget.isSelected)
                  ? Border.all(color: Colors.white, width: 2.5)
                  : null,
              boxShadow: [
                if (!_isPressed && isEnabled)
                  BoxShadow(
                    color: bottomBorderColor,
                    offset: const Offset(0, shadowDepth),
                    blurRadius: 0,
                  ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  // Ikon Bentuk Geometris Quizizz
                  Container(
                    width: 38,
                    height: 38,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      shapeIcon,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  // Teks Jawaban
                  Expanded(
                    child: Text(
                      widget.text,
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                      ),
                    ),
                  ),
                  // Badge Centang / Silang
                  if (statusBadge != null) ...[
                    const SizedBox(width: 8),
                    statusBadge,
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
