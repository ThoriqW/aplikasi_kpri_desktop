import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/bills_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/cutom_table_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/tagihan/create_tagihan_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/tagihan/delete_member_tagihan_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class TableTagihanWidget extends ConsumerWidget {
  const TableTagihanWidget({
    super.key,
    required this.tahun,
    required this.workUnitId,
    required this.searchQuery,
    required this.perPage,
    required this.currentPage,
    required this.bulan,
  });

  final String searchQuery;
  final int bulan;
  final int tahun;
  final int workUnitId;
  final int perPage;
  final int currentPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getAllBillsMembers = ref.watch(
      getAllBillsMembersProvider(
        tahun,
        workUnitId,
        searchQuery,
        bulan,
        perPage,
        currentPage,
      ),
    );
    return getAllBillsMembers.when(
      data: (bill) {
        if (bill == null) {
          return const Text("Data tidak valid");
        }
        if (bill is ErrorResponse || bill is! Map<String, dynamic>) {
          return Row(
            children: [
              Text(bill.toString()),
              const SizedBox(width: 8),
              CreateTagihanWidget(
                bulan: bulan,
                tahun: tahun,
                onComplete: () async {
                  ref.invalidate(getAllBillsMembersProvider);
                },
              )
            ],
          );
        }

        final List<dynamic> billResponse = bill['data'];

        int totalPage = bill['pagination']['last_page'];
        int currentPage = bill['pagination']['current_page'];
        int totalMember = bill['pagination']['total'];

        Future.microtask(() {
          ref
              .watch(totalPageBillsProvider.notifier)
              .setTotalMember(bill['pagination']['last_page']);
        });

        List<dynamic> bills = billResponse;

        List<List<dynamic>> rowsCells = bills.map((entry) {
          var bills = entry['bills'].first;
          return [
            entry['work_unit'],
            entry['nomor_anggota'],
            entry['nama_lengkap'],
            entry['tahun'],
            entry['bulan'],
            bills['simpanan_wajib'] != '0.00'
                ? NumberFormat.currency(
                    locale: 'id',
                    symbol: '',
                    decimalDigits: 0,
                  ).format(
                    double.parse(
                      bills['simpanan_wajib'],
                    ),
                  )
                : '',
            bills['dana_sosial'] != '0.00'
                ? NumberFormat.currency(
                    locale: 'id',
                    symbol: '',
                    decimalDigits: 0,
                  ).format(
                    double.parse(
                      bills['dana_sosial'],
                    ),
                  )
                : '',
            bills['pokok'] != '0.00'
                ? NumberFormat.currency(
                    locale: 'id',
                    symbol: '',
                    decimalDigits: 0,
                  ).format(
                    double.parse(
                      bills['pokok'],
                    ),
                  )
                : '',
            bills['bunga'] != '0.00'
                ? NumberFormat.currency(
                    locale: 'id',
                    symbol: '',
                    decimalDigits: 0,
                  ).format(
                    double.parse(
                      bills['bunga'],
                    ),
                  )
                : '',
            bills['bunga'] != '0.00'
                ? NumberFormat.currency(
                    locale: 'id',
                    symbol: '',
                    decimalDigits: 0,
                  ).format(
                    double.parse(
                      bills['barang'],
                    ),
                  )
                : '',
            bills['jangka_waktu'] != 0 ? bills['jangka_waktu'] : '',
            bills['jangka_waktu_ke'] != 0 ? bills['jangka_waktu_ke'] : '',
            bills['jumlah_tagihan'] != '0.00'
                ? NumberFormat.currency(
                    locale: 'id',
                    symbol: '',
                    decimalDigits: 0,
                  ).format(
                    double.parse(
                      bills['jumlah_tagihan'],
                    ),
                  )
                : '',
            bills['jumlah_tagihan'] != '0.00'
                ? NumberFormat.currency(
                    locale: 'id',
                    symbol: '',
                    decimalDigits: 0,
                  ).format(
                    double.parse(
                      bills['jumlah_setoran'],
                    ),
                  )
                : '',
            bills['sisa_tunggakan'] != '0.00'
                ? NumberFormat.currency(
                    locale: 'id',
                    symbol: '',
                    decimalDigits: 0,
                  ).format(
                    double.parse(
                      bills['sisa_tunggakan'],
                    ),
                  )
                : '',
            bills['keterangan'],
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    ref
                        .watch(dataMemberTagihanNotifierProvider.notifier)
                        .setData(
                          entry['member_profile_id'],
                          entry['nama_lengkap'].toString(),
                          bills['simpanan_wajib'].toString(),
                          bills['dana_sosial'].toString(),
                          bills['pokok'].toString(),
                          bills['bunga'].toString(),
                          bills['barang'].toString(),
                          bills['jangka_waktu'].toString(),
                          bills['jangka_waktu_ke'].toString(),
                          bills['sisa_tunggakan'].toString(),
                          bills['keterangan'].toString(),
                          tahun,
                          bulan,
                        );
                    ref
                        .watch(tagihanModeNotifierProvider.notifier)
                        .switchToUpdateTagihanMember();
                  },
                  icon: const Icon(
                    Icons.edit,
                    size: 18,
                    color: GlobalColors.primary,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    ref
                        .watch(
                            dataTransferMemberTagihanNotifierProvider.notifier)
                        .setData(
                          entry['member_profile_id'].toString(),
                          entry['nama_lengkap'].toString(),
                          entry['work_unit_id'].toString(),
                          entry['work_unit'].toString(),
                          entry['tahun'].toString(),
                          entry['bulan'].toString(),
                        );
                    ref
                        .watch(
                          tagihanModeNotifierProvider.notifier,
                        )
                        .switchToTransferTagihanMember();
                  },
                  icon: const Icon(
                    Icons.move_up,
                    size: 18,
                    color: GlobalColors.primary,
                  ),
                ),
                DeleteMemberTagihanWidget(
                  tahun: tahun,
                  workUnitId: workUnitId,
                  searchQuery: searchQuery,
                  perPage: perPage,
                  currentPage: currentPage,
                  bulan: bulan,
                  memberId: entry['member_profile_id'],
                )
              ],
            ),
          ];
        }).toList();

        final fixedColCells =
            bills.map((entry) => entry["nama_lengkap"].toString()).toList();

        final fixedRowCells = [
          "UNIT KERJA",
          "NOMOR ANGGOTA",
          "NAMA LENGKAP",
          "TAHUN",
          "BULAN",
          "SIMPANAN WAJIB",
          "DANA SOSIAL",
          "POKOK",
          "BUNGA",
          "BARANG",
          "JANGKA WAKTU",
          "JANGKA WAKTU KE",
          "JUMLAH TAGIHAN",
          "JUMLAH SETORAN",
          "SISA TUNGGAKAN",
          "KETERANGAN",
          'AKSI',
        ];

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.edit_document,
                    color: GlobalColors.primary,
                  ),
                  onPressed: () {
                    ref
                        .watch(
                          tagihanModeNotifierProvider.notifier,
                        )
                        .switchToeditTagihan();
                    ref
                        .watch(editTagihanNotifierProvider.notifier)
                        .setEditDataTagihan(
                          ref.watch(searchBillsProvider)['tahun'].toString(),
                          ref.watch(searchBillsProvider)['bulan'],
                        );
                  },
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
            Flexible(
              child: CustomDataTable(
                rowsCells: rowsCells,
                fixedColCells: fixedColCells,
                fixedRowCells: fixedRowCells,
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
                        style: const TextStyle(
                          color: GlobalColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }
                  return Text(
                    '$data',
                    style: const TextStyle(
                      color: GlobalColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
                fixedCornerCell: "NAMA LENGKAP",
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
                              .watch(searchBillsProvider.notifier)
                              .setSearchBills(currentPage: currentPage - 1);
                        }
                      : null,
                ),
                const SizedBox(width: 6),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: currentPage < ref.watch(totalPageBillsProvider)
                      ? () {
                          ref
                              .watch(searchBillsProvider.notifier)
                              .setSearchBills(currentPage: currentPage + 1);
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
