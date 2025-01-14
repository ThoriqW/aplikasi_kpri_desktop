import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget(
      {super.key,
      this.padding,
      this.color,
      required this.child,
      this.border,
      this.gradient = false});

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final double? border;
  final bool gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? GlobalColors.background,
        gradient: gradient
            ? const LinearGradient(
                colors: [Color(0xFF093637), Color(0xFF44A08D)],
                begin: Alignment.centerLeft,
                end: Alignment.topRight)
            : null,
        border: Border(
          bottom: BorderSide(
            color: GlobalColors.background,
            width: border ?? 0,
          ),
        ),
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(12.0),
        child: child,
      ),
    );
  }
}
