import 'dart:async';

import 'package:aplikasi_kpri_desktop/providers/bills_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/dropdown_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/work_unit/work_units_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavigationTagihanWidget extends ConsumerStatefulWidget {
  const BottomNavigationTagihanWidget({super.key});

  @override
  ConsumerState<BottomNavigationTagihanWidget> createState() =>
      _BottomNavigationTagihanWidgetState();
}

class _BottomNavigationTagihanWidgetState
    extends ConsumerState<BottomNavigationTagihanWidget> {
  TextEditingController tahunController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  Timer? _debounce;
  Key dropdownWorkUnitKey = UniqueKey();

  List<String> bulan = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];

  @override
  Widget build(BuildContext context) {
    tahunController.text = ref.watch(searchBillsProvider)['tahun'].toString();
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Cari Anggota",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
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
                          .watch(searchBillsProvider.notifier)
                          .setSearchBills(currentPage: 1, searchQuery: value);
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.surface,
                        width: 1.0,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2.0,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
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
              Text(
                "Unit Kerja",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 12),
              WorkUnitsDropdown(
                key: dropdownWorkUnitKey,
                onSelected: (String value) {
                  ref.watch(searchBillsProvider.notifier).setSearchBills(
                      currentPage: 1, workUnitId: int.parse(value));
                },
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Row(
          children: [
            Text(
              "Bulan",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 12),
            DropdownWidget(
                currentDropDownName:
                    bulan[ref.watch(searchBillsProvider)['bulan'] - 1],
                items: bulan,
                onSelected: (value) {
                  ref.watch(searchBillsProvider.notifier).setSearchBills(
                        bulan: bulan.indexOf(value) + 1,
                        currentPage: 1,
                      );
                }),
          ],
        ),
        const SizedBox(width: 20),
        Row(
          children: [
            Text(
              "Tahun",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 110,
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
                ref.watch(searchBillsProvider.notifier).setSearchBills(
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
