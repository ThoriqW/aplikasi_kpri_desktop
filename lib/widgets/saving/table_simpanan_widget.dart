import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/saving_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/saving/create_simpanan_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class TableSimpananWidget extends ConsumerStatefulWidget {
  const TableSimpananWidget(
      {super.key, required this.tahun, required this.workUnitId});

  final String tahun;
  final int workUnitId;

  @override
  ConsumerState<TableSimpananWidget> createState() =>
      _TableSimpananWidgetState();
}

class _TableSimpananWidgetState extends ConsumerState<TableSimpananWidget> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  Map<String, Map<String, dynamic>> updateSavingsObject = {};

  int currentPage = 0;
  int rowsPerPage = 12;

  @override
  Widget build(BuildContext context) {
    final getAllSavingMembers = ref.watch(
      getAllSavingMembersProvider(widget.tahun, widget.workUnitId),
    );
    return getAllSavingMembers.when(
      data: (saving) {
        List<dynamic> savings = saving as List<dynamic>;
        int totalPages = (savings[0]['members'].length / rowsPerPage).ceil();
        List<dynamic> pageData = savings[0]['members']
            .skip(currentPage * rowsPerPage)
            .take(rowsPerPage)
            .toList();
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      hintText: 'Cari Anggota',
                      border: InputBorder.none,
                      filled: true,
                      fillColor: GlobalColors.background,
                    ),
                  ),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: ButtonWidget(
                    text: "Simpan",
                    onTap: () {
                      updateDataSavings(int.parse(widget.tahun), 1);
                    },
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            for (int i = 0; i < savings.length; i++)
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(9),
                    color: GlobalColors.secondary,
                    child: Center(
                      child: Text(
                        savings[i]['work_unit'],
                        style: const TextStyle(
                          color: GlobalColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Table(
                    border: TableBorder.all(color: GlobalColors.header),
                    columnWidths: const <int, TableColumnWidth>{
                      0: IntrinsicColumnWidth(),
                      1: IntrinsicColumnWidth(),
                      2: FlexColumnWidth(),
                      3: IntrinsicColumnWidth(),
                      4: IntrinsicColumnWidth(),
                      5: IntrinsicColumnWidth(),
                      6: IntrinsicColumnWidth(),
                      7: IntrinsicColumnWidth(),
                      8: IntrinsicColumnWidth(),
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
                              "Nama Anggota",
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
                                "Tahun",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(9),
                              child: const Text(
                                "Bulan",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(9),
                              child: const Text(
                                "Utama",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(9),
                              child: const Text(
                                "Wajib",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(9),
                              child: const Text(
                                "Suka Rela",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      for (int j = 0; j < pageData.length; j++)
                        TableRow(
                          decoration: const BoxDecoration(),
                          children: <Widget>[
                            Center(
                              child: Container(
                                padding: const EdgeInsets.all(9),
                                child: Text(
                                  (j + 1).toString(),
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
                                  pageData[j]['nomor_anggota'].toString(),
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
                                pageData[j]['nama_lengkap'].toString(),
                                style: const TextStyle(
                                  color: GlobalColors.onBackground,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                padding: const EdgeInsets.all(9),
                                child: Text(
                                  pageData[j]['tahun'].toString(),
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
                                  pageData[j]['bulan'].toString(),
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
                                child: EditableText(
                                  controller: TextEditingController(
                                    text: NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'Rp',
                                      decimalDigits: 0,
                                    ).format(
                                      double.parse(
                                        pageData[j]['pokok'].toString(),
                                      ),
                                    ),
                                  ),
                                  focusNode: FocusNode(),
                                  cursorColor: GlobalColors.primary,
                                  backgroundCursorColor: GlobalColors.secondary,
                                  style: const TextStyle(
                                    color: GlobalColors.onBackground,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  onSubmitted: (newPokok) {},
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                padding: const EdgeInsets.all(9),
                                child: EditableText(
                                  controller: TextEditingController(
                                    text: NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'Rp',
                                      decimalDigits: 0,
                                    ).format(
                                      double.parse(
                                        pageData[j]['wajib'].toString(),
                                      ),
                                    ),
                                  ),
                                  focusNode: FocusNode(),
                                  cursorColor: GlobalColors.primary,
                                  backgroundCursorColor: GlobalColors.secondary,
                                  style: const TextStyle(
                                    color: GlobalColors.onBackground,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  onSubmitted: (newWajib) {},
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                padding: const EdgeInsets.all(9),
                                child: EditableText(
                                  controller: TextEditingController(
                                    text: NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'Rp',
                                      decimalDigits: 0,
                                    ).format(
                                      double.parse(
                                        pageData[j]['sukarela'].toString(),
                                      ),
                                    ),
                                  ),
                                  focusNode: FocusNode(),
                                  cursorColor: GlobalColors.primary,
                                  backgroundCursorColor: GlobalColors.secondary,
                                  style: const TextStyle(
                                    color: GlobalColors.onBackground,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  onSubmitted: (newSukarela) {},
                                ),
                              ),
                            ),
                          ],
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
                  'Halaman ${currentPage + 1} dari $totalPages',
                ),
                ElevatedButton(
                  onPressed: (currentPage + 1) < totalPages
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
      error: (error, stackTrace) => CreateSimpananWidget(
        tahun: widget.tahun,
        onComplete: () {
          ref.invalidate(
              getAllSavingMembersProvider(widget.tahun, widget.workUnitId));
        },
      ),
      loading: () => const LinearProgressIndicator(),
    );
  }

  Future<void> updateValueSaving(
    Map<String, Map<String, dynamic>> updateSavingsObject,
    String nomorAnggota,
    String bulan,
    String jenis,
    String newValue,
  ) async {
    String key = nomorAnggota;

    if (!updateSavingsObject.containsKey(key)) {
      updateSavingsObject[key] = {};
    }

    if (!updateSavingsObject[key]!.containsKey(bulan)) {
      updateSavingsObject[key]![bulan] = {
        "pokok": 0,
        "wajib": 0,
        "sukarela": 0,
      };
    }

    updateSavingsObject[key]![bulan]![jenis] = int.tryParse(
            newValue.replaceAll("Rp", "").replaceAll(".", "").trim()) ??
        0;
  }

  Future<void> updateDataSavings(
    int tahun,
    int workUnitId,
  ) async {
    try {
      final updateMemberSavings = await ref.watch(
          updateMemberSavingsProvider(tahun, workUnitId, updateSavingsObject)
              .future);
      if (!mounted) return;
      if (updateMemberSavings is SuccessResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: updateMemberSavings.message,
              alertTitle: "Sukses",
            );
          },
        ).then((_) => ref.invalidate(getAllSavingMembersProvider(
            widget.tahun, int.parse(workUnitId.toString()))));
      } else if (updateMemberSavings is ErrorResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: updateMemberSavings.errors,
              alertTitle: "Gagal",
            );
          },
        );
      }
    } catch (e) {
      if (!mounted) return;
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDialog(
            alertDesc: e.toString(),
            alertTitle: "Error",
          );
        },
      );
    }
  }
}
