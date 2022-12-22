import 'package:flutter/material.dart';
import 'package:tutapp/ui/theme/color_theme.dart';

class TappableIcon extends StatelessWidget {
  const TappableIcon({
    super.key,
    required this.icon,
    this.color,
    this.onTap,
    this.size,
    this.contentPadding = EdgeInsets.zero,
    this.backgroundColor = Colors.transparent,
  });

  static const defaultColor = ColorTheme.orange;
  static const rippleOpacity = 0.1;

  final VoidCallback? onTap;
  final Color? color;
  final ImageProvider icon;
  final double? size;
  final EdgeInsets contentPadding;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final rippleColor = color?.withOpacity(rippleOpacity) ?? defaultColor.withOpacity(rippleOpacity);

    return ClipOval(
      child: Material(
        color: backgroundColor,
        elevation: 0,
        child: InkWell(
          onTap: onTap,
          splashColor: rippleColor,
          child: Padding(
            padding: contentPadding,
            child: ImageIcon(
              icon,
              color: color ?? defaultColor,
              size: size,
            ),
          ),
        ),
      ),
    );
  }
}
