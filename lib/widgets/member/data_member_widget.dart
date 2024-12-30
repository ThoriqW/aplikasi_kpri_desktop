import 'dart:async';

import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
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
  Timer? _debounce;
  TextEditingController searchController = TextEditingController();
  List<String> status = ["Tidak Aktif", "Aktif"];

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
                width: 24,
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
                              searchQuery = value;
                            });
                          });
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Cari Anggota',
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
                    "Pilih Status",
                  ),
                  const SizedBox(width: 16),
                  DropdownWidget(
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
                    "Pilih Unit Kerja",
                  ),
                  const SizedBox(width: 16),
                  WorkUnitsDropdown(
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
                    searchController.clear();
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
          )
        ],
      ),
    );
  }
}
