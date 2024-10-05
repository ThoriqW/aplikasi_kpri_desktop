import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/member_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/datepicker_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/work_units_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class AddMemberWidget extends ConsumerStatefulWidget {
  const AddMemberWidget({super.key, required this.onComplete});

  final VoidCallback onComplete;

  @override
  ConsumerState<AddMemberWidget> createState() => _AddMemberWidgetState();
}

class _AddMemberWidgetState extends ConsumerState<AddMemberWidget> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController nomorHpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController tanggalLahirController = TextEditingController();
  String selectedUnit = '';
  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      color: GlobalColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Tambah Anggota",
            style: TextStyle(
              color: GlobalColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Nama Lengkap",
            style: TextStyle(
              color: GlobalColors.onBackground,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          TextFormWidget(controller: nameController, text: "Nama Lengkap"),
          const SizedBox(height: 8),
          const Text(
            "NIK",
            style: TextStyle(
              color: GlobalColors.onBackground,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          TextFormWidget(controller: nikController, text: "NIK"),
          const SizedBox(height: 8),
          const Text(
            "Nomor HP",
            style: TextStyle(
              color: GlobalColors.onBackground,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          TextFormWidget(controller: nomorHpController, text: "Nomor HP"),
          const SizedBox(height: 8),
          const Text(
            "Alamat",
            style: TextStyle(
              color: GlobalColors.onBackground,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          TextFormWidget(controller: alamatController, text: "Alamat"),
          const SizedBox(height: 8),
          const Text(
            "Tanggal Lahir",
            style: TextStyle(
              color: GlobalColors.onBackground,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          DatePickerWidget(date: tanggalLahirController),
          const SizedBox(height: 8),
          const Text(
            "Pekerjaan",
            style: TextStyle(
              color: GlobalColors.onBackground,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          WorkUnitsDropdown(
            onSelected: (String value) => setState(
              () {
                selectedUnit = value;
              },
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonWidget(
                text: "Simpan",
                onTap: () async {
                  try {
                    final addUser = ref.watch(addMemberProvider(
                      nameController.text,
                      nikController.text,
                      nomorHpController.text,
                      alamatController.text,
                      tanggalLahirController.text != ''
                          ? DateFormat('yyyy-MM-dd')
                              .parse(tanggalLahirController.text)
                          : null,
                      selectedUnit != '' ? int.parse(selectedUnit) : 0,
                    ).future);
                    await addUser;
                    if (!mounted) return;
                    showDialog(
                      // ignore: use_build_context_synchronously
                      context: context,
                      builder: (BuildContext context) {
                        return const CustomAlertDialog(
                          alertDesc: "Data berhasil ditambahkan",
                          alertTitle: "Sukses",
                        );
                      },
                    ).then((_) {
                      widget.onComplete();
                    });
                  } catch (e) {
                    if (!mounted) return;
                    showDialog(
                      // ignore: use_build_context_synchronously
                      context: context,
                      builder: (BuildContext context) {
                        return CustomAlertDialog(
                          alertDesc: e.toString().substring(11),
                          alertTitle: "Error",
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
