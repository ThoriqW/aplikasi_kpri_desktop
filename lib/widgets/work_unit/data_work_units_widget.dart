import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/admin_provider.dart';
import 'package:aplikasi_kpri_desktop/providers/work_units_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/work_unit/search_work_units_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/work_unit/table_work_unit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataWorkUnitsWidget extends ConsumerWidget {
  const DataWorkUnitsWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchCriteriaWorkUnit = ref.watch(searchWorkUnitProvider);
    return SizedBox(
      height: 450,
      child: CustomCardWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    ref
                        .watch(adminModeNotifierProvider.notifier)
                        .switchToAddWorkUnit();
                  },
                  icon: const Icon(Icons.add),
                ),
                const SizedBox(width: 10),
                const Flexible(
                    child:
                        SizedBox(width: 500, child: SearchWorkUnitsWidget())),
              ],
            ),
            const SizedBox(height: 20),
            Flexible(
              child: TableWorkUnitWidget(
                searchQuery: searchCriteriaWorkUnit['searchQuery'],
                perPage: searchCriteriaWorkUnit['perPage'],
                currentPage: searchCriteriaWorkUnit['currentPage'],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
