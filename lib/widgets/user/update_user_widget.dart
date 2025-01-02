import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/admin_route_provider.dart';
import 'package:aplikasi_kpri_desktop/providers/user_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/utils/datepicker_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class UpdateUserWidget extends ConsumerStatefulWidget {
  const UpdateUserWidget({super.key, required this.homeAdmin});

  final Function homeAdmin;

  @override
  ConsumerState<UpdateUserWidget> createState() => _UpdateUserWidgetState();
}

class _UpdateUserWidgetState extends ConsumerState<UpdateUserWidget> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController namaLengkapController = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nomorHpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController tanggalLahirController = TextEditingController();
  final TextEditingController jenisKelaminController = TextEditingController();
  final TextEditingController agamaController = TextEditingController();
  final TextEditingController fotoController = TextEditingController(); // BELUM

  @override
  Widget build(BuildContext context) {
    final getProfile = ref.watch(getUserProvider(
        ref.watch(idUserNotifierProvider.notifier).getId().toString()));
    return CustomCardWidget(
      color: GlobalColors.white,
      child: getProfile.when(
        data: (profile) {
          final profileData = profile as Map<String, dynamic>;

          usernameController.text = profileData['username'];
          namaLengkapController.text = profileData['nama_lengkap'] ?? '';
          nikController.text = profileData['nik'] ?? '';
          emailController.text = profileData['email'] ?? '';
          nomorHpController.text = profileData['phone'] ?? '';
          alamatController.text = profileData['alamat'] ?? '';
          profileData['tanggal_lahir'] != null
              ? tanggalLahirController.text =
                  profileData['tanggal_lahir'].toString().split(" ")[0]
              : tanggalLahirController.text = '';
          jenisKelaminController.text = profileData['jenis_kelamin'] ?? '';
          agamaController.text = profileData['agama'] ?? '';

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () async {
                  widget.homeAdmin();
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "Update User",
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
                          "Username",
                          style: TextStyle(
                            color: GlobalColors.onBackground,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(
                            controller: usernameController, text: "Username"),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "New Password",
                          style: TextStyle(
                            color: GlobalColors.onBackground,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(
                            controller: newPasswordController,
                            text: "New Password"),
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
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWidget(
                    text: "Simpan",
                    onTap: () async {
                      await _updateUser(profileData['id'].toString());
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

  Future<void> _updateUser(String id) async {
    try {
      final updateUser = await ref.watch(updateUserProvider(
        id,
        usernameController.text,
        newPasswordController.text,
        namaLengkapController.text,
        nikController.text,
        emailController.text,
        nomorHpController.text,
        alamatController.text,
        tanggalLahirController.text != ''
            ? DateFormat('yyyy-MM-dd').parse(tanggalLahirController.text)
            : null,
        jenisKelaminController.text,
        agamaController.text,
      ).future);
      if (!mounted) return;
      if (updateUser is SuccessResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: updateUser.message,
              alertTitle: "Sukses",
            );
          },
        ).then((_) => ref.invalidate(getUserProvider(
            ref.watch(idUserNotifierProvider.notifier).getId().toString())));
      } else if (updateUser is ErrorResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: updateUser.errors,
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
