import 'package:flutter/material.dart';
import 'package:tutapp/ui/theme/color_theme.dart';
import 'package:tutapp/ui/theme/font_theme.dart';

class TappableText extends StatelessWidget {
  const TappableText(
    this.text, {
    super.key,
    this.textStyle,
    this.onTap,
    this.contentPadding = EdgeInsets.zero,
    this.backgroundColor = Colors.transparent,
  });

  static const defaultColor = ColorTheme.orange;
  static const rippleOpacity = 0.1;

  final VoidCallback? onTap;
  final TextStyle? textStyle;
  final String text;
  final EdgeInsets contentPadding;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final rippleColor = textStyle?.color?.withOpacity(rippleOpacity) ?? defaultColor.withOpacity(rippleOpacity);

    return Material(
      elevation: 0,
      color: Colors.transparent,
      child: InkWell(
        customBorder: const StadiumBorder(),
        onTap: onTap,
        splashColor: rippleColor,
        highlightColor: rippleColor,
        child: Padding(
          padding: contentPadding,
          child: Text(
            text,
            style: textStyle ?? FontTheme.title10.copyWith(color: defaultColor),
          ),
        ),
      ),
    );
  }
}
