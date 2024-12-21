import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/saving_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/create_simpanan_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/work_units_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DataSimpananWidget extends ConsumerStatefulWidget {
  const DataSimpananWidget({super.key});

  @override
  ConsumerState<DataSimpananWidget> createState() => _DataSimpananWidgetState();
}

class _DataSimpananWidgetState extends ConsumerState<DataSimpananWidget> {
  final TextEditingController bulanController = TextEditingController();
  final TextEditingController tahunController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  String selectedUnit = '';
  String searchQuery = '';
  int currentPage = 0;
  final int rowsPerPage = 12;
  int selectedYear = DateTime.now().year;

  Map<String, Map<String, dynamic>> updateSavingsObject = {};

  @override
  void initState() {
    super.initState();
    tahunController.text = selectedYear.toString();
  }

  @override
  void dispose() {
    bulanController.dispose();
    tahunController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final getAllSavingMembers = ref.watch(
      getAllSavingMembersProvider(tahunController.text),
    );

    return CustomCardWidget(
      color: GlobalColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Simpanan Anggota",
            style: TextStyle(
                color: GlobalColors.primary, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    "Pilih Tahun Simpanan",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 300,
                    child: Row(
                      children: [
                        Flexible(
                          child: TextFormWidget(
                              controller: tahunController, text: "Tahun"),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                  ButtonWidget(
                    text: "Cari",
                    onTap: () {
                      setState(
                        () {
                          ref.invalidate(
                            getAllSavingMembersProvider(tahunController.text),
                          );
                        },
                      );
                    },
                  )
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Pilih Unit Kerja",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 24),
                  WorkUnitsDropdown(
                    onSelected: (String value) => setState(() {
                      selectedUnit = value;
                    }),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          getAllSavingMembers.when(
            data: (saving) {
              List<dynamic> savings = saving as List<dynamic>;

              if (selectedUnit.isNotEmpty) {
                savings = savings.where((m) {
                  final unitKerja = m['work_unit_id'].toString().toLowerCase();
                  return unitKerja.contains(selectedUnit.toLowerCase());
                }).toList();
              }

              if (searchQuery.isNotEmpty) {
                savings = savings.where((m) {
                  final namaLengkap =
                      m['nama_lengkap'].toString().toLowerCase();
                  return namaLengkap.contains(searchQuery.toLowerCase());
                }).toList();
              }

              int startIndex = currentPage * rowsPerPage;
              int endIndex = (startIndex + rowsPerPage < savings.length)
                  ? startIndex + rowsPerPage
                  : savings.length;
              List<dynamic> paginatedSavings =
                  savings.sublist(startIndex, endIndex);

              return Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextField(
                            controller: searchController,
                            onChanged: (value) {
                              setState(() {
                                searchQuery = value;
                                currentPage = 0;
                              });
                            },
                            decoration: const InputDecoration(
                              prefixIcon:
                                  Icon(Icons.search, color: Colors.grey),
                              hintText: 'Cari Anggota',
                              border: InputBorder.none,
                              filled: true,
                              fillColor: GlobalColors.background,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 18),
                      ButtonWidget(
                          text: "Update",
                          onTap: () {
                            updateDataSavings(
                                int.parse(tahunController.text), 1);
                          })
                    ],
                  ),
                  Table(
                    border: TableBorder.all(color: GlobalColors.header),
                    columnWidths: const <int, TableColumnWidth>{
                      0: IntrinsicColumnWidth(),
                      1: IntrinsicColumnWidth(),
                      2: FlexColumnWidth(),
                      3: IntrinsicColumnWidth(),
                      4: IntrinsicColumnWidth(),
                      5: IntrinsicColumnWidth(),
                      6: IntrinsicColumnWidth(),
                      7: IntrinsicColumnWidth(),
                      8: IntrinsicColumnWidth(),
                      9: IntrinsicColumnWidth(),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: <TableRow>[
                      TableRow(
                        decoration: const BoxDecoration(),
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(9),
                            child: const Text(
                              "No",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(9),
                            child: const Text(
                              "ID",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(9),
                            child: const Text(
                              "Nama Anggota",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(9),
                              child: const Text(
                                "Unit Kerja",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(9),
                              child: const Text(
                                "Tahun",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(9),
                              child: const Text(
                                "Bulan",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(9),
                              child: const Text(
                                "Utama",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(9),
                              child: const Text(
                                "Wajib",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(9),
                              child: const Text(
                                "Suka Rela",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      for (int i = 0; i < paginatedSavings.length; i++)
                        TableRow(
                          decoration: const BoxDecoration(),
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(9),
                              child: Text(
                                (i + 1).toString(),
                                style: const TextStyle(
                                  color: GlobalColors.onBackground,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                padding: const EdgeInsets.all(9),
                                child: Text(
                                  paginatedSavings[i]['nomor_anggota']
                                      .toString(),
                                  style: const TextStyle(
                                    color: GlobalColors.onBackground,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(9),
                              child: Text(
                                paginatedSavings[i]['nama_lengkap'].toString(),
                                style: const TextStyle(
                                  color: GlobalColors.onBackground,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                padding: const EdgeInsets.all(9),
                                child: Text(
                                  paginatedSavings[i]['work_unit'].toString(),
                                  style: const TextStyle(
                                    color: GlobalColors.onBackground,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                padding: const EdgeInsets.all(9),
                                child: Text(
                                  paginatedSavings[i]['tahun'].toString(),
                                  style: const TextStyle(
                                    color: GlobalColors.onBackground,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                padding: const EdgeInsets.all(9),
                                child: Text(
                                  paginatedSavings[i]['bulan'].toString(),
                                  style: const TextStyle(
                                    color: GlobalColors.onBackground,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                padding: const EdgeInsets.all(9),
                                child: EditableText(
                                  controller: TextEditingController(
                                    text: NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'Rp',
                                      decimalDigits: 0,
                                    ).format(
                                      double.parse(
                                        paginatedSavings[i]['pokok'].toString(),
                                      ),
                                    ),
                                  ),
                                  focusNode: FocusNode(),
                                  cursorColor: GlobalColors.primary,
                                  backgroundCursorColor: GlobalColors.secondary,
                                  style: const TextStyle(
                                    color: GlobalColors.onBackground,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  onSubmitted: (newPokok) {
                                    updateValueSaving(
                                      updateSavingsObject,
                                      paginatedSavings[i]['member_profile_id']
                                          .toString(),
                                      paginatedSavings[i]['bulan'].toString(),
                                      'pokok',
                                      newPokok,
                                    );
                                  },
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                padding: const EdgeInsets.all(9),
                                child: EditableText(
                                  controller: TextEditingController(
                                    text: NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'Rp',
                                      decimalDigits: 0,
                                    ).format(
                                      double.parse(
                                        paginatedSavings[i]['wajib'].toString(),
                                      ),
                                    ),
                                  ),
                                  focusNode: FocusNode(),
                                  cursorColor: GlobalColors.primary,
                                  backgroundCursorColor: GlobalColors.secondary,
                                  style: const TextStyle(
                                    color: GlobalColors.onBackground,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  onSubmitted: (newWajib) {
                                    updateValueSaving(
                                      updateSavingsObject,
                                      paginatedSavings[i]['member_profile_id']
                                          .toString(),
                                      paginatedSavings[i]['bulan'].toString(),
                                      'wajib',
                                      newWajib,
                                    );
                                  },
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                padding: const EdgeInsets.all(9),
                                child: EditableText(
                                  controller: TextEditingController(
                                    text: NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'Rp',
                                      decimalDigits: 0,
                                    ).format(
                                      double.parse(
                                        paginatedSavings[i]['pokok'].toString(),
                                      ),
                                    ),
                                  ),
                                  focusNode: FocusNode(),
                                  cursorColor: GlobalColors.primary,
                                  backgroundCursorColor: GlobalColors.secondary,
                                  style: const TextStyle(
                                    color: GlobalColors.onBackground,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  onSubmitted: (newSukarela) {
                                    updateValueSaving(
                                      updateSavingsObject,
                                      paginatedSavings[i]['member_profile_id']
                                          .toString(),
                                      paginatedSavings[i]['bulan'].toString(),
                                      'sukarela',
                                      newSukarela,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: currentPage > 0
                            ? () {
                                setState(() {
                                  currentPage--;
                                });
                              }
                            : null,
                        child: const Text('Sebelumnya'),
                      ),
                      Text(
                        'Halaman ${currentPage + 1} dari ${(savings.length / rowsPerPage).ceil()}',
                      ),
                      ElevatedButton(
                        onPressed:
                            (currentPage + 1) * rowsPerPage < savings.length
                                ? () {
                                    setState(() {
                                      currentPage++;
                                    });
                                  }
                                : null,
                        child: const Text('Selanjutnya'),
                      ),
                    ],
                  ),
                ],
              );
            },
            error: (error, stackTrace) => CreateSimpananWidget(
              tahun: tahunController.text,
              onComplete: () {
                ref.invalidate(
                    getAllSavingMembersProvider(tahunController.text));
              },
            ),
            loading: () => const LinearProgressIndicator(),
          )
        ],
      ),
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
      updateSavingsObject[key]![bulan] = {
        "pokok": 0,
        "wajib": 0,
        "sukarela": 0,
      };
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
        ).then((_) =>
            ref.invalidate(getAllSavingMembersProvider(tahunController.text)));
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
}
