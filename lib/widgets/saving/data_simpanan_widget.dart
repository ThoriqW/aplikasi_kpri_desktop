import 'dart:async';

import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/saving_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/saving/table_simpanan_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/work_unit/work_units_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataSimpananWidget extends ConsumerStatefulWidget {
  const DataSimpananWidget({super.key});

  @override
  ConsumerState<DataSimpananWidget> createState() => _DataSimpananWidgetState();
}

class _DataSimpananWidgetState extends ConsumerState<DataSimpananWidget> {
  final TextEditingController tahunController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';
  String selectedUnit = '';
  int selectedYear = DateTime.now().year;
  Timer? _debounce;

  late Widget pilihWorkUnit = const Text(
    "Silahkan pilih unit kerja",
    style: TextStyle(
      fontStyle: FontStyle.italic,
    ),
  );

  @override
  void initState() {
    super.initState();
    tahunController.text = selectedYear.toString();
  }

  @override
  void dispose() {
    tahunController.dispose();
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
            "Simpanan Anggota",
            style: TextStyle(
              color: GlobalColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
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
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                          hintText: 'Cari Anggota',
                          border: InputBorder.none,
                          filled: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Row(
                children: [
                  const Text(
                    "Unit Kerja",
                  ),
                  const SizedBox(width: 12),
                  WorkUnitsDropdown(
                    onSelected: (String value) => setState(() {
                      selectedUnit = value;
                    }),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Row(
                children: [
                  const Text(
                    "Tahun Simpanan",
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
                      if (selectedUnit != '') {
                        setState(
                          () {
                            ref.invalidate(
                              getAllSavingMembersProvider(tahunController.text,
                                  int.parse(selectedUnit), searchQuery),
                            );
                          },
                        );
                      } else {
                        await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const CustomAlertDialog(
                              alertDesc:
                                  "Silahkan pilih unit kerja terlebih dahulu",
                              alertTitle: "Info",
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          selectedUnit != ''
              ? TableSimpananWidget(
                  tahun: tahunController.text,
                  workUnitId: int.parse(selectedUnit),
                  searchQuery: searchQuery,
                )
              : pilihWorkUnit
        ],
      ),
    );
  }
}
