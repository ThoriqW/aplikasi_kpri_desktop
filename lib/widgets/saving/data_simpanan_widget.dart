import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/saving_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/saving/table_simpanan_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataSimpananWidget extends ConsumerWidget {
  const DataSimpananWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchCriteriaBills = ref.watch(searchSavingsProvider);
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
          const SizedBox(height: 20),
          Column(
            children: [
              TableSimpananWidget(
                tahun: searchCriteriaBills['tahun'],
                workUnitId: searchCriteriaBills['workUnitId'],
                searchQuery: searchCriteriaBills['searchQuery'],
                perPage: searchCriteriaBills['perPage'],
                currentPage: searchCriteriaBills['currentPage'],
              ),
              // const SizedBox(height: 10),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     IconButton(
              //       icon: const Icon(Icons.arrow_back),
              //       onPressed: () {
              //         if (currentPage > 1) {
              //           setState(() {
              //             currentPage--;
              //           });
              //         }
              //       },
              //     ),
              //     const SizedBox(width: 6),
              //     IconButton(
              //       icon: const Icon(Icons.arrow_forward),
              //       onPressed: () {
              //         if (currentPage <
              //             ref
              //                 .watch(totalPageSavingsProvider.notifier)
              //                 .getTotalMember()) {
              //           setState(() {
              //             currentPage++;
              //           });
              //         }
              //       },
              //     ),
              //   ],
              // ),
            ],
          )
        ],
      ),
    );
  }
}
