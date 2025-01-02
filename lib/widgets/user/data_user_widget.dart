import 'dart:async';

import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/user/table_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataUserWidget extends ConsumerStatefulWidget {
  const DataUserWidget({super.key, required this.onEdit});
  final Function onEdit;

  @override
  ConsumerState<DataUserWidget> createState() => _DataUserWidgetState();
}

class _DataUserWidgetState extends ConsumerState<DataUserWidget> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';
  Timer? _debounce;
  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
        color: GlobalColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "User",
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
                hintText: 'Cari User',
                border: InputBorder.none,
                filled: true,
              ),
            ),
            const SizedBox(height: 10),
            TableUserWidget(
              onEdit: widget.onEdit,
              searchQuery: searchQuery,
            ),
          ],
        ));
  }
}
