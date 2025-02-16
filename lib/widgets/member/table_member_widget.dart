import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/member_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/cutom_table_widget.dart';
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

        final rowsCells = members
            .map((entry) => [
                  entry["work_unit"],
                  entry["username"],
                  entry["nomor_anggota"],
                  entry["phone"],
                  entry["alamat"],
                  entry["tanggal_lahir"],
                  entry["jenis_kelamin"],
                  entry["nik"],
                  ...[
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: entry['status'].toString() == '1'
                          ? GlobalColors.secondary
                          : const Color.fromARGB(255, 250, 201, 201),
                      child: Icon(
                        entry['status'].toString() == '1'
                            ? Icons.check_circle
                            : Icons.cancel,
                        color: entry['status'].toString() == '1'
                            ? GlobalColors.primary
                            : Colors.redAccent,
                      ),
                    ),
                  ],
                ])
            .toList();

        final fixedColCells = members.map((entry) {
          return Row(
            children: [
              DeleteMemberWidget(id: entry['id'].toString()),
              IconButton(
                onPressed: () {
                  ref
                      .watch(idMemberNotifierProvider.notifier)
                      .setId(entry['id']);
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
              Flexible(child: Text(entry["nama_lengkap"].toString()))
            ],
          );
        }).toList();

        final fixedRowCells = [
          "UNIT KERJA",
          "USERNAME",
          "NOMOR ANGGOTA",
          "NOMOR TELEPON",
          "ALAMAT",
          "TANGGAL LAHIR",
          'JENIS KELAMIN',
          'NIK',
          'STATUS',
        ];

        Future.microtask(() {
          ref
              .watch(totalPageMemberProvider.notifier)
              .setTotalMember(member['pagination']['last_page']);
        });

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  cellWidthWidget: 100,
                  cellWidthFixCol: 250,
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
                    if (data == 'STATUS') {
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
            const SizedBox(height: 10),
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
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: currentPage > 1
                      ? () {
                          ref
                              .watch(searchMemberProvider.notifier)
                              .setSearchMember(currentPage: currentPage - 1);
                        }
                      : null,
                ),
                const SizedBox(width: 6),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: currentPage < ref.watch(totalPageMemberProvider)
                      ? () {
                          ref
                              .watch(searchMemberProvider.notifier)
                              .setSearchMember(currentPage: currentPage + 1);
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
