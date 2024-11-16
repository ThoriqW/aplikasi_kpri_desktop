import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/work_units_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkUnitsDropdown extends ConsumerStatefulWidget {
  const WorkUnitsDropdown(
      {super.key, required this.onSelected, this.onSelectedNameUnit});
  final Function(String) onSelected;
  final Function(String)? onSelectedNameUnit;

  @override
  ConsumerState<WorkUnitsDropdown> createState() => _WorkUnitsDropdownState();
}

class _WorkUnitsDropdownState extends ConsumerState<WorkUnitsDropdown> {
  String? dropdownValue;
  String? selectedUnitName;

  @override
  Widget build(BuildContext context) {
    final getAllWorkUnits = ref.watch(getAllWorkUnitsProvider);
    return getAllWorkUnits.when(
      data: (workUnits) {
        return DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w600,
          ),
          underline: Container(
            height: 2,
            color: GlobalColors.onBackground,
          ),
          onChanged: (String? value) {
            setState(() {
              dropdownValue = value;
              selectedUnitName = workUnits.data
                  .firstWhere((workUnit) => workUnit.id.toString() == value)
                  .name;
            });
            widget.onSelectedNameUnit?.call(selectedUnitName!);
            widget.onSelected(dropdownValue!);
          },
          items: workUnits.data.map<DropdownMenuItem<String>>((workUnit) {
            return DropdownMenuItem<String>(
              value: workUnit.id.toString(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(workUnit.name),
              ),
            );
          }).toList(),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, _) => Text('Error: $error'),
    );
  }
}
