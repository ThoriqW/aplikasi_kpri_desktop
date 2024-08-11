import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.text, required this.onTap});

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Material(
        color: GlobalColors.primary,
        borderRadius: BorderRadius.circular(8.0),
        elevation: 4.0,
        child: InkWell(
          onTap: () => {onTap()},
          borderRadius: BorderRadius.circular(8.0),
          child: SizedBox(
            width: 140,
            height: 40,
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  color: GlobalColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
