import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/profile_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/datepicker_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class UpdateProfileWidget extends ConsumerStatefulWidget {
  const UpdateProfileWidget({super.key});

  @override
  ConsumerState<UpdateProfileWidget> createState() =>
      _UpdateProfileWidgetState();
}

class _UpdateProfileWidgetState extends ConsumerState<UpdateProfileWidget> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController nomorHpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController tanggalLahirController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final getProfile = ref.watch(getProfileProvider);
    return CustomCardWidget(
      color: GlobalColors.white,
      child: getProfile.when(
        data: (profile) {
          final profileData = profile as Map<String, dynamic>;
          nameController.text = profileData['fullName'] ?? '';
          nikController.text = profileData['nik'] ?? '';
          nomorHpController.text = profileData['phoneNumber'] ?? '';
          alamatController.text = profileData['address'] ?? '';
          profileData['dateOfBirth'] != null
              ? tanggalLahirController.text =
                  profileData['dateOfBirth'].toString().split(" ")[0]
              : tanggalLahirController.text = '';
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Profil",
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
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWidget(
                    text: "Simpan",
                    onTap: () async {
                      await _updateProfile();
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

  Future<void> _updateProfile() async {
    try {
      final updateProfile = await ref.watch(updateProfileProvider(
        nameController.text,
        nikController.text,
        nomorHpController.text,
        alamatController.text,
        tanggalLahirController.text != ''
            ? DateFormat('yyyy-MM-dd').parse(tanggalLahirController.text)
            : null,
      ).future);
      if (!mounted) return;
      if (updateProfile is SuccessResponse) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: updateProfile.message,
              alertTitle: "Sukses",
            );
          },
        ).then((_) => ref.watch(getProfileProvider));
      } else if (updateProfile is ErrorResponse) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: updateProfile.errors,
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
            alertDesc: e.toString(),
            alertTitle: "Error",
          );
        },
      );
    }
  }
}
