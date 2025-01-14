import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/member_provider.dart';
import 'package:aplikasi_kpri_desktop/providers/member_route_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/utils/datepicker_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/work_unit/work_units_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class AddMemberWidget extends ConsumerStatefulWidget {
  const AddMemberWidget({
    super.key,
  });

  @override
  ConsumerState<AddMemberWidget> createState() => _AddMemberWidgetState();
}

class _AddMemberWidgetState extends ConsumerState<AddMemberWidget> {
  final TextEditingController namaLengkapController = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController nomorAnggotaController = TextEditingController();
  final TextEditingController nomorHpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController tanggalLahirController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController jenisKelaminController = TextEditingController();
  final TextEditingController agamaController = TextEditingController();
  final TextEditingController fotoController = TextEditingController(); // BELUM
  final TextEditingController jabatanController = TextEditingController();
  final TextEditingController pangkatController = TextEditingController();
  final TextEditingController nipController = TextEditingController();
  final TextEditingController tanggalMasukController = TextEditingController();

  String selectedUnit = '';
  int status = 1;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      color: GlobalColors.white,
      child: Column(
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
            "Tambah Anggota",
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
                    TextFormWidget(controller: namaLengkapController, text: ""),
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
                      "Pekerjaan",
                    ),
                    const SizedBox(height: 8),
                    WorkUnitsDropdown(
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
          const SizedBox(height: 8),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonWidget(
                text: _isLoading ? "Loading..." : "Simpan",
                onTap: () async {
                  await _saveMember();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _saveMember() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final addMember = await ref.watch(addMemberProvider(
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
        selectedUnit != '' ? int.parse(selectedUnit) : 0,
        status,
      ).future);
      if (!mounted) return;
      if (addMember is SuccessResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: addMember.message,
              alertTitle: "Sukses",
            );
          },
        ).then((_) {
          ref.watch(memberModeNotifierProvider.notifier).switchToView();
        });
      } else if (addMember is ErrorResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: addMember.errors,
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
