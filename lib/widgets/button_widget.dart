import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.backgroundColor,
    this.width,
    this.height,
  });

  final String text;
  final Function onTap;
  final Color? backgroundColor;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Material(
        color: backgroundColor ?? GlobalColors.primary,
        elevation: 4.0,
        child: InkWell(
          onTap: () => {onTap()},
          borderRadius: BorderRadius.circular(8.0),
          child: SizedBox(
            width: width ?? 140,
            height: height ?? 40,
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
