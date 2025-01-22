import 'dart:async';

import 'package:aplikasi_kpri_desktop/providers/member_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/dropdown_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/work_unit/work_units_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavigationMemberWidget extends ConsumerStatefulWidget {
  const BottomNavigationMemberWidget({super.key});

  @override
  ConsumerState<BottomNavigationMemberWidget> createState() =>
      _BottomNavigationMemberWidgetState();
}

class _BottomNavigationMemberWidgetState
    extends ConsumerState<BottomNavigationMemberWidget> {
  TextEditingController searchController = TextEditingController();
  Timer? _debounce;
  Key dropdownStatusKey = UniqueKey();
  Key dropdownWorkUnitKey = UniqueKey();
  List<String> status = ["Tidak Aktif", "Aktif"];
  List<int> limitData = [
    10,
    25,
    50,
    100,
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            ref.watch(memberModeNotifierProvider.notifier).switchToAddUser();
          },
          icon: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
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
              Expanded(
                child: TextFormField(
                  controller: searchController,
                  onChanged: (value) {
                    if (_debounce?.isActive ?? false) {
                      _debounce?.cancel();
                    }
                    _debounce = Timer(const Duration(milliseconds: 500), () {
                      ref
                          .watch(searchMemberProvider.notifier)
                          .setSearchMember(currentPage: 1, searchQuery: value);
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
        const SizedBox(
          width: 24,
        ),
        Row(
          children: [
            Text(
              "Status",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 16),
            DropdownWidget(
                key: dropdownStatusKey,
                items: status,
                onSelected: (String value) {
                  ref.watch(searchMemberProvider.notifier).setSearchMember(
                      status: status.indexOf(value).toString());
                }),
          ],
        ),
        const SizedBox(
          width: 24,
        ),
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
              const SizedBox(width: 16),
              WorkUnitsDropdown(
                  key: dropdownWorkUnitKey,
                  onSelected: (String value) {
                    ref.watch(searchMemberProvider.notifier).setSearchMember(
                          workUnitId: int.parse(value),
                          currentPage: 1,
                        );
                  }),
            ],
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        ButtonWidget(
          text: "Clear",
          onTap: () async {
            ref.watch(searchMemberProvider.notifier).setSearchMember(
                  searchQuery: '',
                  workUnitId: 0,
                  status: '',
                  currentPage: 1,
                );
            setState(() {
              searchController.clear();
              dropdownStatusKey = UniqueKey();
              dropdownWorkUnitKey = UniqueKey();
            });
          },
        ),
      ],
    );
  }
}
