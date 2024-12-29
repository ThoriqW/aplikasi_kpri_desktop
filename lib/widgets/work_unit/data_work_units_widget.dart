import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/work_unit/table_work_unit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataWorkUnitsWidget extends ConsumerWidget {
  const DataWorkUnitsWidget({super.key, required this.onEdit});

  final Function onEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomCardWidget(
      color: GlobalColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Unit Kerja",
            style: TextStyle(
              color: GlobalColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          TableWorkUnitWidget(
            onEdit: onEdit,
          )
        ],
      ),
    );
  }
}
