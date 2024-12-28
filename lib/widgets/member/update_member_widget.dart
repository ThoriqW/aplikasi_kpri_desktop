import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/member_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/utils/datepicker_widget.dart';
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
  final TextEditingController namaLengkapController = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController nomorAnggotaController = TextEditingController();
  final TextEditingController nomorHpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController tanggalLahirController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController jenisKelaminController = TextEditingController();
  final TextEditingController agamaController = TextEditingController();
  final TextEditingController fotoController = TextEditingController(); // belum
  final TextEditingController jabatanController = TextEditingController();
  final TextEditingController pangkatController = TextEditingController();
  final TextEditingController nipController = TextEditingController();
  final TextEditingController isActiveController = TextEditingController();
  final TextEditingController tanggalMasukController = TextEditingController();
  final TextEditingController tanggalKeluarController = TextEditingController();
  String selectedUnit = '';
  bool isInitialized = false;
  @override
  Widget build(BuildContext context) {
    final getMember = ref.watch(getMemberProvider(widget.id));
    return CustomCardWidget(
      color: GlobalColors.white,
      child: getMember.when(
        data: (member) {
          final memberData = member as Map<String, dynamic>;

          if (!isInitialized) {
            namaLengkapController.text = memberData['nama_lengkap'];
            nikController.text = memberData['nik'];
            nomorAnggotaController.text = memberData['nomor_anggota'];
            nomorHpController.text = memberData['phone'];
            alamatController.text = memberData['alamat'];
            memberData['tanggal_lahir'] != null
                ? tanggalLahirController.text =
                    memberData['tanggal_lahir'].toString().split(" ")[0]
                : tanggalLahirController.text = '';
            emailController.text = memberData['email'];
            jenisKelaminController.text = memberData['jenis_kelamin'];
            agamaController.text = memberData['agama'];
            jabatanController.text = memberData['jabatan'];
            pangkatController.text = memberData['pangkat'];
            nipController.text = memberData['nip'];
            isActiveController.text = memberData['is_active'].toString();
            memberData['tanggal_masuk'] != null
                ? tanggalMasukController.text =
                    memberData['tanggal_masuk'].toString().split(" ")[0]
                : tanggalMasukController.text = '';
            memberData['tanggal_keluar'] != null
                ? tanggalKeluarController.text =
                    memberData['tanggal_keluar'].toString().split(" ")[0]
                : tanggalKeluarController.text = '';
            selectedUnit = memberData['work_unit_id'].toString();
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
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Nama Lengkap",
                          style: TextStyle(
                            color: GlobalColors.onBackground,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(
                            controller: namaLengkapController,
                            text: "Nama Lengkap"),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "NIK",
                          style: TextStyle(
                            color: GlobalColors.onBackground,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(controller: nikController, text: "NIK"),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Nomor Anggota",
                          style: TextStyle(
                            color: GlobalColors.onBackground,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(
                            controller: nomorAnggotaController,
                            text: "Nomor Anggota"),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Nomor HP",
                          style: TextStyle(
                            color: GlobalColors.onBackground,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(
                            controller: nomorHpController, text: "Nomor HP"),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Alamat",
                          style: TextStyle(
                            color: GlobalColors.onBackground,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(
                            controller: alamatController, text: "Alamat"),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Email",
                          style: TextStyle(
                            color: GlobalColors.onBackground,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(
                            controller: emailController, text: "Email"),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Jenis Kelamin",
                          style: TextStyle(
                            color: GlobalColors.onBackground,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(
                            controller: jenisKelaminController,
                            text: "Jenis Kelamin"),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Agama",
                          style: TextStyle(
                            color: GlobalColors.onBackground,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(
                            controller: agamaController, text: "Agama"),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Jabatan",
                          style: TextStyle(
                            color: GlobalColors.onBackground,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(
                            controller: jabatanController, text: "Jabatan"),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Pangkat",
                          style: TextStyle(
                            color: GlobalColors.onBackground,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(
                            controller: pangkatController, text: "Pangkat"),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "NIP",
                          style: TextStyle(
                            color: GlobalColors.onBackground,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(controller: nipController, text: "NIP"),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Tanggal Lahir",
                          style: TextStyle(
                            color: GlobalColors.onBackground,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        DatePickerWidget(date: tanggalLahirController),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Tanggal Masuk",
                          style: TextStyle(
                            color: GlobalColors.onBackground,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        DatePickerWidget(date: tanggalMasukController),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Tanggal Keluar",
                          style: TextStyle(
                            color: GlobalColors.onBackground,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        DatePickerWidget(date: tanggalKeluarController),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Status Anggota",
                          style: TextStyle(
                            color: GlobalColors.onBackground,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(
                            isEnabled: false,
                            controller: isActiveController,
                            text: "Status Anggota"),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                      ],
                    ),
                  ),
                ],
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
          namaLengkapController.text,
          nikController.text,
          nomorAnggotaController.text,
          nomorHpController.text,
          alamatController.text,
          tanggalLahirController.text != ''
              ? DateFormat('yyyy-MM-dd').parse(tanggalLahirController.text)
              : null,
          emailController.text,
          jenisKelaminController.text,
          agamaController.text,
          jabatanController.text,
          pangkatController.text,
          nipController.text,
          int.parse(isActiveController.text),
          tanggalMasukController.text != ''
              ? DateFormat('yyyy-MM-dd').parse(tanggalMasukController.text)
              : null,
          tanggalKeluarController.text != ''
              ? DateFormat('yyyy-MM-dd').parse(tanggalKeluarController.text)
              : null,
          selectedUnit != '' ? int.parse(selectedUnit) : 0,
        ).future,
      );
      if (!mounted) return;
      if (updateMember is SuccessResponse) {
        await showDialog(
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
        await showDialog(
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
      await showDialog(
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
