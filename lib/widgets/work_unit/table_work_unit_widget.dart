import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/admin_provider.dart';
import 'package:aplikasi_kpri_desktop/providers/work_units_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
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
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Table(
                  columnWidths: const <int, TableColumnWidth>{
                    0: IntrinsicColumnWidth(),
                    1: IntrinsicColumnWidth(),
                    2: FlexColumnWidth(),
                    3: IntrinsicColumnWidth(),
                    4: IntrinsicColumnWidth(),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: <TableRow>[
                    TableRow(
                      decoration:
                          const BoxDecoration(color: GlobalColors.headerTable),
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: const Text(
                            "NO",
                            style: TextStyle(
                              color: GlobalColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: const Text(
                            "ID",
                            style: TextStyle(
                              color: GlobalColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: const Text(
                            "NAMA UNIT KERJA",
                            style: TextStyle(
                              color: GlobalColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: const Text(
                            "KODE",
                            style: TextStyle(
                              color: GlobalColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(9),
                            child: const Text(
                              "AKSI",
                              style: TextStyle(
                                color: GlobalColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    for (int i = 0; i < workUnits.length; i++)
                      TableRow(
                        decoration: BoxDecoration(
                          color: i.isEven ? Colors.grey.shade200 : Colors.white,
                        ),
                        children: <Widget>[
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(9),
                              child: Text(
                                "${i + 1}",
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(9),
                              child: Text(
                                workUnits[i]['id'].toString(),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(9),
                            child: Text(
                              workUnits[i]['nama'].toString(),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(9),
                            child: Text(
                              workUnits[i]['kode'].toString(),
                            ),
                          ),
                          Center(
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  child: IconButton(
                                    onPressed: () {
                                      ref
                                          .watch(idWorkUnitNotifierProvider
                                              .notifier)
                                          .setId(
                                            workUnits[i]['id'],
                                          );
                                      ref
                                          .watch(adminModeNotifierProvider
                                              .notifier)
                                          .switchToEditWorkUnit();
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      size: 18,
                                      color: GlobalColors.primary,
                                    ),
                                  ),
                                ),
                                DeleteWorkUnitWidget(
                                    id: workUnits[i]['id'].toString()),
                              ],
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
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
