import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget(
      {super.key,
      required this.controller,
      required this.text,
      this.isEnabled = true});

  final TextEditingController controller;
  final String text;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      obscureText: text == "Password" ? true : false,
      enabled: isEnabled,
      decoration: InputDecoration(
        filled: false,
        hintText: text,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: GlobalColors.primary,
            width: 2.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
      ),
    );
  }
}
