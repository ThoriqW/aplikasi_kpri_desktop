import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/saving_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/saving/delete_simpanan_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/saving/update_year_simpanan_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditDataSimpanan extends ConsumerStatefulWidget {
  const EditDataSimpanan({super.key});

  @override
  ConsumerState<EditDataSimpanan> createState() => _EditDataSimpananState();
}

class _EditDataSimpananState extends ConsumerState<EditDataSimpanan> {
  String tahun = '';
  @override
  Widget build(BuildContext context) {
    tahun = ref
        .watch(tahunMemberSavingsNotifierProvider.notifier)
        .getTahunSimpanan()
        .toString();
    return CustomCardWidget(
      color: GlobalColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              ref
                  .watch(
                    savingModeNotifierProvider.notifier,
                  )
                  .switchToView();
            },
          ),
          const SizedBox(height: 20),
          Text(
            "Simpanan Tahun $tahun",
            style: const TextStyle(
              color: GlobalColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          UpdateYearSimpanan(tahun: tahun),
          const SizedBox(height: 20),
          DeleteSimpananWidget(tahun: tahun),
        ],
      ),
    );
  }
}
