import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/admin_route_provider.dart';
import 'package:aplikasi_kpri_desktop/providers/work_units_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TableWorkUnitWidget extends ConsumerStatefulWidget {
  const TableWorkUnitWidget({
    super.key,
    required this.onEdit,
    required this.searchQuery,
    required this.perPage,
    required this.currentPage,
  });

  final Function onEdit;
  final String searchQuery;
  final int perPage;
  final int currentPage;

  @override
  ConsumerState<TableWorkUnitWidget> createState() =>
      _TableWorkUnitWidgetState();
}

class _TableWorkUnitWidgetState extends ConsumerState<TableWorkUnitWidget> {
  @override
  Widget build(BuildContext context) {
    final dataWorkUnits = ref.watch(
      getAllWorkUnitsProvider(
        widget.searchQuery,
        widget.perPage,
        widget.currentPage,
      ),
    );
    return dataWorkUnits.when(
      data: (workUnit) {
        if (workUnit == null ||
            workUnit is! Map<String, dynamic> ||
            !workUnit.containsKey('data')) {
          return const Text("Data tidak valid");
        }
        final List<dynamic> workUnitResponse = workUnit['data'];
        if (workUnitResponse.isEmpty) {
          return Text(workUnit['message']);
        }
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
            Table(
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
                      const BoxDecoration(color: GlobalColors.secondary),
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(9),
                      child: const Text(
                        "NO",
                        style: TextStyle(
                          color: GlobalColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(9),
                      child: const Text(
                        "ID",
                        style: TextStyle(
                          color: GlobalColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(9),
                      child: const Text(
                        "NAMA UNIT KERJA",
                        style: TextStyle(
                          color: GlobalColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(9),
                      child: const Text(
                        "KODE",
                        style: TextStyle(
                          color: GlobalColors.primary,
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
                            color: GlobalColors.primary,
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
                                      .watch(
                                          idWorkUnitNotifierProvider.notifier)
                                      .setId(
                                        workUnits[i]['id'],
                                      );
                                  widget.onEdit();
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  size: 18,
                                  color: GlobalColors.primary,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(2),
                              child: IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Info"),
                                        content: const Text(
                                          "Yakin hapus work unit?",
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                              context,
                                              'Cancel',
                                            ),
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              _deleteWorkUnit(workUnits[i]['id']
                                                  .toString());
                                            },
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  size: 18,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        );
      },
      error: (error, stackTrace) =>
          const Text('Oops, something unexpected happened'),
      loading: () => const LinearProgressIndicator(),
    );
  }

  Future<void> _deleteWorkUnit(String id) async {
    try {
      final deleteMember = await ref.watch(
        deleteWorkUnitProvider(id).future,
      );
      if (!mounted) return;
      Navigator.pop(context, 'OK');
      if (deleteMember is SuccessResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: deleteMember.message,
              alertTitle: "Sukses",
            );
          },
        );
        ref.invalidate(getAllWorkUnitsProvider);
      } else if (deleteMember is ErrorResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: deleteMember.errors,
              alertTitle: "Gagal",
            );
          },
        );
      }
    } catch (e) {
      if (!mounted) return;
      Navigator.pop(context, 'OK');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDialog(
            alertDesc: e.toString().substring(11),
            alertTitle: "Gagal",
          );
        },
      );
    }
  }
}
