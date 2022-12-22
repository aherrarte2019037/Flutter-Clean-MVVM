import 'package:flutter/material.dart';
import 'package:tutapp/ui/theme/color_theme.dart';
import 'package:tutapp/ui/theme/font_theme.dart';

class TappableText extends StatelessWidget {
  const TappableText(
    this.text, {
    super.key,
    this.textStyle,
    this.onTap,
  });

  static const defaultColor = ColorTheme.orange;

  final VoidCallback? onTap;
  final TextStyle? textStyle;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        elevation: 0,
        shape: const StadiumBorder(),
        foregroundColor: textStyle?.color ?? defaultColor,
      ),
      child: Text(
        text,
        style: textStyle ?? FontTheme.title10.copyWith(color: defaultColor),
      ),
    );
  }
}
