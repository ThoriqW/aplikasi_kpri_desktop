import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/work_units_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkUnitsDropdown extends ConsumerStatefulWidget {
  const WorkUnitsDropdown({
    super.key,
    required this.onSelected,
    this.currentDropDownName,
    this.resetKey,
  });
  final Function(String) onSelected;
  final String? currentDropDownName;
  final Key? resetKey;

  @override
  ConsumerState<WorkUnitsDropdown> createState() => _WorkUnitsDropdownState();
}

class _WorkUnitsDropdownState extends ConsumerState<WorkUnitsDropdown> {
  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.currentDropDownName;
  }

  @override
  void didUpdateWidget(covariant WorkUnitsDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.resetKey != oldWidget.resetKey) {
      setState(() {
        dropdownValue = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final getAllWorkUnits = ref.watch(getAllWorkUnitsProvider('', 0, 0));

    return getAllWorkUnits.when(
      data: (workUnit) {
        if (workUnit == null ||
            workUnit is! Map<String, dynamic> ||
            !workUnit.containsKey('data')) {
          return const Text("Data tidak valid");
        }
        final List<dynamic> savingsResponse = workUnit['data'];
        if (savingsResponse.isEmpty) {
          return Text(workUnit['message']);
        }
        List<dynamic> workUnits = savingsResponse;
        return DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          underline: Container(
            height: 2,
            color: GlobalColors.onBackground,
          ),
          onChanged: (String? value) {
            setState(() {
              dropdownValue = value;
            });
            widget.onSelected(dropdownValue!);
          },
          items: workUnits.map<DropdownMenuItem<String>>((workUnit) {
            return DropdownMenuItem<String>(
              value: workUnit['id'].toString(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(workUnit['nama']),
              ),
            );
          }).toList(),
          menuMaxHeight: 200.0,
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, _) => const Text('Gagal terhubung ke server!!'),
    );
  }
}
