import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/member_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/member/table_member_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataMemberWidget extends ConsumerWidget {
  const DataMemberWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchCriteriaMember = ref.watch(searchMemberProvider);
    return CustomCardWidget(
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
          Flexible(
            child: TableMemberWidget(
              status: searchCriteriaMember['status'],
              selectedUnit: searchCriteriaMember['workUnitId'],
              searchQuery: searchCriteriaMember['searchQuery'],
              perPage: searchCriteriaMember['perPage'],
              currentPage: searchCriteriaMember['currentPage'],
            ),
          ),
        ],
      ),
    );
  }
}
