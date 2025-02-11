import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/admin_provider.dart';
import 'package:aplikasi_kpri_desktop/providers/user_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/cutom_table_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/user/delete_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TableUserWidget extends ConsumerWidget {
  const TableUserWidget({
    super.key,
    required this.searchQuery,
    required this.perPage,
    required this.currentPage,
  });

  final String searchQuery;
  final int perPage;
  final int currentPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataUsers = ref.watch(getAllUserProvider(
      searchQuery,
      perPage,
      currentPage,
    ));
    return dataUsers.when(
      data: (user) {
        if (user == null) {
          return const Text("Data tidak valid");
        }
        if (user is ErrorResponse || user is! Map<String, dynamic>) {
          return Text(user.toString());
        }
        final List<dynamic> userResponse = user['data'];

        int totalPage = user['pagination']['last_page'];
        int currentPage = user['pagination']['current_page'];
        int totalMember = user['pagination']['total'];

        List<dynamic> users = userResponse;

        final rowsCells = users
            .map((entry) => [
                  entry["id"],
                  entry["username"],
                  entry["role"],
                ])
            .toList();

        final fixedColCells = users.map((entry) {
          return Row(
            children: [
              DeleteUserWidget(id: entry['id'].toString()),
              Container(
                padding: const EdgeInsets.all(2),
                child: IconButton(
                  onPressed: () {
                    ref
                        .watch(idUserNotifierProvider.notifier)
                        .setId(entry['id']);
                    ref
                        .watch(
                          adminModeNotifierProvider.notifier,
                        )
                        .switchToEditUser();
                  },
                  icon: const Icon(
                    Icons.edit,
                    size: 18,
                    color: GlobalColors.primary,
                  ),
                ),
              ),
              Flexible(child: Text(entry["nama_lengkap"].toString())),
            ],
          );
        }).toList();

        final fixedRowCells = [
          "ID",
          "USERNAME",
          "ROLE",
        ];

        Future.microtask(() {
          ref
              .watch(totalPageUsersProvider.notifier)
              .setTotalMember(user['pagination']['last_page']);
        });

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(10),
                width: 800,
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
                  cellHeight: 40,
                  cellWidth: 200,
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
              children: [
                Text(
                  'Halaman $currentPage dari $totalPage',
                ),
                const SizedBox(width: 20),
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
                              .watch(searchUsersProvider.notifier)
                              .setSearchUsers(currentPage: currentPage - 1);
                        }
                      : null,
                ),
                const SizedBox(width: 6),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: currentPage < ref.watch(totalPageUsersProvider)
                      ? () {
                          ref
                              .watch(searchUsersProvider.notifier)
                              .setSearchUsers(currentPage: currentPage + 1);
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
