import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/setting_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/cutom_table_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/setting/deleteFixedSetting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TableFixedSettingWidget extends ConsumerWidget {
  const TableFixedSettingWidget({
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
    final dataFixedSetting = ref.watch(getAllFixedSettingProvider(
      searchQuery,
      perPage,
      currentPage,
    ));
    return dataFixedSetting.when(
      data: (fixedSetting) {
        if (fixedSetting == null) {
          return const Text("Data tidak valid");
        }
        if (fixedSetting is ErrorResponse ||
            fixedSetting is! Map<String, dynamic>) {
          return Text(fixedSetting.toString());
        }
        final List<dynamic> fixedSettingResponse = fixedSetting['data'];

        int totalPage = fixedSetting['pagination']['last_page'];
        int currentPage = fixedSetting['pagination']['current_page'];
        int totalMember = fixedSetting['pagination']['total'];

        List<dynamic> fixedSettings = fixedSettingResponse;

        final rowsCells = fixedSettings
            .map((entry) => [
                  entry["statusenabled"],
                  entry["nilai"],
                  entry["deskripsi"],
                  ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          child: IconButton(
                            onPressed: () {
                              ref
                                  .watch(idFixedSettingProvider.notifier)
                                  .setId(entry['id']);
                              ref
                                  .watch(
                                    settingModeNotifierProvider.notifier,
                                  )
                                  .switchToEditFixedSetting();
                            },
                            icon: const Icon(
                              Icons.edit,
                              size: 18,
                              color: GlobalColors.primary,
                            ),
                          ),
                        ),
                        DeleteFixedSettingWidget(id: entry['id'].toString())
                      ],
                    ),
                  ],
                ])
            .toList();

        final fixedColCells =
            fixedSettings.map((entry) => entry["nama"].toString()).toList();

        final fixedRowCells = [
          "STATUS SETTING",
          "NILAI",
          'DESKRIPSI',
          'AKSI',
        ];

        Future.microtask(() {
          ref
              .watch(totalFixedSettingProvider.notifier)
              .setTotalMember(fixedSetting['pagination']['last_page']);
        });

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(10),
                width: 1000,
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
                  cellWidth: 250,
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
                  fixedCornerCell: "NAMA",
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
                              .watch(searchFixedSettingProvider.notifier)
                              .setSearchUsers(currentPage: currentPage - 1);
                        }
                      : null,
                ),
                const SizedBox(width: 6),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: currentPage < ref.watch(totalFixedSettingProvider)
                      ? () {
                          ref
                              .watch(searchFixedSettingProvider.notifier)
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
      loading: () => const Align(
        alignment: Alignment.topCenter,
        child: LinearProgressIndicator(),
      ),
    );
  }
}
