import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/bills_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/tagihan/table_tagihan_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataTagihanWidget extends ConsumerWidget {
  const DataTagihanWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchCriteriaBills = ref.watch(searchBillsProvider);
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
          const SizedBox(height: 30),
          TableTagihanWidget(
            tahun: searchCriteriaBills['tahun'],
            bulan: searchCriteriaBills['bulan'],
            workUnitId: searchCriteriaBills['workUnitId'],
            searchQuery: searchCriteriaBills['searchQuery'],
            perPage: searchCriteriaBills['perPage'],
            currentPage: searchCriteriaBills['currentPage'],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
