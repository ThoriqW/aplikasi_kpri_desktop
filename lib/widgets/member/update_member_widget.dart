import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/member_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/utils/datepicker_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/dropdown_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/member/reset_password_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/work_unit/work_units_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class UpdateMemberWidget extends ConsumerStatefulWidget {
  const UpdateMemberWidget({
    super.key,
  });

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
  final TextEditingController jabatanController = TextEditingController();
  final TextEditingController pangkatController = TextEditingController();
  final TextEditingController nipController = TextEditingController();
  final TextEditingController tanggalMasukController = TextEditingController();
  final TextEditingController tanggalKeluarController = TextEditingController();
  String selectedUnit = '';
  String selectedStatus = '';
  bool isInitialized = false;
  bool _isLoading = false;
  List<String> status = ["Tidak Aktif", "Aktif"];
  @override
  Widget build(BuildContext context) {
    final getMember = ref.watch(getMemberProvider(
      ref.watch(idMemberNotifierProvider.notifier).getId().toString(),
    ));
    return CustomCardWidget(
      color: GlobalColors.white,
      child: getMember.when(
        data: (member) {
          if (member == null) {
            return const Text("Data tidak valid");
          }
          if (member is ErrorResponse) {
            return Text(member.toString());
          }

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
            memberData['tanggal_masuk'] != null
                ? tanggalMasukController.text =
                    memberData['tanggal_masuk'].toString().split(" ")[0]
                : tanggalMasukController.text = '';
            memberData['tanggal_keluar'] != null
                ? tanggalKeluarController.text =
                    memberData['tanggal_keluar'].toString().split(" ")[0]
                : tanggalKeluarController.text = '';
            selectedUnit = memberData['work_unit_id'].toString();

            if (memberData['status'].toString() == '1') {
              selectedStatus = "Aktif";
            } else if (memberData['status'].toString() == '0') {
              selectedStatus = "Tidak Aktif";
            }

            isInitialized = true;
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  ref.watch(memberModeNotifierProvider.notifier).switchToView();
                },
                icon: const Icon(Icons.arrow_back),
              ),
              const SizedBox(height: 20),
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
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(
                            controller: namaLengkapController, text: ""),
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
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(controller: nikController, text: ""),
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
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(
                            controller: nomorAnggotaController, text: ""),
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
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(controller: nomorHpController, text: ""),
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
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(controller: alamatController, text: ""),
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
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(controller: emailController, text: ""),
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
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(
                            controller: jenisKelaminController, text: ""),
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
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(controller: agamaController, text: ""),
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
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(controller: jabatanController, text: ""),
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
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(controller: pangkatController, text: ""),
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
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(controller: nipController, text: ""),
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
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Pekerjaan",
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
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Status",
                            ),
                            const SizedBox(height: 8),
                            DropdownWidget(
                              items: status,
                              currentDropDownName: selectedStatus,
                              onSelected: (String value) => setState(
                                () {
                                  selectedStatus = value;
                                },
                              ),
                            )
                          ],
                        ),
                        const SizedBox(width: 8),
                        ResetPasswordWidget(id: memberData['id'].toString())
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              ButtonWidget(
                text: _isLoading ? "Loading..." : "Update",
                onTap: () async {
                  await _updateMember(
                    ref
                        .watch(idMemberNotifierProvider.notifier)
                        .getId()
                        .toString(),
                  );
                },
              ),
            ],
          );
        },
        error: (error, stackTrace) => const Text("Gagal terhubung ke server!!"),
        loading: () => const LinearProgressIndicator(),
      ),
    );
  }

  Future<void> _updateMember(String id) async {
    setState(() {
      _isLoading = true;
    });
    int idStatus;
    if (selectedStatus == 'Aktif') {
      idStatus = 1;
    } else {
      idStatus = 0;
    }
    try {
      final updateMember = await ref.watch(
        updateMemberProvider(
          id,
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
          tanggalMasukController.text != ''
              ? DateFormat('yyyy-MM-dd').parse(tanggalMasukController.text)
              : null,
          tanggalKeluarController.text != ''
              ? DateFormat('yyyy-MM-dd').parse(tanggalKeluarController.text)
              : null,
          selectedUnit != '' ? int.parse(selectedUnit) : 0,
          idStatus,
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
          ref.watch(memberModeNotifierProvider.notifier).switchToView();
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
          return const CustomAlertDialog(
            alertDesc: "Gagal terhubung ke server!!",
            alertTitle: "Gagal",
          );
        },
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
