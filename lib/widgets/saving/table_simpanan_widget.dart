import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/saving_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/saving/add_member_simpanan_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/saving/create_simpanan_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class TableSimpananWidget extends ConsumerStatefulWidget {
  const TableSimpananWidget({
    super.key,
    required this.tahun,
    required this.workUnitId,
    required this.searchQuery,
  });

  final String tahun;
  final int workUnitId;
  final String searchQuery;

  @override
  ConsumerState<TableSimpananWidget> createState() =>
      _TableSimpananWidgetState();
}

class _TableSimpananWidgetState extends ConsumerState<TableSimpananWidget> {
  Map<String, Map<String, dynamic>> updateSavingsObject = {};

  int currentPage = 0;
  int rowsPerPage = 12;

  @override
  Widget build(BuildContext context) {
    final getAllSavingMembers = ref.watch(
      getAllSavingMembersProvider(
          widget.tahun, widget.workUnitId, widget.searchQuery),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ButtonWidget(
                      text: "Simpan",
                      onTap: () {
                        updateDataSavings(
                            int.parse(widget.tahun), widget.workUnitId);
                        updateSavingsObject = {};
                      },
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text(
                      "*tekan enter setelah edit simpanan",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: GlobalColors.onBackground,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 12,
                ),
                Flexible(
                    child: AddMemberSimpananWidget(
                  year: widget.tahun,
                  workUnitID: widget.workUnitId,
                ))
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
                    columnWidths: const <int, TableColumnWidth>{
                      0: IntrinsicColumnWidth(),
                      1: IntrinsicColumnWidth(),
                      2: IntrinsicColumnWidth(),
                      3: FlexColumnWidth(),
                      4: IntrinsicColumnWidth(),
                      5: IntrinsicColumnWidth(),
                      6: IntrinsicColumnWidth(),
                      7: IntrinsicColumnWidth(),
                      8: IntrinsicColumnWidth(),
                      9: IntrinsicColumnWidth(),
                      10: IntrinsicColumnWidth(),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: <TableRow>[
                      TableRow(
                        decoration:
                            const BoxDecoration(color: GlobalColors.secondary),
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(9),
                            child: const Text("No"),
                          ),
                          Container(
                            padding: const EdgeInsets.all(9),
                            child: const Text("No. Anggota"),
                          ),
                          Container(
                            padding: const EdgeInsets.all(9),
                            child: const Text("ID"),
                          ),
                          Container(
                            padding: const EdgeInsets.all(9),
                            child: const Text("Nama Anggota"),
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(9),
                              child: const Text("Tahun"),
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(9),
                              child: const Text("Bulan"),
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(9),
                              child: const Text("Utama"),
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(9),
                              child: const Text("Wajib"),
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(9),
                              child: const Text("Suka Rela"),
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(9),
                              child: const Text("Aksi"),
                            ),
                          ),
                        ],
                      ),
                      for (int j = 0; j < pageData.length; j++)
                        TableRow(
                          decoration: BoxDecoration(
                            color:
                                j.isEven ? Colors.grey.shade200 : Colors.white,
                          ),
                          children: <Widget>[
                            Center(
                              child: Container(
                                padding: const EdgeInsets.all(9),
                                child: Text(
                                  (j + 1).toString(),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(9),
                              child: Text(
                                pageData[j]['nomor_anggota'].toString(),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(9),
                              child: Text(
                                pageData[j]['member_profile_id'].toString(),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(9),
                              child: Text(
                                pageData[j]['nama_lengkap'].toString(),
                              ),
                            ),
                            Center(
                              child: Container(
                                padding: const EdgeInsets.all(9),
                                child: Text(
                                  pageData[j]['tahun'].toString(),
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                padding: const EdgeInsets.all(9),
                                child: Text(
                                  pageData[j]['bulan'].toString(),
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
                                    color: Color(0xDE000000),
                                  ),
                                  onSubmitted: (newPokok) {
                                    updateValueSaving(
                                      updateSavingsObject,
                                      pageData[j]['member_profile_id']
                                          .toString(),
                                      pageData[j]['bulan'].toString(),
                                      'pokok',
                                      newPokok,
                                    );
                                  },
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
                                    color: Color(0xDE000000),
                                  ),
                                  onSubmitted: (newWajib) {
                                    updateValueSaving(
                                      updateSavingsObject,
                                      pageData[j]['member_profile_id']
                                          .toString(),
                                      pageData[j]['bulan'].toString(),
                                      'wajib',
                                      newWajib,
                                    );
                                  },
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
                                    color: Color(0xDE000000),
                                  ),
                                  onSubmitted: (newSukarela) {
                                    updateValueSaving(
                                      updateSavingsObject,
                                      pageData[j]['member_profile_id']
                                          .toString(),
                                      pageData[j]['bulan'].toString(),
                                      'sukarela',
                                      newSukarela,
                                    );
                                  },
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.edit,
                                    size: 18,
                                    color: GlobalColors.primary,
                                  ),
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
          ref.invalidate(getAllSavingMembersProvider(
              widget.tahun, widget.workUnitId, widget.searchQuery));
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
      updateSavingsObject[key]![bulan] = {};
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
        ).then(
          (_) => ref.invalidate(
            getAllSavingMembersProvider(
              widget.tahun,
              int.parse(workUnitId.toString()),
              widget.searchQuery,
            ),
          ),
        );
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
