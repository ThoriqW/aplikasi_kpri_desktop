import 'dart:async';

import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/work_unit/work_units_dropdown.dart';
import 'package:flutter/material.dart';

class DataTagihanWidget extends StatefulWidget {
  const DataTagihanWidget({super.key});

  @override
  State<DataTagihanWidget> createState() => _DataTagihanWidgetState();
}

class _DataTagihanWidgetState extends State<DataTagihanWidget> {
  TextEditingController tahunController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  int selectedYear = DateTime.now().year;
  String searchQuery = '';
  String selectedUnit = '';
  int currentPage = 1;
  Timer? _debounce;

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
            "Tagihan Anggota",
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
                              currentPage = 1;
                              searchQuery = value;
                            });
                          });
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                          hintText: 'Cari ',
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
                      currentPage = 1;
                      selectedUnit = value;
                    }),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
