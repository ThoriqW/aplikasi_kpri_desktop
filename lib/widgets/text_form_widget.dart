import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget(
      {super.key, required this.controller, required this.text});

  final TextEditingController controller;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        filled: false,
        hintText: text,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: GlobalColors.background,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: GlobalColors.primary,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
