import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/profile_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/datepicker_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ProfileWidget extends ConsumerStatefulWidget {
  const ProfileWidget({super.key});

  @override
  ConsumerState<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends ConsumerState<ProfileWidget> {
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
            nameController.text = profile.fullName;
            nikController.text = profile.nik;
            nomorHpController.text = profile.phoneNumber;
            alamatController.text = profile.address;
            tanggalLahirController.text =
                profile.dateOfBirth.toString().split(" ")[0];
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
                TextFormWidget(
                    controller: nameController, text: "Nama Lengkap"),
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
                        try {
                          final addUser = ref.watch(updateProfileProvider(
                                  nameController.text,
                                  nikController.text,
                                  nomorHpController.text,
                                  alamatController.text,
                                  DateFormat('yyyy-MM-dd')
                                      .parse(tanggalLahirController.text))
                              .future);
                          await addUser;
                          if (mounted) {
                            showDialog(
                              // ignore: use_build_context_synchronously
                              context: context,
                              builder: (BuildContext context) {
                                return const CustomAlertDialog(
                                  alertDesc: "Data berhasil diperbarui",
                                  alertTitle: "Sukses",
                                );
                              },
                            );
                          }
                        } catch (e) {
                          if (mounted) {
                            showDialog(
                              // ignore: use_build_context_synchronously
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
                      },
                    ),
                  ],
                ),
              ],
            );
          },
          error: (error, stackTrace) =>
              const Text('Oops, something unexpected happened'),
          loading: () => const LinearProgressIndicator(),
        ));
  }
}
