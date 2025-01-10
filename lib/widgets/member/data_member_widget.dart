import 'dart:async';

import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/member_provider.dart';
import 'package:aplikasi_kpri_desktop/providers/member_route_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/dropdown_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/member/table_member_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/work_unit/work_units_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataMemberWidget extends ConsumerStatefulWidget {
  const DataMemberWidget({super.key});

  @override
  ConsumerState<DataMemberWidget> createState() => _DataMemberWidgetState();
}

class _DataMemberWidgetState extends ConsumerState<DataMemberWidget> {
  String selectedUnit = '';
  String searchQuery = '';
  String selectedStatus = '';
  int currentPage = 1;
  int perPage = 15;
  Timer? _debounce;
  TextEditingController searchController = TextEditingController();
  List<String> status = ["Tidak Aktif", "Aktif"];

  Key dropdownStatusKey = UniqueKey();
  Key dropdownWorkUnitKey = UniqueKey();

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      color: GlobalColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Data Anggota Koperasi",
            style: TextStyle(
              color: GlobalColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  ref
                      .watch(memberModeNotifierProvider.notifier)
                      .switchToAddUser();
                },
                icon: const Icon(Icons.add),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        onChanged: (value) {
                          if (_debounce?.isActive ?? false) {
                            _debounce?.cancel();
                          }
                          _debounce =
                              Timer(const Duration(milliseconds: 500), () {
                            setState(() {
                              currentPage = 1;
                              searchQuery = value;
                            });
                          });
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Cari',
                          border: InputBorder.none,
                          filled: true,
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
                  const Text(
                    "Status",
                  ),
                  const SizedBox(width: 16),
                  DropdownWidget(
                    key: dropdownStatusKey,
                    items: status,
                    onSelected: (String value) => setState(() {
                      selectedStatus = value;
                    }),
                  ),
                ],
              ),
              const SizedBox(
                width: 24,
              ),
              Row(
                children: [
                  const Text(
                    "Unit Kerja",
                  ),
                  const SizedBox(width: 16),
                  WorkUnitsDropdown(
                    key: dropdownWorkUnitKey,
                    onSelected: (String value) => setState(() {
                      selectedUnit = value;
                    }),
                  ),
                ],
              ),
              const SizedBox(
                width: 24,
              ),
              ButtonWidget(
                text: "Hapus",
                onTap: () {
                  setState(() {
                    searchQuery = '';
                    selectedUnit = '';
                    selectedStatus = '';
                    searchController.clear();
                    dropdownStatusKey = UniqueKey();
                    dropdownWorkUnitKey = UniqueKey();
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          TableMemberWidget(
            selectedUnit: selectedUnit,
            searchQuery: searchQuery,
            status: selectedStatus,
            perPage: perPage,
            currentPage: currentPage,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  if (currentPage > 1) {
                    setState(() {
                      currentPage--;
                    });
                  }
                },
              ),
              const SizedBox(width: 6),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  if (currentPage <
                      ref
                          .watch(totalPageMemberProvider.notifier)
                          .getTotalMember()) {
                    setState(() {
                      currentPage++;
                    });
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
