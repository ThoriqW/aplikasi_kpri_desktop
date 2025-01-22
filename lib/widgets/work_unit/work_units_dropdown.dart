import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/work_units_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
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
    final getAllWorkUnits = ref.watch(getDropDownWorkUnitProvider);

    return getAllWorkUnits.when(
      data: (workUnit) {
        if (workUnit == null ||
            workUnit is! Map<String, dynamic> ||
            !workUnit.containsKey('data')) {
          return const Text("Data tidak valid");
        }

        final List<dynamic> workUnitsDropdown = workUnit['data'];

        return Expanded(
          child: DropdownSearch<String>(
            selectedItem: dropdownValue,
            items: (filter, infiniteScrollProps) => workUnitsDropdown
                .map<String>((entry) => '${entry['id']}   ${entry['nama']}')
                .toList(),
            decoratorProps: DropDownDecoratorProps(
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.surface, width: 1.0),
                ),
              ),
            ),
            popupProps: const PopupProps.menu(
              fit: FlexFit.loose,
              constraints: BoxConstraints(
                maxHeight: 300,
              ),
              showSearchBox: true,
            ),
            onChanged: (String? value) {
              if (value != null) {
                final idAndName = value.split(RegExp(r'\s+'));
                final selectedId = idAndName.isNotEmpty ? idAndName[0] : null;

                setState(() {
                  dropdownValue = value;
                });
                widget.onSelected(selectedId!);
              }
            },
          ),
        );
      },
      loading: () => const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          color: GlobalColors.primary,
        ),
      ),
      error: (error, _) => const Text('Gagal terhubung ke server!!'),
    );
  }
}
