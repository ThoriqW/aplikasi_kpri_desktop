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
    required this.perPage,
    required this.currentPage,
  });

  final String tahun;
  final int workUnitId;
  final String searchQuery;
  final int perPage;
  final int currentPage;

  @override
  ConsumerState<TableSimpananWidget> createState() =>
      _TableSimpananWidgetState();
}

class _TableSimpananWidgetState extends ConsumerState<TableSimpananWidget> {
  Map<String, Map<String, dynamic>> updateSavingsObject = {};
  List<String> bulan = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];
  @override
  Widget build(BuildContext context) {
    final getAllSavingMembers = ref.watch(
      getAllSavingMembersProvider(
        widget.tahun,
        widget.workUnitId,
        widget.searchQuery,
        widget.perPage,
        widget.currentPage,
      ),
    );
    return getAllSavingMembers.when(
      data: (saving) {
        if (saving == null ||
            saving is! Map<String, dynamic> ||
            !saving.containsKey('data')) {
          return const Text("Data tidak valid");
        }

        final List<dynamic> savingsResponse = saving['data'];

        if (savingsResponse.isEmpty) {
          return Row(
            children: [
              Text(saving['message']),
              const SizedBox(width: 8),
              CreateSimpananWidget(
                tahun: widget.tahun,
                onComplete: () {
                  ref.invalidate(getAllSavingMembersProvider(
                    widget.tahun,
                    widget.workUnitId,
                    widget.searchQuery,
                    widget.perPage,
                    widget.currentPage,
                  ));
                },
              ),
            ],
          );
        }

        int totalPage = saving['pagination']['last_page'];
        int currentPage = saving['pagination']['current_page'];
        int totalMember = saving['pagination']['total'];

        List<dynamic> savings = savingsResponse;

        Future.microtask(() {
          ref
              .watch(totalPageSavingsProvider.notifier)
              .setTotalMember(saving['pagination']['last_page']);
        });

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
                  currentPage: widget.currentPage,
                  perPage: widget.perPage,
                ))
              ],
            ),
            const SizedBox(
              height: 12,
            ),
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
            const SizedBox(
              height: 8,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: IntrinsicColumnWidth(),
                  1: IntrinsicColumnWidth(),
                  2: IntrinsicColumnWidth(),
                  3: IntrinsicColumnWidth(),
                  4: IntrinsicColumnWidth(),
                  5: IntrinsicColumnWidth(),
                  6: IntrinsicColumnWidth(),
                  7: IntrinsicColumnWidth(),
                  8: IntrinsicColumnWidth(),
                  9: IntrinsicColumnWidth(),
                  10: IntrinsicColumnWidth(),
                  11: IntrinsicColumnWidth(),
                  12: IntrinsicColumnWidth(),
                  13: IntrinsicColumnWidth(),
                  14: IntrinsicColumnWidth(),
                  15: IntrinsicColumnWidth(),
                  16: IntrinsicColumnWidth(),
                  17: IntrinsicColumnWidth(),
                  18: IntrinsicColumnWidth(),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    decoration: const BoxDecoration(
                      color: GlobalColors.secondary,
                    ),
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
                          "UNIT KERJA",
                          style: TextStyle(
                            color: GlobalColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "NOMOR ANGGOTA",
                          style: TextStyle(
                            color: GlobalColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "NAMA LENGKAP",
                          style: TextStyle(
                            color: GlobalColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "TAHUN",
                          style: TextStyle(
                            color: GlobalColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      for (int b = 0; b < bulan.length; b++)
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(9),
                              child: Text(
                                bulan[b].toUpperCase(),
                                style: const TextStyle(
                                  color: GlobalColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    child: const Text(
                                      "POKOK",
                                      style: TextStyle(
                                        color: GlobalColors.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    child: const Text(
                                      "WAJIB",
                                      style: TextStyle(
                                        color: GlobalColors.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    child: const Text(
                                      "SUKA RELA",
                                      style: TextStyle(
                                        color: GlobalColors.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
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
                  for (int i = 0; i < savings.length; i++)
                    TableRow(
                      decoration: BoxDecoration(
                        color: i.isEven ? Colors.grey.shade200 : Colors.white,
                      ),
                      children: <Widget>[
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(9),
                            child: Text(
                              (0 + i + 1).toString(),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            savings[i]['work_unit'].toString(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            savings[i]['nomor_anggota'].toString(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            savings[i]['nama_lengkap'].toString(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            savings[i]['tahun'].toString(),
                          ),
                        ),
                        for (int j = 0; j < savings[i]['savings'].length; j++)
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: EditableText(
                                    controller: TextEditingController(
                                      text: NumberFormat.currency(
                                        locale: 'id',
                                        symbol: 'Rp',
                                        decimalDigits: 0,
                                      ).format(
                                        double.parse(
                                          savings[i]['savings'][j]['pokok']
                                              .toString(),
                                        ),
                                      ),
                                    ),
                                    focusNode: FocusNode(),
                                    cursorColor: GlobalColors.primary,
                                    backgroundCursorColor:
                                        GlobalColors.secondary,
                                    style: const TextStyle(
                                      color: Color(0xDE000000),
                                    ),
                                    onSubmitted: (newPokok) {
                                      updateValueSaving(
                                        updateSavingsObject,
                                        savings[i]['member_profile_id']
                                            .toString(),
                                        savings[i]['savings'][j]['bulan']
                                            .toString(),
                                        'pokok',
                                        newPokok,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: EditableText(
                                    controller: TextEditingController(
                                      text: NumberFormat.currency(
                                        locale: 'id',
                                        symbol: 'Rp',
                                        decimalDigits: 0,
                                      ).format(
                                        double.parse(
                                          savings[i]['savings'][j]['wajib']
                                              .toString(),
                                        ),
                                      ),
                                    ),
                                    focusNode: FocusNode(),
                                    cursorColor: GlobalColors.primary,
                                    backgroundCursorColor:
                                        GlobalColors.secondary,
                                    style: const TextStyle(
                                      color: Color(0xDE000000),
                                    ),
                                    onSubmitted: (newPokok) {
                                      updateValueSaving(
                                        updateSavingsObject,
                                        savings[i]['member_profile_id']
                                            .toString(),
                                        savings[i]['savings'][j]['bulan']
                                            .toString(),
                                        'wajib',
                                        newPokok,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: EditableText(
                                    controller: TextEditingController(
                                      text: NumberFormat.currency(
                                        locale: 'id',
                                        symbol: 'Rp',
                                        decimalDigits: 0,
                                      ).format(
                                        double.parse(
                                          savings[i]['savings'][j]['sukarela']
                                              .toString(),
                                        ),
                                      ),
                                    ),
                                    focusNode: FocusNode(),
                                    cursorColor: GlobalColors.primary,
                                    backgroundCursorColor:
                                        GlobalColors.secondary,
                                    style: const TextStyle(
                                      color: Color(0xDE000000),
                                    ),
                                    onSubmitted: (newPokok) {
                                      updateValueSaving(
                                        updateSavingsObject,
                                        savings[i]['member_profile_id']
                                            .toString(),
                                        savings[i]['savings'][j]['bulan']
                                            .toString(),
                                        'sukarela',
                                        newPokok,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        Center(
                          child: Row(
                            children: [
                              Container(
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
                              Container(
                                padding: const EdgeInsets.all(2),
                                child: IconButton(
                                  onPressed: () async {
                                    await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text("Info"),
                                          content: const Text(
                                            "Yakin hapus member?",
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
                                              onPressed: () {
                                                _deleteMemberSavings(
                                                  savings[i]
                                                          ['member_profile_id']
                                                      .toString(),
                                                  savings[i]['tahun']
                                                      .toString(),
                                                );
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
            ),
          ],
        );
      },
      error: (error, stackTrace) =>
          const Text('Oops, something unexpected happened'),
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
              widget.perPage,
              widget.currentPage,
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

  Future<void> _deleteMemberSavings(String id, String tahun) async {
    try {
      final deleteMemberSavings = await ref.watch(
        deleteMemberSavingsProvider(id, tahun).future,
      );
      if (!mounted) return;
      Navigator.pop(context, 'OK');
      if (deleteMemberSavings is SuccessResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: deleteMemberSavings.message,
              alertTitle: "Sukses",
            );
          },
        );
        ref.invalidate(getAllSavingMembersProvider(
          widget.tahun,
          widget.workUnitId,
          widget.searchQuery,
          widget.perPage,
          widget.currentPage,
        ));
      } else if (deleteMemberSavings is ErrorResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: deleteMemberSavings.errors,
              alertTitle: "Gagal",
            );
          },
        );
      }
    } catch (e) {
      if (!mounted) return;
      Navigator.pop(context, 'OK');
      await showDialog(
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
