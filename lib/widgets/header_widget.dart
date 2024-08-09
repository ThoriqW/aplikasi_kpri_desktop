import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: GlobalColors.header,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: GlobalColors.primary,
            width: 2.0,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 5,
        ),
        hintText: "Cari",
        prefixIcon: Icon(
          Icons.search,
          color: GlobalColors.onBackground,
          size: 21,
        ),
      ),
    );
  }
}
