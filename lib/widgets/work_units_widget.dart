import 'package:aplikasi_kpri_desktop/providers/work_units_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkUnitsDropdown extends ConsumerStatefulWidget {
  const WorkUnitsDropdown({super.key});

  @override
  ConsumerState<WorkUnitsDropdown> createState() => _WorkUnitsDropdownState();
}

class _WorkUnitsDropdownState extends ConsumerState<WorkUnitsDropdown> {
  int? selectedUnitId;

  @override
  Widget build(BuildContext context) {
    final workUnitsAsync = ref.watch(getAllWorkUnitsProvider);

    return workUnitsAsync.when(
      data: (workUnits) {
        workUnits.data.map((e) => print(e.id));
        return const SizedBox.shrink();
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}
