import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';

class UpdateYearSimpanan extends StatefulWidget {
  const UpdateYearSimpanan({super.key});

  @override
  State<UpdateYearSimpanan> createState() => _UpdateYearSimpananState();
}

class _UpdateYearSimpananState extends State<UpdateYearSimpanan> {
  final TextEditingController tahunControllerController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Update Tahun Simpanan",
          style: TextStyle(
            color: GlobalColors.onBackground,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextFormWidget(
                  controller: tahunControllerController, text: ""),
            ),
            const SizedBox(width: 8),
            ButtonWidget(
              text: "Ganti",
              onTap: () async {},
            ),
          ],
        ),
      ],
    );
  }
}
