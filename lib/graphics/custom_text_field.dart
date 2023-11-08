import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.prefix,
    this.hintText,
    this.hintStyle,
    this.textStyle,
    this.onChanged,
    this.textEditingController,
    this.suffix,
    this.readOnly = false,
    this.prefixIcon,
  });

  final Widget? prefix;
  final Widget? suffix;
  final Widget? prefixIcon;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final bool readOnly;
  final void Function(String)? onChanged;
  final TextEditingController? textEditingController;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: textEditingController,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: prefixIcon,
        prefix: prefix,
        suffix: suffix,
        hintText: hintText,
      ),
    );
  }
}
