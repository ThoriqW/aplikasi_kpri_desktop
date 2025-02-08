import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/excel/excel_savings.dart';
import 'package:aplikasi_kpri_desktop/providers/saving_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/cutom_table_widget.dart';
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
      'JANUARI',
      'FEBRUARI',
      'MARET',
      'APRIL',
      'MEI',
      'JUNI',
      'JULI',
      'AGUSTUS',
      'SEPTEMBER',
      'OKTOBER',
      'NOVEMBER',
      'DESEMBER',
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

        List<List<dynamic>> rowsCells = savings.map((entry) {
          var savings = entry['savings'].map<Widget>((saving) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: EditableText(
                      controller: TextEditingController(
                        text: saving['pokok'].toString() != '0.00'
                            ? NumberFormat.currency(
                                locale: 'id',
                                symbol: '',
                                decimalDigits: 0,
                              ).format(
                                double.parse(
                                  saving['pokok'].toString(),
                                ),
                              )
                            : '',
                      ),
                      focusNode: FocusNode(),
                      cursorColor: GlobalColors.primary,
                      backgroundCursorColor: GlobalColors.secondary,
                      style: const TextStyle(
                        color: Color(0xDE000000),
                      ),
                      onSubmitted: (newPokok) {
                        ref
                            .watch(updateSavingObjectProvider.notifier)
                            .updateValueSaving(
                              entry['member_profile_id'].toString(),
                              saving['bulan'].toString(),
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
                        text: saving['wajib'].toString() != '0.00'
                            ? NumberFormat.currency(
                                locale: 'id',
                                symbol: '',
                                decimalDigits: 0,
                              ).format(
                                double.parse(
                                  saving['wajib'].toString(),
                                ),
                              )
                            : '',
                      ),
                      focusNode: FocusNode(),
                      cursorColor: GlobalColors.primary,
                      backgroundCursorColor: GlobalColors.secondary,
                      style: const TextStyle(
                        color: Color(0xDE000000),
                      ),
                      onSubmitted: (newPokok) {
                        ref
                            .watch(updateSavingObjectProvider.notifier)
                            .updateValueSaving(
                              entry['member_profile_id'].toString(),
                              saving['bulan'].toString(),
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
                        text: saving['sukarela'].toString() != '0.00'
                            ? NumberFormat.currency(
                                locale: 'id',
                                symbol: '',
                                decimalDigits: 0,
                              ).format(
                                double.parse(
                                  saving['sukarela'].toString(),
                                ),
                              )
                            : '',
                      ),
                      focusNode: FocusNode(),
                      cursorColor: GlobalColors.primary,
                      backgroundCursorColor: GlobalColors.secondary,
                      style: const TextStyle(
                        color: Color(0xDE000000),
                      ),
                      onSubmitted: (newPokok) {
                        ref
                            .watch(updateSavingObjectProvider.notifier)
                            .updateValueSaving(
                              entry['member_profile_id'].toString(),
                              saving['bulan'].toString(),
                              'sukarela',
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
                        text: saving['dana_sosial'].toString() != '0.00'
                            ? NumberFormat.currency(
                                locale: 'id',
                                symbol: '',
                                decimalDigits: 0,
                              ).format(
                                double.parse(
                                  saving['dana_sosial'].toString(),
                                ),
                              )
                            : '',
                      ),
                      focusNode: FocusNode(),
                      cursorColor: GlobalColors.primary,
                      backgroundCursorColor: GlobalColors.secondary,
                      style: const TextStyle(
                        color: Color(0xDE000000),
                      ),
                      onSubmitted: (newPokok) {
                        ref
                            .watch(updateSavingObjectProvider.notifier)
                            .updateValueSaving(
                              entry['member_profile_id'].toString(),
                              saving['bulan'].toString(),
                              'dana_sosial',
                              newPokok,
                            );
                      },
                    ),
                  ),
                ),
              ],
            );
          }).toList();
          return [
            entry['work_unit'],
            entry['nomor_anggota'],
            entry['tahun'],
            for (int j = 0; j < entry['previous_years'].length; j++)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        entry['previous_years'][j]['total_pokok'].toString() !=
                                '0.00'
                            ? NumberFormat.currency(
                                locale: 'id',
                                symbol: '',
                                decimalDigits: 0,
                              ).format(
                                double.parse(
                                  entry['previous_years'][j]['total_pokok']
                                      .toString(),
                                ),
                              )
                            : '',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        entry['previous_years'][j]['total_wajib'].toString() !=
                                '0.00'
                            ? NumberFormat.currency(
                                locale: 'id',
                                symbol: '',
                                decimalDigits: 0,
                              ).format(
                                double.parse(
                                  entry['previous_years'][j]['total_wajib']
                                      .toString(),
                                ),
                              )
                            : '',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        entry['previous_years'][j]['total_sukarela']
                                    .toString() !=
                                '0.00'
                            ? NumberFormat.currency(
                                locale: 'id',
                                symbol: '',
                                decimalDigits: 0,
                              ).format(
                                double.parse(
                                  entry['previous_years'][j]['total_sukarela']
                                      .toString(),
                                ),
                              )
                            : '',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        entry['previous_years'][j]['total_dana_sosial']
                                    .toString() !=
                                '0.00'
                            ? NumberFormat.currency(
                                locale: 'id',
                                symbol: '',
                                decimalDigits: 0,
                              ).format(
                                double.parse(
                                  entry['previous_years'][j]
                                          ['total_dana_sosial']
                                      .toString(),
                                ),
                              )
                            : '',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        entry['previous_years'][j]['accumulated_savings']
                                    .toString() !=
                                '0.00'
                            ? NumberFormat.currency(
                                locale: 'id',
                                symbol: '',
                                decimalDigits: 0,
                              ).format(
                                double.parse(
                                  entry['previous_years'][j]
                                          ['accumulated_savings']
                                      .toString(),
                                ),
                              )
                            : '',
                      ),
                    ),
                  ),
                ],
              ),
            ...savings,
            entry['total_pokok'].toString() != '0.00'
                ? NumberFormat.currency(
                    locale: 'id',
                    symbol: '',
                    decimalDigits: 0,
                  ).format(
                    double.parse(
                      entry['total_pokok'].toString(),
                    ),
                  )
                : '',
            entry['total_wajib'].toString() != '0.00'
                ? NumberFormat.currency(
                    locale: 'id',
                    symbol: '',
                    decimalDigits: 0,
                  ).format(
                    double.parse(
                      entry['total_wajib'].toString(),
                    ),
                  )
                : '',
            entry['total_sukarela'].toString() != '0.00'
                ? NumberFormat.currency(
                    locale: 'id',
                    symbol: '',
                    decimalDigits: 0,
                  ).format(
                    double.parse(
                      entry['total_sukarela'].toString(),
                    ),
                  )
                : '',
            entry['total_dana_sosial'].toString() != '0.00'
                ? NumberFormat.currency(
                    locale: 'id',
                    symbol: '',
                    decimalDigits: 0,
                  ).format(
                    double.parse(
                      entry['total_dana_sosial'].toString(),
                    ),
                  )
                : '',
            entry['total_savings'].toString() != '0.00'
                ? NumberFormat.currency(
                    locale: 'id',
                    symbol: '',
                    decimalDigits: 0,
                  ).format(
                    double.parse(
                      entry['total_savings'].toString(),
                    ),
                  )
                : '',
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  child: IconButton(
                    onPressed: () {
                      ref
                          .watch(dataTransferMemberSavingsNotifierProvider
                              .notifier)
                          .setData(
                            entry['member_profile_id'],
                            entry['nama_lengkap'].toString(),
                            entry['work_unit_id'],
                            entry['work_unit'].toString(),
                            entry['tahun'],
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
                  memberId: entry['member_profile_id'].toString(),
                  tahunSaving: entry['tahun'].toString(),
                )
              ],
            ),
          ];
        }).toList();

        final fixedColCells =
            savings.map((entry) => entry["nama_lengkap"].toString()).toList();

        final bulanSavings = bulan.map<Widget>((b) {
          return Column(
            children: [
              Flexible(
                child: Container(
                  color: GlobalColors.secondary,
                  width: double.infinity,
                  padding: const EdgeInsets.all(5),
                  child: Center(
                    child: Text(
                      b.toUpperCase(),
                      style: const TextStyle(
                        color: GlobalColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                        padding: const EdgeInsets.all(5),
                        child: Center(
                          child: Text(
                            "POKOK",
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onTertiaryContainer,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        padding: const EdgeInsets.all(5),
                        child: Center(
                          child: Text(
                            "WAJIB",
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        color: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest,
                        padding: const EdgeInsets.all(5),
                        child: Center(
                          child: Text(
                            "SUKA RELA",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        padding: const EdgeInsets.all(5),
                        child: Center(
                          child: Text(
                            "DANA SOSIAL",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        }).toList();

        final fixedRowCells = [
          "UNIT KERJA",
          "NOMOR ANGGOTA",
          "TAHUN",
          for (int j = 0; j < savingResponse[0]['previous_years'].length; j++)
            Column(
              children: [
                Flexible(
                  child: Container(
                    color: GlobalColors.secondary,
                    width: double.infinity,
                    padding: const EdgeInsets.all(5),
                    child: Center(
                      child: Text(
                        savingResponse[j]['previous_years'][j]['tahun']
                            .toString(),
                        style: const TextStyle(
                          color: GlobalColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Row(
                    children: [
                      Flexible(
                        child: Container(
                          color:
                              Theme.of(context).colorScheme.tertiaryContainer,
                          padding: const EdgeInsets.all(5),
                          child: Center(
                            child: Text(
                              "POKOK",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onTertiaryContainer,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          padding: const EdgeInsets.all(5),
                          child: Center(
                            child: Text(
                              "WAJIB",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          color: Theme.of(context)
                              .colorScheme
                              .surfaceContainerHighest,
                          padding: const EdgeInsets.all(5),
                          child: Center(
                            child: Text(
                              "SUKARELA",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          padding: const EdgeInsets.all(5),
                          child: Center(
                            child: Text(
                              "SOSIAL",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          color: Theme.of(context).colorScheme.primaryFixed,
                          padding: const EdgeInsets.all(5),
                          child: Center(
                            child: Text(
                              "TOTAL",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ...bulanSavings,
          'TOTAL POKOK',
          'TOTAL WAJIB',
          'TOTAL SUKA RELA',
          'TOTAL DANA SOSIAL',
          'TOTAL SIMPANAN',
          "AKSI",
        ];

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
                  ),
                )
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
                            .watch(editSavingsNotifierProvider.notifier)
                            .setTahunSimpanan(
                              tahun,
                            );
                      },
                    ),
                    ExcelSavings(
                      bulan: bulan,
                      tahun: tahun,
                      workUnitId: workUnitId,
                      totalPage: totalMember,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.surfaceDim,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: CustomDataTable(
                  rowsCells: rowsCells,
                  fixedColCells: fixedColCells,
                  fixedRowCells: fixedRowCells,
                  cellHeightWidget: 65,
                  cellWidthWidget: 410,
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
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }
                    return Text(
                      '$data',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                  fixedCornerCell: "NAMA LENGKAP",
                ),
              ),
            ),
            const SizedBox(height: 20),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: currentPage > 1
                      ? () {
                          ref
                              .watch(searchSavingsProvider.notifier)
                              .setSearchSavings(currentPage: currentPage - 1);
                        }
                      : null,
                ),
                const SizedBox(width: 6),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: currentPage < ref.watch(totalPageSavingsProvider)
                      ? () {
                          ref
                              .watch(searchSavingsProvider.notifier)
                              .setSearchSavings(currentPage: currentPage + 1);
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
