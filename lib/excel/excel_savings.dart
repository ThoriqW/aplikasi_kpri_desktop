import 'dart:math';

import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/saving_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:excel/excel.dart';
import 'dart:io';

class ExcelSavings extends ConsumerStatefulWidget {
  const ExcelSavings({
    super.key,
    required this.bulan,
    required this.tahun,
    required this.workUnitId,
  });

  final List<String> bulan;
  final int tahun;
  final int workUnitId;

  @override
  ConsumerState<ExcelSavings> createState() => _ExcelSavingsState();
}

class _ExcelSavingsState extends ConsumerState<ExcelSavings> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: const Icon(
            Icons.download,
            color: GlobalColors.primary,
          ),
          onPressed: _isLoading
              ? null
              : () {
                  exportExcel();
                },
        ),
        if (_isLoading)
          const Positioned.fill(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }

  Future<void> exportExcel() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final data = await ref.read(
        getAllSavingMembersProvider(
          widget.tahun,
          widget.workUnitId,
          '',
          0,
          0,
        ).future,
      ) as Map<String, dynamic>;
      if (data.isEmpty ||
          data['data'] == null ||
          (data['data'] as List).isEmpty) {
        if (!mounted) return;
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Berhasil"),
            content: const Text("Tidak ada data ditemukan!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          ),
        );
      }

      List<dynamic> savings = data['data'] ?? [];
      List<String> header = [
        "NO",
        "UNIT KERJA",
        "NOMOR ANGGOTA",
        "NAMA LENGKAP",
        "TAHUN",
        ...widget.bulan,
        "TOTAL SIMPANAN",
      ];
      List<String> subHeader = [
        "POKOK",
        "WAJIB",
        "SUKA RELA",
      ];
      List<String> colorSubHeader = [
        "#16423C",
        "#0D7C66",
        "#00712D",
      ];
      List<String> propertyHeaderSavings = [
        "work_unit",
        "nomor_anggota",
        "nama_lengkap",
        "tahun",
      ];

      Excel excel = Excel.createExcel();
      excel.rename('Sheet1', savings[0]['work_unit'].toString());
      Sheet sheet = excel[savings[0]['work_unit'].toString()];

      //HEADER
      for (int i = 0; i < header.length; i++) {
        if (i > 4) {
          int startColumn = 5 + (i - 5) * 3;
          int endColumn = startColumn + 2;
          if (i == header.length - 1) {
            sheet.merge(
                CellIndex.indexByColumnRow(
                    columnIndex: startColumn, rowIndex: 0),
                CellIndex.indexByColumnRow(
                    columnIndex: startColumn, rowIndex: 1),
                customValue: TextCellValue(header[i].toUpperCase()));
            var cell = sheet.cell(CellIndex.indexByColumnRow(
                columnIndex: startColumn, rowIndex: 0));
            cell.cellStyle = CellStyle(
              bold: true,
              backgroundColorHex: ExcelColor.fromHexString("#CDE5DB"),
              horizontalAlign: HorizontalAlign.Center,
              verticalAlign: VerticalAlign.Center,
            );
          } else {
            sheet.merge(
              CellIndex.indexByColumnRow(
                columnIndex: startColumn,
                rowIndex: 0,
              ),
              CellIndex.indexByColumnRow(
                columnIndex: endColumn,
                rowIndex: 0,
              ),
              customValue: TextCellValue(
                header[i].toUpperCase(),
              ),
            );
            var cell = sheet.cell(CellIndex.indexByColumnRow(
                columnIndex: startColumn, rowIndex: 0));
            cell.cellStyle = CellStyle(
              bold: true,
              fontColorHex: ExcelColor.fromHexString("#FFFFFF"),
              backgroundColorHex: ExcelColor.fromHexString("#58A399"),
              horizontalAlign: HorizontalAlign.Center,
              verticalAlign: VerticalAlign.Center,
            );
            for (int j = 0; j < subHeader.length; j++) {
              var cell = sheet.cell(CellIndex.indexByColumnRow(
                  columnIndex: startColumn + j, rowIndex: 1));
              cell.value = TextCellValue(subHeader[j]);
              cell.cellStyle = CellStyle(
                bold: true,
                fontColorHex: ExcelColor.fromHexString("#FFFFFF"),
                backgroundColorHex: ExcelColor.fromHexString(colorSubHeader[j]),
                horizontalAlign: HorizontalAlign.Center,
                verticalAlign: VerticalAlign.Center,
              );
            }
          }
        } else {
          sheet.merge(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0),
              CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 1),
              customValue: TextCellValue(header[i].toUpperCase()));
          var cell = sheet
              .cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0));
          cell.cellStyle = CellStyle(
            bold: true,
            backgroundColorHex: ExcelColor.fromHexString("#CDE5DB"),
            horizontalAlign: HorizontalAlign.Center,
            verticalAlign: VerticalAlign.Center,
          );
        }
      }

      //ISI
      for (int n = 0; n < savings.length; n++) {
        var cell = sheet
            .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 2 + n));
        cell.value = IntCellValue(n + 1);
        cell.cellStyle = CellStyle(
          horizontalAlign: HorizontalAlign.Center,
          verticalAlign: VerticalAlign.Center,
        );
        for (int s = 0; s < propertyHeaderSavings.length; s++) {
          if (propertyHeaderSavings[s] == "tahun") {
            var cell = sheet.cell(CellIndex.indexByColumnRow(
                columnIndex: s + 1, rowIndex: 2 + n));
            cell.value = IntCellValue(savings[n][propertyHeaderSavings[s]]);
            cell.cellStyle = CellStyle(
              horizontalAlign: HorizontalAlign.Center,
              verticalAlign: VerticalAlign.Center,
            );
          } else {
            var cell = sheet.cell(CellIndex.indexByColumnRow(
                columnIndex: s + 1, rowIndex: 2 + n));
            cell.value =
                TextCellValue(savings[n][propertyHeaderSavings[s]].toString());
            cell.cellStyle = CellStyle(
              horizontalAlign: HorizontalAlign.Center,
              verticalAlign: VerticalAlign.Center,
            );
          }
        }

        for (int t = 0; t < savings[n]['savings'].length; t++) {
          int startColumn = 5 + t * 3;
          var cellPokok = sheet.cell(CellIndex.indexByColumnRow(
              columnIndex: startColumn, rowIndex: 2 + n));
          cellPokok.value = TextCellValue(
            NumberFormat.currency(
              locale: 'id',
              symbol: 'Rp',
              decimalDigits: 0,
            ).format(
              double.parse(
                savings[n]['savings'][t]['pokok'],
              ),
            ),
          );
          cellPokok.cellStyle = CellStyle(
            horizontalAlign: HorizontalAlign.Center,
            verticalAlign: VerticalAlign.Center,
          );
          var cellWajib = sheet.cell(CellIndex.indexByColumnRow(
              columnIndex: startColumn + 1, rowIndex: 2 + n));
          cellWajib.value = TextCellValue(
            NumberFormat.currency(
              locale: 'id',
              symbol: 'Rp',
              decimalDigits: 0,
            ).format(
              double.parse(
                savings[n]['savings'][t]['wajib'],
              ),
            ),
          );
          cellWajib.cellStyle = CellStyle(
            horizontalAlign: HorizontalAlign.Center,
            verticalAlign: VerticalAlign.Center,
          );
          var cellSukaRela = sheet.cell(CellIndex.indexByColumnRow(
              columnIndex: startColumn + 2, rowIndex: 2 + n));
          cellSukaRela.value = TextCellValue(
            NumberFormat.currency(
              locale: 'id',
              symbol: 'Rp',
              decimalDigits: 0,
            ).format(
              double.parse(
                savings[n]['savings'][t]['sukarela'],
              ),
            ),
          );
          cellSukaRela.cellStyle = CellStyle(
            horizontalAlign: HorizontalAlign.Center,
            verticalAlign: VerticalAlign.Center,
          );
        }
        var cellTotalSimpanan = sheet.cell(CellIndex.indexByColumnRow(
            columnIndex: sheet.maxColumns - 1, rowIndex: 2 + n));
        cellTotalSimpanan.value = TextCellValue(
          NumberFormat.currency(
            locale: 'id',
            symbol: 'Rp',
            decimalDigits: 0,
          ).format(
            double.parse(
              savings[n]['total_savings'].toString(),
            ),
          ),
        );
        cellTotalSimpanan.cellStyle = CellStyle(
          horizontalAlign: HorizontalAlign.Center,
          verticalAlign: VerticalAlign.Center,
        );
      }

      // AUTOFIT LOGIC
      int columnCount = sheet.maxColumns;
      int rowCount = sheet.maxRows;

      for (int col = 0; col <= columnCount; col++) {
        int maxLength = 0;

        for (int row = 0; row <= rowCount; row++) {
          var cell = sheet.cell(
              CellIndex.indexByColumnRow(columnIndex: col, rowIndex: row));
          var cellValue = cell.value?.toString() ?? '';
          maxLength = max(maxLength, cellValue.length);
        }
        sheet.setColumnWidth(col, (maxLength + 5).toDouble());
      }

      final directory = await getApplicationDocumentsDirectory();
      String path =
          '${directory.path}/Simpanan Anggota ${savings[0]['work_unit'].toString()}.xlsx';

      final bytes = excel.save();
      File(path)
        ..createSync(recursive: true)
        ..writeAsBytesSync(bytes!);
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Berhasil"),
          content: const Text("Simpanan berhasil disimpan!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    } catch (e) {
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Error"),
          content: Text("Gagal menyimpan file: $e"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
