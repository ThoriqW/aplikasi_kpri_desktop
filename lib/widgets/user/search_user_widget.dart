import 'dart:async';

import 'package:aplikasi_kpri_desktop/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchUserWidget extends ConsumerStatefulWidget {
  const SearchUserWidget({super.key});

  @override
  ConsumerState<SearchUserWidget> createState() => _SearchUserWidgetState();
}

class _SearchUserWidgetState extends ConsumerState<SearchUserWidget> {
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
            ref.watch(searchUsersProvider.notifier).setSearchUsers(
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
