import 'dart:async';

import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/work_units_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/work_unit/table_work_unit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataWorkUnitsWidget extends ConsumerStatefulWidget {
  const DataWorkUnitsWidget({super.key, required this.onEdit});

  final Function onEdit;

  @override
  ConsumerState<DataWorkUnitsWidget> createState() =>
      _DataWorkUnitsWidgetState();
}

class _DataWorkUnitsWidgetState extends ConsumerState<DataWorkUnitsWidget> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';
  int currentPage = 1;
  int perPage = 5;
  Timer? _debounce;
  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      color: GlobalColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Unit Kerja",
            style: TextStyle(
              color: GlobalColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: searchController,
            onChanged: (value) {
              if (_debounce?.isActive ?? false) {
                _debounce?.cancel();
              }
              _debounce = Timer(const Duration(milliseconds: 500), () {
                setState(() {
                  searchQuery = value;
                });
              });
            },
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Cari Unit Kerja',
              border: InputBorder.none,
              filled: true,
            ),
          ),
          const SizedBox(height: 10),
          TableWorkUnitWidget(
            onEdit: widget.onEdit,
            searchQuery: searchQuery,
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
                          .watch(totalPageWorkUnitsProvider.notifier)
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
