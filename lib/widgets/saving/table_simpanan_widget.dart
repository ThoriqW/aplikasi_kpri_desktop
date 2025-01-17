import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/excel/excel_savings.dart';
import 'package:aplikasi_kpri_desktop/providers/saving_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/saving/add_member_simpanan_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/saving/create_simpanan_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/saving/delete_member_saving_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/saving/update_simpanan_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class TableSimpananWidget extends ConsumerWidget {
  const TableSimpananWidget({
    super.key,
    required this.tahun,
    required this.workUnitId,
    required this.searchQuery,
    required this.perPage,
    required this.currentPage,
  });

  final String searchQuery;
  final int tahun;
  final int workUnitId;
  final int perPage;
  final int currentPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    final getAllSavingMembers = ref.watch(
      getAllSavingMembersProvider(
        tahun,
        workUnitId,
        searchQuery,
        perPage,
        currentPage,
      ),
    );
    return getAllSavingMembers.when(
      data: (saving) {
        if (saving == null) {
          return const Text("Data tidak valid");
        }
        if (saving is ErrorResponse || saving is! Map<String, dynamic>) {
          return Row(
            children: [
              Text(saving.toString()),
              const SizedBox(width: 8),
              if (saving.toString() == "Simpanan tidak ditemukan")
                CreateSimpananWidget(
                  tahun: tahun,
                  onComplete: () {
                    ref.invalidate(getAllSavingMembersProvider(
                      tahun,
                      workUnitId,
                      searchQuery,
                      perPage,
                      1,
                    ));
                  },
                ),
            ],
          );
        }

        final List<dynamic> savingResponse = saving['data'];

        int totalPage = saving['pagination']['last_page'];
        int currentPage = saving['pagination']['current_page'];
        int totalMember = saving['pagination']['total'];

        List<dynamic> savings = savingResponse;

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
                UpdateSimpananWidget(
                  tahun: tahun,
                  workUnitId: workUnitId,
                  currentPage: currentPage,
                  perPage: perPage,
                  searchQuery: searchQuery,
                ),
                const SizedBox(
                  width: 12,
                ),
                Flexible(
                    child: AddMemberSimpananWidget(
                  year: tahun,
                  workUnitID: workUnitId,
                  currentPage: currentPage,
                  perPage: perPage,
                ))
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.edit_document,
                        color: GlobalColors.primary,
                      ),
                      onPressed: () {
                        ref
                            .watch(
                              savingModeNotifierProvider.notifier,
                            )
                            .switchToEditSimpanan();
                        ref
                            .watch(tahunMemberSavingsNotifierProvider.notifier)
                            .setTahunSimpanan(
                              tahun,
                            );
                      },
                    ),
                    ExcelSavings(
                      bulan: bulan,
                      tahun: tahun,
                      workUnitId: workUnitId,
                    )
                  ],
                ),
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
                  19: IntrinsicColumnWidth(),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    decoration: const BoxDecoration(
                      color: GlobalColors.headerTable,
                    ),
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
                          "UNIT KERJA",
                          style: TextStyle(
                            color: GlobalColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "NOMOR ANGGOTA",
                          style: TextStyle(
                            color: GlobalColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "NAMA LENGKAP",
                          style: TextStyle(
                            color: GlobalColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "TAHUN",
                          style: TextStyle(
                            color: GlobalColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      for (int b = 0; b < bulan.length; b++)
                        Column(
                          children: [
                            Container(
                              color: GlobalColors.primary,
                              width: double.infinity,
                              padding: const EdgeInsets.all(9),
                              child: Center(
                                child: Text(
                                  bulan[b].toUpperCase(),
                                  style: const TextStyle(
                                    color: GlobalColors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    color: const Color(0xFF000B58),
                                    padding: const EdgeInsets.all(5),
                                    child: const Center(
                                      child: Text(
                                        "POKOK",
                                        style: TextStyle(
                                          color: GlobalColors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    color: const Color(0xFF003161),
                                    padding: const EdgeInsets.all(5),
                                    child: const Center(
                                      child: Text(
                                        "WAJIB",
                                        style: TextStyle(
                                          color: GlobalColors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    color: const Color(0xFF006A67),
                                    padding: const EdgeInsets.all(5),
                                    child: const Center(
                                      child: Text(
                                        "SUKA RELA",
                                        style: TextStyle(
                                          color: GlobalColors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "TOTAL SIMPANAN",
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
                                      text: savings[i]['savings'][j]['pokok']
                                                  .toString() !=
                                              '0.00'
                                          ? NumberFormat.currency(
                                              locale: 'id',
                                              symbol: '',
                                              decimalDigits: 0,
                                            ).format(
                                              double.parse(
                                                savings[i]['savings'][j]
                                                        ['pokok']
                                                    .toString(),
                                              ),
                                            )
                                          : '',
                                    ),
                                    focusNode: FocusNode(),
                                    cursorColor: GlobalColors.primary,
                                    backgroundCursorColor:
                                        GlobalColors.secondary,
                                    style: const TextStyle(
                                      color: Color(0xDE000000),
                                    ),
                                    onSubmitted: (newPokok) {
                                      ref
                                          .watch(updateSavingObjectProvider
                                              .notifier)
                                          .updateValueSaving(
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
                                      text: savings[i]['savings'][j]['wajib']
                                                  .toString() !=
                                              '0.00'
                                          ? NumberFormat.currency(
                                              locale: 'id',
                                              symbol: '',
                                              decimalDigits: 0,
                                            ).format(
                                              double.parse(
                                                savings[i]['savings'][j]
                                                        ['wajib']
                                                    .toString(),
                                              ),
                                            )
                                          : '',
                                    ),
                                    focusNode: FocusNode(),
                                    cursorColor: GlobalColors.primary,
                                    backgroundCursorColor:
                                        GlobalColors.secondary,
                                    style: const TextStyle(
                                      color: Color(0xDE000000),
                                    ),
                                    onSubmitted: (newPokok) {
                                      ref
                                          .watch(updateSavingObjectProvider
                                              .notifier)
                                          .updateValueSaving(
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
                                      text: savings[i]['savings'][j]['sukarela']
                                                  .toString() !=
                                              '0.00'
                                          ? NumberFormat.currency(
                                              locale: 'id',
                                              symbol: '',
                                              decimalDigits: 0,
                                            ).format(
                                              double.parse(
                                                savings[i]['savings'][j]
                                                        ['sukarela']
                                                    .toString(),
                                              ),
                                            )
                                          : '',
                                    ),
                                    focusNode: FocusNode(),
                                    cursorColor: GlobalColors.primary,
                                    backgroundCursorColor:
                                        GlobalColors.secondary,
                                    style: const TextStyle(
                                      color: Color(0xDE000000),
                                    ),
                                    onSubmitted: (newPokok) {
                                      ref
                                          .watch(updateSavingObjectProvider
                                              .notifier)
                                          .updateValueSaving(
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
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            savings[i]['total_savings'].toString() != '0.00'
                                ? NumberFormat.currency(
                                    locale: 'id',
                                    symbol: '',
                                    decimalDigits: 0,
                                  ).format(
                                    double.parse(
                                      savings[i]['total_savings'].toString(),
                                    ),
                                  )
                                : '',
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
                                        .watch(dataTransferMemberSavingsNotifierProvider
                                            .notifier)
                                        .setData(
                                          savings[i]['member_profile_id'],
                                          savings[i]['nama_lengkap'].toString(),
                                          savings[i]['work_unit_id'],
                                          savings[i]['work_unit'].toString(),
                                          savings[i]['tahun'],
                                        );
                                    ref
                                        .watch(
                                          savingModeNotifierProvider.notifier,
                                        )
                                        .switchToTransferMember();
                                  },
                                  icon: const Icon(
                                    Icons.move_up,
                                    size: 18,
                                    color: GlobalColors.primary,
                                  ),
                                ),
                              ),
                              DeleteMemberSavingWidget(
                                tahun: tahun,
                                workUnitId: workUnitId,
                                currentPage: currentPage,
                                perPage: perPage,
                                searchQuery: searchQuery,
                                memberId:
                                    savings[i]['member_profile_id'].toString(),
                                tahunSaving: savings[i]['tahun'].toString(),
                              )
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
      error: (error, stackTrace) => const Text('Gagal terhubung ke server!!'),
      loading: () => const LinearProgressIndicator(),
    );
  }
}
