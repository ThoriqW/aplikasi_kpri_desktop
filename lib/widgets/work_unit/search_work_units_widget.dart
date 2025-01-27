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
    );
  }
}
