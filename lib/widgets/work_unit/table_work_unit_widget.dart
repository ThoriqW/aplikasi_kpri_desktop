import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/admin_route_provider.dart';
import 'package:aplikasi_kpri_desktop/providers/work_units_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TableWorkUnitWidget extends ConsumerStatefulWidget {
  const TableWorkUnitWidget({super.key, required this.onEdit});

  final Function onEdit;

  @override
  ConsumerState<TableWorkUnitWidget> createState() =>
      _TableWorkUnitWidgetState();
}

class _TableWorkUnitWidgetState extends ConsumerState<TableWorkUnitWidget> {
  int currentPage = 0;
  final int rowsPerPage = 5;
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';
  @override
  Widget build(BuildContext context) {
    final dataWorkUnits = ref.watch(getAllWorkUnitsProvider);
    return dataWorkUnits.when(
      data: (workUnit) {
        List<dynamic> workUnits = workUnit as List<dynamic>;
        if (searchQuery.isNotEmpty) {
          workUnits = workUnits.where((m) {
            final nama = m['nama'].toString().toLowerCase();
            return nama.contains(searchQuery.toLowerCase());
          }).toList();
        }

        int startIndex = currentPage * rowsPerPage;
        int endIndex = (startIndex + rowsPerPage < workUnits.length)
            ? startIndex + rowsPerPage
            : workUnits.length;
        List<dynamic> paginatedWorkUnits =
            workUnits.sublist(startIndex, endIndex);

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                    currentPage = 0;
                  });
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Cari Unit Kerja',
                  border: InputBorder.none,
                  filled: true,
                ),
              ),
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
                for (int i = 0; i < paginatedWorkUnits.length; i++)
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
                            paginatedWorkUnits[i]['id'].toString(),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: Text(
                          paginatedWorkUnits[i]['nama'].toString(),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: Text(
                          paginatedWorkUnits[i]['kode'].toString(),
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
                                        paginatedWorkUnits[i]['id'],
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
                                              _deleteWorkUnit(
                                                  paginatedWorkUnits[i]['id']
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
                  onPressed: currentPage > 0
                      ? () {
                          setState(() {
                            currentPage--;
                          });
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Text('Sebelumnya'),
                ),
                Text(
                  'Halaman ${currentPage + 1} dari ${(workUnits.length / rowsPerPage).ceil()}',
                ),
                ElevatedButton(
                  onPressed: (currentPage + 1) * rowsPerPage < workUnits.length
                      ? () {
                          setState(() {
                            currentPage++;
                          });
                        }
                      : null,
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
          const Text('Data unit kerja tidak ditemukan'),
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
