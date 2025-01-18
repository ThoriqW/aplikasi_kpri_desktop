import 'dart:async';

import 'package:aplikasi_kpri_desktop/providers/work_units_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchWorkUnitsWidget extends ConsumerStatefulWidget {
  const SearchWorkUnitsWidget({super.key});

  @override
  ConsumerState<SearchWorkUnitsWidget> createState() =>
      _SearchWorkUnitsWidgetState();
}

class _SearchWorkUnitsWidgetState extends ConsumerState<SearchWorkUnitsWidget> {
  TextEditingController searchController = TextEditingController();
  Timer? _debounce;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onChanged: (value) {
        if (_debounce?.isActive ?? false) {
          _debounce?.cancel();
        }
        _debounce = Timer(
          const Duration(milliseconds: 500),
          () {
            ref.watch(searchWorkUnitProvider.notifier).setSearchWorkUnit(
                  searchQuery: value,
                  currentPage: 1,
                );
          },
        );
      },
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: '',
        border: InputBorder.none,
        filled: true,
      ),
    );
  }
}
