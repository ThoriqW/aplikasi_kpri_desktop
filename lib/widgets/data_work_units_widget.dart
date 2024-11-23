import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/models/work_units_model.dart';
import 'package:aplikasi_kpri_desktop/providers/work_units_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataWorkUnitsWidget extends ConsumerStatefulWidget {
  const DataWorkUnitsWidget({super.key});

  @override
  ConsumerState<DataWorkUnitsWidget> createState() => _WorkUnitsWidgetState();
}

class _WorkUnitsWidgetState extends ConsumerState<DataWorkUnitsWidget> {
  int currentPage = 0;
  final int rowsPerPage = 5;
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';
  @override
  Widget build(BuildContext context) {
    final dataWorkUnits = ref.watch(getAllWorkUnitsProvider);
    return CustomCardWidget(
      color: GlobalColors.white,
      child: dataWorkUnits.when(
        data: (workUnit) {
          List<WorkUnit> workUnits = workUnit.data;

          if (searchQuery.isNotEmpty) {
            workUnits = workUnits.where((m) {
              final fullName = m.name.toString().toLowerCase();
              return fullName.contains(searchQuery.toLowerCase());
            }).toList();
          }

          int startIndex = currentPage * rowsPerPage;
          int endIndex = (startIndex + rowsPerPage < workUnits.length)
              ? startIndex + rowsPerPage
              : workUnits.length;
          List<dynamic> paginatedWorkUnits =
              workUnits.sublist(startIndex, endIndex);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Unit Kerja",
                style: TextStyle(
                  color: GlobalColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
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
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    hintText: 'Cari Unit Kerja',
                    border: InputBorder.none,
                    filled: true,
                    fillColor: GlobalColors.background,
                  ),
                ),
              ),
              Table(
                border: TableBorder.all(color: GlobalColors.header),
                columnWidths: const <int, TableColumnWidth>{
                  0: IntrinsicColumnWidth(),
                  1: IntrinsicColumnWidth(),
                  2: FlexColumnWidth(),
                  3: IntrinsicColumnWidth(),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: <TableRow>[
                  TableRow(
                    decoration: const BoxDecoration(),
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "No",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "ID",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "Nama Unit Kerja",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
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
                  ...paginatedWorkUnits.asMap().entries.map(
                    (entry) {
                      int i = entry.key;
                      WorkUnit workUnit = entry.value;

                      return TableRow(
                        decoration: const BoxDecoration(),
                        children: <Widget>[
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(9),
                              child: Text(
                                "${i + 1}",
                                style: const TextStyle(
                                  color: GlobalColors.onBackground,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(9),
                              child: Text(
                                workUnit.id.toString(),
                                style: const TextStyle(
                                  color: GlobalColors.onBackground,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(9),
                            child: Text(
                              workUnit.name,
                              style: const TextStyle(
                                color: GlobalColors.onBackground,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Center(
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {});
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
                                                      workUnit.id.toString());
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
                      );
                    },
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
                    child: const Text('Previous'),
                  ),
                  Text(
                    'Page ${currentPage + 1} of ${(workUnits.length / rowsPerPage).ceil()}',
                  ),
                  ElevatedButton(
                    onPressed:
                        (currentPage + 1) * rowsPerPage < workUnits.length
                            ? () {
                                setState(() {
                                  currentPage++;
                                });
                              }
                            : null,
                    child: const Text('Next'),
                  ),
                ],
              ),
            ],
          );
        },
        error: (error, stackTrace) =>
            const Text('Oops, something unexpected happened'),
        loading: () => const LinearProgressIndicator(),
      ),
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
        showDialog(
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
        showDialog(
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
