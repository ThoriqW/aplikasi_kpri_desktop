import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/saving_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/saving/table_simpanan_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/work_unit/work_units_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataSimpananWidget extends ConsumerStatefulWidget {
  const DataSimpananWidget({super.key});

  @override
  ConsumerState<DataSimpananWidget> createState() => _DataSimpananWidgetState();
}

class _DataSimpananWidgetState extends ConsumerState<DataSimpananWidget> {
  final TextEditingController tahunController = TextEditingController();
  String selectedUnit = '';
  int selectedYear = DateTime.now().year;

  late Widget pilihWorkUnit = const Text(
    "Silahkan pilih unit kerja",
    style: TextStyle(
      fontStyle: FontStyle.italic,
    ),
  );

  @override
  void initState() {
    super.initState();
    tahunController.text = selectedYear.toString();
  }

  @override
  void dispose() {
    tahunController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      color: GlobalColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Simpanan Anggota",
            style: TextStyle(
              color: GlobalColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    "Pilih Tahun Simpanan",
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
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () async {
                      if (selectedUnit != '') {
                        setState(
                          () {
                            ref.invalidate(
                              getAllSavingMembersProvider(tahunController.text,
                                  int.parse(selectedUnit)),
                            );
                          },
                        );
                      } else {
                        await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const CustomAlertDialog(
                              alertDesc:
                                  "Silahkan pilih unit kerja terlebih dahulu",
                              alertTitle: "Info",
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Pilih Unit Kerja",
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
          selectedUnit != ''
              ? TableSimpananWidget(
                  tahun: tahunController.text,
                  workUnitId: int.parse(selectedUnit))
              : pilihWorkUnit
        ],
      ),
    );
  }
}
