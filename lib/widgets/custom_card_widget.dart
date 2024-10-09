import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget(
      {super.key, this.padding, this.color, required this.child, this.border});

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final double? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? GlobalColors.background,
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
