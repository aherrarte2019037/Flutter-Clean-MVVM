import 'package:flutter/material.dart';
import 'package:tutapp/ui/theme/color_theme.dart';
import 'package:tutapp/ui/theme/font_theme.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
    this.errorText = '',
    this.obscureText = false,
    this.enabled = true,
    this.initialValue,
    this.keyboardType,
    this.onChanged,
    this.hintText,
    this.enableSuggestions,
    this.autoCorrect,
    this.controller,
  });

  const TextInput.secret({
    super.key,
    this.errorText = '',
    this.enabled = true,
    this.initialValue,
    this.keyboardType,
    this.onChanged,
    this.hintText,
    this.controller,
  })  : autoCorrect = false,
        enableSuggestions = false,
        obscureText = true;

  final String errorText;
  final String? initialValue;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool enabled;
  final bool obscureText;
  final bool? enableSuggestions;
  final bool? autoCorrect;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  bool get showError => errorText.isNotEmpty && enabled;

  InputBorder _inputBorder() {
    final errorColor = ColorTheme.red.shade300;
    final normalColor = ColorTheme.blackWhite.shade300;

    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: showError ? errorColor : normalColor,
        width: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const blackWhite = ColorTheme.blackWhite;
    final errorColor = ColorTheme.red.shade300;
    final inputBorder = _inputBorder();
    final fontStyle = FontTheme.title10.copyWith(
      color: blackWhite.shade700,
      fontWeight: FontWeight.w500,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onChanged: onChanged,
          controller: controller,
          decoration: InputDecoration(
            focusedBorder: inputBorder,
            enabledBorder: inputBorder,
            hintText: hintText,
            hintStyle: fontStyle.copyWith(
              color: blackWhite.shade500,
            ),
            filled: true,
            fillColor: ColorTheme.blackWhite.shade100,
            contentPadding: const EdgeInsets.all(20),
          ),
          initialValue: controller == null ? initialValue : null,
          keyboardType: keyboardType,
          enabled: enabled,
          obscureText: obscureText,
          style: fontStyle,
          cursorColor: blackWhite,
        ),
        if (showError)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              errorText,
              style: FontTheme.caption10.copyWith(
                color: errorColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
}
