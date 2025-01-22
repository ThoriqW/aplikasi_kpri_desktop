import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    super.key,
    required this.controller,
    required this.text,
    this.isEnabled = true,
    this.icons,
    this.isPassword = false,
    this.isIconActive = false,
  });

  final TextEditingController controller;
  final String text;
  final bool isEnabled;
  final IconData? icons;
  final bool isPassword;
  final bool isIconActive;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      obscureText: isPassword ? true : false,
      enabled: isEnabled,
      decoration: InputDecoration(
        filled: true,
        hintText: text,
        prefixIcon: isIconActive && icons != null
            ? Icon(
                icons,
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        fillColor: Theme.of(context).colorScheme.surface,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.surface,
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
