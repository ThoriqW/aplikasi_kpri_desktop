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
  });

  final Function onEdit;
  final String searchQuery;

  @override
  ConsumerState<TableWorkUnitWidget> createState() =>
      _TableWorkUnitWidgetState();
}

class _TableWorkUnitWidgetState extends ConsumerState<TableWorkUnitWidget> {
  @override
  Widget build(BuildContext context) {
    final dataWorkUnits = ref.watch(
      getAllWorkUnitsProvider(widget.searchQuery),
    );
    return dataWorkUnits.when(
      data: (workUnit) {
        if (workUnit == null ||
            workUnit is! Map<String, dynamic> ||
            !workUnit.containsKey('data')) {
          return const Text("Data tidak valid");
        }
        final List<dynamic> savingsResponse = workUnit['data'];
        if (savingsResponse.isEmpty) {
          return Text(workUnit['message']);
        }
        List<dynamic> workUnits = savingsResponse;
        return Column(
          children: [
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
                        "No",
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(9),
                      child: const Text(
                        "ID",
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(9),
                      child: const Text(
                        "Nama Unit Kerja",
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(9),
                      child: const Text(
                        "Kode",
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "Aksi",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
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
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Text('Sebelumnya'),
                ),
                const Text(
                  'Halaman dari',
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Text('Selanjutnya'),
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
