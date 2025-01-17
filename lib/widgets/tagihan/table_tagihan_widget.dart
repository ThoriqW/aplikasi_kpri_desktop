import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/bills_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
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
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "BULAN",
                          style: TextStyle(
                            color: GlobalColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "SIMPANAN WAJIB",
                          style: TextStyle(
                            color: GlobalColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "DANA SOSIAL",
                          style: TextStyle(
                            color: GlobalColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "POKOK",
                          style: TextStyle(
                            color: GlobalColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "BUNGA",
                          style: TextStyle(
                            color: GlobalColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "BARANG",
                          style: TextStyle(
                            color: GlobalColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "JANGKA WAKTU",
                          style: TextStyle(
                            color: GlobalColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "JANGKA WAKTU KE",
                          style: TextStyle(
                            color: GlobalColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "JUMLAH TAGIHAN",
                          style: TextStyle(
                            color: GlobalColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "JUMLAH SETORAN",
                          style: TextStyle(
                            color: GlobalColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "SISA TUNGGAKAN",
                          style: TextStyle(
                            color: GlobalColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "KETERANGAN",
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
                  for (int i = 0; i < bills.length; i++)
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
                            bills[i]['work_unit'].toString(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            bills[i]['nomor_anggota'].toString(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            bills[i]['nama_lengkap'].toString(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            bills[i]['tahun'].toString(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            bills[i]['bulan'].toString(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            bills[i]['bills'][0]['simpanan_wajib'].toString() !=
                                    '0.00'
                                ? NumberFormat.currency(
                                    locale: 'id',
                                    symbol: '',
                                    decimalDigits: 0,
                                  ).format(
                                    double.parse(
                                      bills[i]['bills'][0]['simpanan_wajib']
                                          .toString(),
                                    ),
                                  )
                                : '',
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            bills[i]['bills'][0]['dana_sosial'].toString() !=
                                    '0.00'
                                ? NumberFormat.currency(
                                    locale: 'id',
                                    symbol: '',
                                    decimalDigits: 0,
                                  ).format(
                                    double.parse(
                                      bills[i]['bills'][0]['dana_sosial']
                                          .toString(),
                                    ),
                                  )
                                : '',
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            bills[i]['bills'][0]['pokok'].toString() != '0.00'
                                ? NumberFormat.currency(
                                    locale: 'id',
                                    symbol: '',
                                    decimalDigits: 0,
                                  ).format(
                                    double.parse(
                                      bills[i]['bills'][0]['pokok'].toString(),
                                    ),
                                  )
                                : '',
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            bills[i]['bills'][0]['bunga'].toString() != '0.00'
                                ? NumberFormat.currency(
                                    locale: 'id',
                                    symbol: '',
                                    decimalDigits: 0,
                                  ).format(
                                    double.parse(
                                      bills[i]['bills'][0]['bunga'].toString(),
                                    ),
                                  )
                                : '',
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            bills[i]['bills'][0]['barang'].toString() != '0.00'
                                ? NumberFormat.currency(
                                    locale: 'id',
                                    symbol: '',
                                    decimalDigits: 0,
                                  ).format(
                                    double.parse(
                                      bills[i]['bills'][0]['barang'].toString(),
                                    ),
                                  )
                                : '',
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            bills[i]['bills'][0]['jangka_waktu'].toString() !=
                                    '0'
                                ? bills[i]['bills'][0]['jangka_waktu']
                                    .toString()
                                : '',
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(bills[i]['bills'][0]['jangka_waktu_ke']
                                      .toString() !=
                                  '0'
                              ? bills[i]['bills'][0]['jangka_waktu_ke']
                                  .toString()
                              : ''),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            bills[i]['bills'][0]['jumlah_tagihan'].toString() !=
                                    '0.00'
                                ? NumberFormat.currency(
                                    locale: 'id',
                                    symbol: '',
                                    decimalDigits: 0,
                                  ).format(
                                    double.parse(
                                      bills[i]['bills'][0]['jumlah_tagihan']
                                          .toString(),
                                    ),
                                  )
                                : '',
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            bills[i]['bills'][0]['jumlah_setoran'].toString() !=
                                    '0.00'
                                ? NumberFormat.currency(
                                    locale: 'id',
                                    symbol: '',
                                    decimalDigits: 0,
                                  ).format(
                                    double.parse(
                                      bills[i]['bills'][0]['jumlah_setoran']
                                          .toString(),
                                    ),
                                  )
                                : '',
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            bills[i]['bills'][0]['sisa_tunggakan'].toString() !=
                                    '0.00'
                                ? NumberFormat.currency(
                                    locale: 'id',
                                    symbol: '',
                                    decimalDigits: 0,
                                  ).format(
                                    double.parse(
                                      bills[i]['bills'][0]['sisa_tunggakan']
                                          .toString(),
                                    ),
                                  )
                                : '',
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                              bills[i]['bills'][0]['keterangan'].toString()),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(2),
                              child: IconButton(
                                onPressed: () {
                                  ref
                                      .watch(dataMemberTagihanNotifierProvider
                                          .notifier)
                                      .setData(
                                        bills[i]['member_profile_id'],
                                        bills[i]['nama_lengkap'].toString(),
                                        bills[i]['bills'][0]['simpanan_wajib']
                                            .toString(),
                                        bills[i]['bills'][0]['dana_sosial']
                                            .toString(),
                                        bills[i]['bills'][0]['pokok']
                                            .toString(),
                                        bills[i]['bills'][0]['bunga']
                                            .toString(),
                                        bills[i]['bills'][0]['barang']
                                            .toString(),
                                        bills[i]['bills'][0]['jangka_waktu']
                                            .toString(),
                                        bills[i]['bills'][0]['jangka_waktu_ke']
                                            .toString(),
                                        bills[i]['bills'][0]['sisa_tunggakan']
                                            .toString(),
                                        bills[i]['bills'][0]['keterangan']
                                            .toString(),
                                        tahun,
                                        bulan,
                                      );
                                  ref
                                      .watch(
                                          tagihanModeNotifierProvider.notifier)
                                      .switchToeditTagihanMember();
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
                                  ref
                                      .watch(
                                          dataTransferMemberTagihanNotifierProvider
                                              .notifier)
                                      .setData(
                                        bills[i]['member_profile_id']
                                            .toString(),
                                        bills[i]['nama_lengkap'].toString(),
                                        bills[i]['work_unit_id'].toString(),
                                        bills[i]['work_unit'].toString(),
                                        bills[i]['tahun'].toString(),
                                        bills[i]['bulan'].toString(),
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
                            ),
                            DeleteMemberTagihanWidget(
                              tahun: tahun,
                              workUnitId: workUnitId,
                              searchQuery: searchQuery,
                              perPage: perPage,
                              currentPage: currentPage,
                              bulan: bulan,
                              memberId: bills[i]['member_profile_id'],
                            )
                          ],
                        ),
                      ],
                    )
                ],
              ),
            )
          ],
        );
      },
      error: (error, stackTrace) => const Text('Gagal terhubung ke server!!'),
      loading: () => const LinearProgressIndicator(),
    );
  }
}
