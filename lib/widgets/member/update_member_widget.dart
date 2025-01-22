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
  final TextEditingController nipController = TextEditingController();
  final TextEditingController tanggalMasukController = TextEditingController();
  final TextEditingController tanggalKeluarController = TextEditingController();
  String selectedUnit = '';
  String selectedStatus = '';
  String currentDropDownName = '';
  bool isInitialized = false;
  bool _isLoading = false;
  List<String> status = ["Tidak Aktif", "Aktif"];
  @override
  Widget build(BuildContext context) {
    final getMember = ref.watch(getMemberProvider(
      ref.watch(idMemberNotifierProvider).toString(),
    ));
    return CustomCardWidget(
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
            namaLengkapController.text = memberData['nama_lengkap'] ?? '';
            nikController.text = memberData['nik'] ?? '';
            nomorAnggotaController.text = memberData['nomor_anggota'] ?? '';
            nomorHpController.text = memberData['phone'] ?? '';
            alamatController.text = memberData['alamat'] ?? '';
            memberData['tanggal_lahir'] != null
                ? tanggalLahirController.text =
                    memberData['tanggal_lahir'].toString().split(" ")[0]
                : tanggalLahirController.text = '';
            emailController.text = memberData['email'] ?? '';
            jenisKelaminController.text = memberData['jenis_kelamin'] ?? '';
            agamaController.text = memberData['agama'] ?? '';
            nipController.text = memberData['nip'] ?? '';
            memberData['tanggal_masuk'] != null
                ? tanggalMasukController.text =
                    memberData['tanggal_masuk'].toString().split(" ")[0]
                : tanggalMasukController.text = '';
            memberData['tanggal_keluar'] != null
                ? tanggalKeluarController.text =
                    memberData['tanggal_keluar'].toString().split(" ")[0]
                : tanggalKeluarController.text = '';
            selectedUnit = memberData['work_unit_id'].toString();
            currentDropDownName = memberData['work_unit'].toString();

            if (memberData['status'].toString() == '1') {
              selectedStatus = "Aktif";
            } else if (memberData['status'].toString() == '0') {
              selectedStatus = "Tidak Aktif";
            }

            isInitialized = true;
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
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
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nama Lengkap",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormWidget(
                                      controller: namaLengkapController,
                                      text: ""),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "NIK",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormWidget(
                                      controller: nikController, text: ""),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nomor Anggota",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormWidget(
                                      controller: nomorAnggotaController,
                                      text: ""),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nomor HP",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormWidget(
                                      controller: nomorHpController, text: ""),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Alamat",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormWidget(
                                      controller: alamatController, text: ""),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Email",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormWidget(
                                      controller: emailController, text: ""),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Jenis Kelamin",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormWidget(
                                      controller: jenisKelaminController,
                                      text: ""),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Agama",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormWidget(
                                      controller: agamaController, text: ""),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "NIP",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormWidget(
                                      controller: nipController, text: ""),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tanggal Lahir",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  DatePickerWidget(
                                      date: tanggalLahirController),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tanggal Masuk",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  DatePickerWidget(
                                      date: tanggalMasukController),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tanggal Keluar",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  DatePickerWidget(
                                      date: tanggalKeluarController),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Pekerjaan",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Status",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            WorkUnitsDropdown(
                              currentDropDownName: currentDropDownName,
                              onSelected: (String value) => setState(
                                () {
                                  selectedUnit = value;
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const SizedBox(height: 10),
                                  DropdownWidget(
                                    items: status,
                                    currentDropDownName: selectedStatus,
                                    onSelected: (String value) => setState(
                                      () {
                                        selectedStatus = value;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  ResetPasswordWidget(
                                      id: memberData['id'].toString())
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        ButtonWidget(
                          text: _isLoading ? "Loading..." : "Simpan",
                          onTap: () async {
                            await _updateMember(
                              ref.watch(idMemberNotifierProvider).toString(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        error: (error, stackTrace) => const Text("Gagal terhubung ke server!!"),
        loading: () => const Align(
          alignment: Alignment.topCenter,
          child: LinearProgressIndicator(),
        ),
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
      ref.watch(idMemberNotifierProvider.notifier).clearId();
      setState(() {
        _isLoading = false;
      });
    }
  }
}
