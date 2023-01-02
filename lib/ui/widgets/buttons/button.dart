import 'package:flutter/material.dart';
import 'package:tutapp/ui/theme/color_theme.dart';
import 'package:tutapp/ui/theme/font_theme.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onTap,
    required this.label,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius = _defaultBorderRadius,
    this.labelStyle,
    this.size = const ButtonSize.normal(),
  });

  static const _defaultBorderRadius = 16.0;
  static const _defaultFontSize = 18.0;

  final VoidCallback onTap;
  final String label;
  final TextStyle? labelStyle;
  final Color? backgroundColor;
  final double borderRadius;
  final ButtonSize size;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final whiteColor = ColorTheme.blackWhite.shade100;

    return Container(
      constraints: size.value,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          elevation: 0,
          foregroundColor: foregroundColor ?? whiteColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_defaultBorderRadius),
          ),
          backgroundColor: backgroundColor ?? ColorTheme.orange,
        ),
        child: Text(
          label,
          style: labelStyle ??
              FontTheme.body10.copyWith(
                color: whiteColor,
                fontWeight: FontWeight.w500,
                fontSize: _defaultFontSize,
              ),
        ),
      ),
    );
  }
}

class ButtonSize {
  const ButtonSize(this.value);

  const ButtonSize.expandWidth()
      : value = const BoxConstraints(
          minWidth: double.infinity,
        );

  const ButtonSize.expand()
      : value = const BoxConstraints(
          minWidth: double.infinity,
          minHeight: double.infinity,
        );

  ButtonSize.fixed({
    double height = 0,
    double width = 0,
  }) : value = BoxConstraints(
          minWidth: width,
          minHeight: height,
        );

  const ButtonSize.normal() : value = null;

  final BoxConstraints? value;
}
