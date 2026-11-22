import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Kartu bergaya Quizizz: Putih, sudut membulat 18, garis bawah tebal 3D.
class GameCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final Color backgroundColor;
  final Color bottomBorderColor;
  final double borderRadius;
  final double bottomBorderSize;

  const GameCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.margin,
    this.backgroundColor = AppColors.cardBackground,
    this.bottomBorderColor = AppColors.cardBorderBottom,
    this.borderRadius = 18.0,
    this.bottomBorderSize = 6.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: bottomBorderColor,
            offset: Offset(0, bottomBorderSize),
            blurRadius: 0,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            offset: Offset(0, bottomBorderSize + 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
