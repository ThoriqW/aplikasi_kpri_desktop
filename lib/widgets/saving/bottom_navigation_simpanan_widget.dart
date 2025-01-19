import 'dart:async';

import 'package:aplikasi_kpri_desktop/providers/saving_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/work_unit/work_units_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavigationSimpananWidget extends ConsumerStatefulWidget {
  const BottomNavigationSimpananWidget({super.key});

  @override
  ConsumerState<BottomNavigationSimpananWidget> createState() =>
      _BottomNavigationSimpananWidgetState();
}

class _BottomNavigationSimpananWidgetState
    extends ConsumerState<BottomNavigationSimpananWidget> {
  TextEditingController tahunController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  Timer? _debounce;
  Key dropdownWorkUnitKey = UniqueKey();
  @override
  Widget build(BuildContext context) {
    tahunController.text = ref.watch(searchSavingsProvider)['tahun'].toString();
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Cari Anggota",
              ),
              const SizedBox(width: 12),
              Flexible(
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    if (_debounce?.isActive ?? false) {
                      _debounce?.cancel();
                    }
                    _debounce = Timer(const Duration(milliseconds: 500), () {
                      ref
                          .watch(searchSavingsProvider.notifier)
                          .setSearchSavings(currentPage: 1, searchQuery: value);
                    });
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    border: InputBorder.none,
                    filled: true,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Row(
            children: [
              const Text(
                "Unit Kerja",
              ),
              const SizedBox(width: 12),
              WorkUnitsDropdown(
                key: dropdownWorkUnitKey,
                onSelected: (String value) {
                  ref.watch(searchSavingsProvider.notifier).setSearchSavings(
                      currentPage: 1, workUnitId: int.parse(value));
                },
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Row(
          children: [
            const Text(
              "Tahun",
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 300,
              child: Row(
                children: [
                  Flexible(
                    child: TextFormWidget(
                        controller: tahunController, text: "Tahun"),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () async {
                ref.watch(searchSavingsProvider.notifier).setSearchSavings(
                      searchQuery: '',
                      workUnitId: 0,
                      tahun: int.parse(
                        tahunController.text,
                      ),
                    );
                searchController.clear();
                dropdownWorkUnitKey = UniqueKey();
              },
            ),
          ],
        ),
      ],
    );
  }
}
