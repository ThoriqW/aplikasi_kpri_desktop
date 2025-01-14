import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';

class DataTagihanWidget extends StatefulWidget {
  const DataTagihanWidget({super.key});

  @override
  State<DataTagihanWidget> createState() => _DataTagihanWidgetState();
}

class _DataTagihanWidgetState extends State<DataTagihanWidget> {
  @override
  Widget build(BuildContext context) {
    return const CustomCardWidget(
      color: GlobalColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tagihan Anggota",
            style: TextStyle(
              color: GlobalColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
