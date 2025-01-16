import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/member_provider.dart';
import 'package:aplikasi_kpri_desktop/providers/member_route_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/member/delete_member_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TableMemberWidget extends ConsumerWidget {
  const TableMemberWidget({
    super.key,
    required this.selectedUnit,
    required this.searchQuery,
    required this.status,
    required this.perPage,
    required this.currentPage,
  });

  final String searchQuery;
  final String status;
  final int selectedUnit;
  final int perPage;
  final int currentPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getAllMember = ref.watch(getAllMemberProvider(
      searchQuery,
      selectedUnit,
      status,
      perPage,
      currentPage,
    ));
    return getAllMember.when(
      data: (member) {
        if (member == null) {
          return const Text("Data tidak valid");
        }
        if (member is ErrorResponse || member is! Map<String, dynamic>) {
          return SizedBox(
              width: double.infinity, child: Text(member.toString()));
        }
        final List<dynamic> memberResponse = member['data'];

        int totalPage = member['pagination']['last_page'];
        int currentPage = member['pagination']['current_page'];
        int totalMember = member['pagination']['total'];

        List<dynamic> members = memberResponse;

        Future.microtask(() {
          ref
              .watch(totalPageMemberProvider.notifier)
              .setTotalMember(member['pagination']['last_page']);
        });

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            const SizedBox(height: 8),
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
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: <TableRow>[
                  TableRow(
                    decoration:
                        const BoxDecoration(color: GlobalColors.headerTable),
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
                          "ID",
                          style: TextStyle(
                            color: GlobalColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "NAMA ANGGOTA",
                          style: TextStyle(
                            color: GlobalColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "JENIS KELAMIN",
                          style: TextStyle(
                            color: GlobalColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "USERNAME",
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
                          "NIP",
                          style: TextStyle(
                            color: GlobalColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "NIK",
                          style: TextStyle(
                            color: GlobalColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "NOMOR HP",
                          style: TextStyle(
                            color: GlobalColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "ALAMAT",
                          style: TextStyle(
                            color: GlobalColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "TANGGAL LAHIR",
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
                          "STATUS",
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
                  for (int i = 0; i < members.length; i++)
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
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(9),
                            child: Text(
                              members[i]['id'].toString(),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            members[i]['nama_lengkap'].toString(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            members[i]['jenis_kelamin'].toString(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            members[i]['username'].toString(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            members[i]['nomor_anggota'].toString(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            members[i]['nip'].toString(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            members[i]['nik'].toString(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            members[i]['phone'].toString(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            members[i]['alamat'].toString(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            members[i]['tanggal_lahir'].toString(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            members[i]['work_unit'].toString(),
                          ),
                        ),
                        CircleAvatar(
                          radius: 16,
                          backgroundColor:
                              members[i]['status'].toString() == '1'
                                  ? GlobalColors.secondary
                                  : const Color.fromARGB(255, 250, 201, 201),
                          child: Icon(
                            members[i]['status'].toString() == '1'
                                ? Icons.check_circle
                                : Icons.cancel,
                            color: members[i]['status'].toString() == '1'
                                ? GlobalColors.primary
                                : Colors.redAccent,
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
                                            idMemberNotifierProvider.notifier)
                                        .setId(members[i]['id']);
                                    ref
                                        .watch(
                                          memberModeNotifierProvider.notifier,
                                        )
                                        .switchToUpdateUser();
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    size: 18,
                                    color: GlobalColors.primary,
                                  ),
                                ),
                              ),
                              DeleteMemberWidget(
                                  id: members[i]['id'].toString())
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
