import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/saving_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/work_units_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    final getAllSavingMembers =
        ref.watch(getAllSavingMembersProvider(tahunController.text));
    return CustomCardWidget(
      color: GlobalColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                    onSelected: (String value) {},
                    onSelectedNameUnit: (String value) => setState(() {
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
                  final unitKerja = m['workUnit'].toString().toLowerCase();
                  return unitKerja.contains(selectedUnit.toLowerCase());
                }).toList();
              }

              if (searchQuery.isNotEmpty) {
                savings = savings.where((m) {
                  final fullName = m['memberName'].toString().toLowerCase();
                  return fullName.contains(searchQuery.toLowerCase());
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
                      ButtonWidget(text: "Update", onTap: () {})
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
                                  paginatedSavings[i]['memberId'].toString(),
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
                                paginatedSavings[i]['memberName'].toString(),
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
                                  paginatedSavings[i]['workUnit'].toString(),
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
                                  paginatedSavings[i]['year'].toString(),
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
                                  paginatedSavings[i]['month'].toString(),
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
                                    text: paginatedSavings[i]['principal']
                                        .toString(),
                                  ),
                                  focusNode: FocusNode(),
                                  cursorColor: GlobalColors.primary,
                                  backgroundCursorColor: GlobalColors.secondary,
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
                                    text: paginatedSavings[i]['mandatory']
                                        .toString(),
                                  ),
                                  focusNode: FocusNode(),
                                  cursorColor: GlobalColors.primary,
                                  backgroundCursorColor: GlobalColors.secondary,
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
                                    text: paginatedSavings[i]['voluntary']
                                        .toString(),
                                  ),
                                  focusNode: FocusNode(),
                                  cursorColor: GlobalColors.primary,
                                  backgroundCursorColor: GlobalColors.secondary,
                                  style: const TextStyle(
                                    color: GlobalColors.onBackground,
                                    fontWeight: FontWeight.w500,
                                  ),
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
                        child: const Text('Previous'),
                      ),
                      Text(
                        'Page ${currentPage + 1} of ${(savings.length / rowsPerPage).ceil()}',
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
                        child: const Text('Next'),
                      ),
                    ],
                  ),
                ],
              );
            },
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const LinearProgressIndicator(),
          )
        ],
      ),
    );
  }
}
