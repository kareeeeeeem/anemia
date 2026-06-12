import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AvatarCircle extends StatelessWidget {
  final double size;
  final Color? borderColor;
  final double borderWidth;
  final String? letter;
  final Color? backgroundColor;
  final List<Color>? gradientColors;

  const AvatarCircle({
    super.key,
    this.size = 54,
    this.borderColor,
    this.borderWidth = 2,
    this.letter,
    this.backgroundColor,
    this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    final colors = gradientColors ??
        [
          backgroundColor ?? AppColors.primary,
          backgroundColor ?? AppColors.primaryLight,
        ];

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: borderColor != null
            ? Border.all(color: borderColor!, width: borderWidth)
            : null,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
      ),
      child: letter != null
          ? Center(
              child: Text(
                letter!,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: size * 0.4,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
    );
  }
}
