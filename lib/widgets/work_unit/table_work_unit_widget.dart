import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/admin_provider.dart';
import 'package:aplikasi_kpri_desktop/providers/work_units_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/cutom_table_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/work_unit/delete_work_unit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TableWorkUnitWidget extends ConsumerWidget {
  const TableWorkUnitWidget({
    super.key,
    required this.searchQuery,
    required this.perPage,
    required this.currentPage,
  });

  final String searchQuery;
  final int perPage;
  final int currentPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataWorkUnits = ref.watch(
      getAllWorkUnitsProvider(
        searchQuery,
        perPage,
        currentPage,
      ),
    );
    return dataWorkUnits.when(
      data: (workUnit) {
        if (workUnit == null) {
          return const Text("Data tidak valid");
        }
        if (workUnit is ErrorResponse || workUnit is! Map<String, dynamic>) {
          return Text(workUnit.toString());
        }
        final List<dynamic> workUnitResponse = workUnit['data'];
        int totalPage = workUnit['pagination']['last_page'];
        int currentPage = workUnit['pagination']['current_page'];
        int totalMember = workUnit['pagination']['total'];

        List<dynamic> workUnits = workUnitResponse;

        final rowsCells = workUnits
            .map((entry) => [
                  entry["id"],
                  entry["kode"],
                  ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          child: IconButton(
                            onPressed: () {
                              ref
                                  .watch(idWorkUnitNotifierProvider.notifier)
                                  .setId(entry['id']);
                              ref
                                  .watch(
                                    adminModeNotifierProvider.notifier,
                                  )
                                  .switchToEditWorkUnit();
                            },
                            icon: const Icon(
                              Icons.edit,
                              size: 18,
                              color: GlobalColors.primary,
                            ),
                          ),
                        ),
                        DeleteWorkUnitWidget(id: entry['id'].toString())
                      ],
                    ),
                  ],
                ])
            .toList();

        final fixedColCells =
            workUnits.map((entry) => entry["nama"].toString()).toList();

        final fixedRowCells = [
          "ID",
          "KODE",
          'AKSI',
        ];

        Future.microtask(() {
          ref
              .watch(totalPageWorkUnitsProvider.notifier)
              .setTotalMember(workUnit['pagination']['last_page']);
        });
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Halaman $currentPage dari $totalPage',
                ),
                Text(
                  'Total data $totalMember',
                ),
              ],
            ),
            Flexible(
              child: CustomDataTable(
                rowsCells: rowsCells,
                cellHeight: 40,
                fixedColCells: fixedColCells,
                fixedRowCells: fixedRowCells,
                cellWidth: 320,
                cellBuilder: (data) {
                  if (data is Widget) {
                    return data;
                  }
                  return Text('$data');
                },
                headerBuilder: (data) {
                  if (data is Widget) {
                    return data;
                  }
                  if (data == 'STATUS' || data == 'AKSI') {
                    return Center(
                      child: Text(
                        data,
                        style: const TextStyle(
                          color: GlobalColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }
                  return Text(
                    '$data',
                    style: const TextStyle(
                      color: GlobalColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
                fixedCornerCell: "NAMA UNIT KERJA",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: currentPage > 1
                      ? () {
                          ref
                              .watch(searchWorkUnitProvider.notifier)
                              .setSearchWorkUnit(currentPage: currentPage - 1);
                        }
                      : null,
                ),
                const SizedBox(width: 6),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: currentPage < ref.watch(totalPageWorkUnitsProvider)
                      ? () {
                          ref
                              .watch(searchWorkUnitProvider.notifier)
                              .setSearchWorkUnit(currentPage: currentPage + 1);
                        }
                      : null,
                ),
              ],
            ),
          ],
        );
      },
      error: (error, stackTrace) => const Text('Gagal terhubung ke server!!'),
      loading: () => const LinearProgressIndicator(),
    );
  }
}
