import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class UnderMaintanance extends StatelessWidget {
  const UnderMaintanance({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 75.0, bottom: 30.0),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [Text("Halaman dalam tahap pengembangan")],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: HeaderWidget(),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomCardWidget(
            padding: EdgeInsets.all(6),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Aplikasi Koperasi By Bacreative",
                style: TextStyle(
                  color: GlobalColors.primary,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
