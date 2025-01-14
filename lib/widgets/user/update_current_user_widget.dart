import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
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

class UpdateCurrentUserWidget extends ConsumerStatefulWidget {
  const UpdateCurrentUserWidget({super.key});

  @override
  ConsumerState<UpdateCurrentUserWidget> createState() =>
      _UpdateCurrentUserWidgetState();
}

class _UpdateCurrentUserWidgetState
    extends ConsumerState<UpdateCurrentUserWidget> {
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
  final TextEditingController fotoController = TextEditingController(); // belum
  bool _isLoading = false;
  bool isInitialized = false;
  @override
  Widget build(BuildContext context) {
    final getUser = ref.watch(getCurrentUserProvider);
    return CustomCardWidget(
      color: GlobalColors.white,
      child: getUser.when(
        data: (user) {
          if (user == null) {
            return const Text("Data tidak valid");
          }
          if (user is ErrorResponse) {
            return Text(user.toString());
          }

          final userData = user as Map<String, dynamic>;

          if (!isInitialized) {
            usernameController.text = userData['username'];
            namaLengkapController.text = userData['nama_lengkap'] ?? '';
            nikController.text = userData['nik'] ?? '';
            emailController.text = userData['email'] ?? '';
            nomorHpController.text = userData['phone'] ?? '';
            alamatController.text = userData['alamat'] ?? '';
            userData['tanggal_lahir'] != null
                ? tanggalLahirController.text =
                    userData['tanggal_lahir'].toString().split(" ")[0]
                : tanggalLahirController.text = '';
            jenisKelaminController.text = userData['jenis_kelamin'] ?? '';
            agamaController.text = userData['agama'] ?? '';
            isInitialized = true;
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "User ${userData['nama_lengkap']}",
                style: const TextStyle(
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
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(
                            controller: usernameController, text: ""),
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
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(
                            controller: newPasswordController, text: ""),
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
                          "Email",
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(controller: emailController, text: ""),
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
                          "Tanggal Lahir",
                        ),
                        const SizedBox(height: 8),
                        DatePickerWidget(date: tanggalLahirController),
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
                    text: _isLoading ? "Loading..." : "Update",
                    onTap: () async {
                      await _updateCurrentUser();
                    },
                  ),
                ],
              ),
            ],
          );
        },
        error: (error, stackTrace) =>
            const Text("'Gagal terhubung ke server!!'"),
        loading: () => const LinearProgressIndicator(),
      ),
    );
  }

  Future<void> _updateCurrentUser() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final updateuser = await ref.watch(updateCurrentUserProvider(
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
      if (updateuser is SuccessResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: updateuser.message,
              alertTitle: "Sukses",
            );
          },
        ).then((_) => ref.invalidate(getCurrentUserProvider));
      } else if (updateuser is ErrorResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: updateuser.errors,
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
            alertDesc: 'Gagal terhubung ke server!!',
            alertTitle: "Error",
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
