import 'package:blog_viewer/utils/colors.dart';
import 'package:flutter/material.dart';

class BaseInput extends StatelessWidget {
  const BaseInput({
    super.key,
    this.validator,
    this.label,
    this.isPassword,
    this.onSaved,
  });

  final String? Function(String?)? validator;
  final String? label;
  final bool? isPassword;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: validator,
      cursorColor: Colors.white,
      obscureText: isPassword ?? false,
      style: const TextStyle(
        color: SecondaryColor,
      ),
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(
            50,
          ),
        ),
        hintText: label,
        hintStyle: const TextStyle(
          color: SecondaryColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: SecondaryColor,
          ),
          borderRadius: BorderRadius.circular(
            50,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: SecondaryColor,
          ),
          borderRadius: BorderRadius.circular(
            50,
          ),
        ),
      ),
    );
  }
}
