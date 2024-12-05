import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/member_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/datepicker_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/work_units_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class UpdateMemberWidget extends ConsumerStatefulWidget {
  const UpdateMemberWidget(
      {super.key, required this.id, required this.onComplete});

  final VoidCallback onComplete;
  final String id;

  @override
  ConsumerState<UpdateMemberWidget> createState() => _UpdateMemberWidgetState();
}

class _UpdateMemberWidgetState extends ConsumerState<UpdateMemberWidget> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController nomorAnggotaController = TextEditingController();
  final TextEditingController nomorHpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController tanggalLahirController = TextEditingController();
  bool isInitialized = false;
  String selectedUnit = '';
  @override
  Widget build(BuildContext context) {
    final getMember = ref.watch(getMemberProvider(widget.id));
    return CustomCardWidget(
      color: GlobalColors.white,
      child: getMember.when(
        data: (member) {
          final memberData = member as Map<String, dynamic>;
          if (!isInitialized) {
            nameController.text = memberData['fullname'];
            nikController.text = memberData['nik'];
            nomorAnggotaController.text = memberData['memberNumber'] ?? '';
            nomorHpController.text = memberData['phoneNumber'] ?? '';
            alamatController.text = memberData['address'] ?? '';
            memberData['dateOfBirth'] != null
                ? tanggalLahirController.text =
                    memberData['dateOfBirth'].toString().split(" ")[0]
                : tanggalLahirController.text = '';
            selectedUnit = '1';
            print(memberData['workUnitId']);
            isInitialized = true;
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Update Anggota",
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
              const SizedBox(height: 20),
              const Text(
                "Nomor Anggota",
                style: TextStyle(
                  color: GlobalColors.onBackground,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextFormWidget(
                  controller: nomorAnggotaController, text: "Nomor Anggota"),
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
                currentDropDownName: selectedUnit,
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
                    text: "Update",
                    onTap: () async {
                      await _updateMember();
                    },
                  ),
                ],
              ),
            ],
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const LinearProgressIndicator(),
      ),
    );
  }

  Future<void> _updateMember() async {
    try {
      final updateMember = await ref.watch(
        updateMemberProvider(
          widget.id,
          nameController.text,
          nikController.text,
          nomorAnggotaController.text,
          nomorHpController.text,
          alamatController.text,
          tanggalLahirController.text != ''
              ? DateFormat('yyyy-MM-dd').parse(tanggalLahirController.text)
              : null,
          selectedUnit != '' ? int.parse(selectedUnit) : 0,
        ).future,
      );
      if (!mounted) return;
      if (updateMember is SuccessResponse) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: updateMember.message,
              alertTitle: "Sukses",
            );
          },
        ).then((_) {
          widget.onComplete();
        });
      } else if (updateMember is ErrorResponse) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: updateMember.errors,
              alertTitle: "Gagal",
            );
          },
        );
      }
    } catch (e) {
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDialog(
            alertDesc: e.toString().substring(11),
            alertTitle: "Gagal",
          );
        },
      );
    }
  }
}
