import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

enum CustomButtonType { primary, secondary, danger }

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final CustomButtonType type;
  final Widget? icon;
  final double? width;
  final double height;
  final Color? customColor;
  final Color? customShadowColor;
  final Color? customTextColor;
  final String? semanticsLabel;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = CustomButtonType.primary,
    this.icon,
    this.width,
    this.height = 54.0,
    this.customColor,
    this.customShadowColor,
    this.customTextColor,
    this.semanticsLabel,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = widget.onPressed != null;
    final bool disableAnimations = MediaQuery.disableAnimationsOf(context);

    Color bgColor;
    Color shadowColor;
    Color textColor;

    if (widget.customColor != null) {
      bgColor = widget.customColor!;
      shadowColor = widget.customShadowColor ?? widget.customColor!.withValues(alpha: 0.7);
      textColor = widget.customTextColor ?? Colors.white;
    } else {
      switch (widget.type) {
        case CustomButtonType.primary:
          bgColor = AppColors.primaryButton;
          shadowColor = AppColors.primaryButtonShadow;
          textColor = AppColors.primaryButtonText;
          break;
        case CustomButtonType.secondary:
          bgColor = AppColors.secondaryButton;
          shadowColor = AppColors.secondaryButtonShadow;
          textColor = AppColors.secondaryButtonText;
          break;
        case CustomButtonType.danger:
          bgColor = const Color(0xFFEF5350);
          shadowColor = const Color(0xFFC62828);
          textColor = Colors.white;
          break;
      }
    }

    if (!isEnabled) {
      bgColor = Colors.grey.shade300;
      shadowColor = Colors.grey.shade400;
      textColor = Colors.grey.shade600;
    }

    const double shadowDepth = 4.0;
    final double currentOffset = (_isPressed && isEnabled) ? shadowDepth : 0.0;

    return Semantics(
      button: true,
      enabled: isEnabled,
      label: widget.semanticsLabel ?? widget.text,
      child: GestureDetector(
        onTapDown: isEnabled ? (_) => setState(() => _isPressed = true) : null,
        onTapUp: isEnabled
            ? (_) {
                setState(() => _isPressed = false);
                widget.onPressed?.call();
              }
            : null,
        onTapCancel: isEnabled ? () => setState(() => _isPressed = false) : null,
        child: AnimatedContainer(
          duration: disableAnimations
              ? Duration.zero
              : const Duration(milliseconds: 70),
          width: widget.width,
          height: widget.height,
          transform: Matrix4.translationValues(0, currentOffset, 0),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              if (!_isPressed && isEnabled)
                BoxShadow(
                  color: shadowColor,
                  offset: const Offset(0, shadowDepth),
                  blurRadius: 0,
                ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisSize:
                  widget.width == null ? MainAxisSize.min : MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.icon != null) ...[
                  widget.icon!,
                  const SizedBox(width: 8),
                ],
                Flexible(
                  child: Text(
                    widget.text,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
