import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/member_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/work_units_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  final TextEditingController usernameController = TextEditingController();
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
            nameController.text = memberData['fullName'];
            nikController.text = memberData['nik'];
            usernameController.text = memberData['username'];
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
                "Username",
                style: TextStyle(
                  color: GlobalColors.onBackground,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextFormWidget(controller: usernameController, text: "Alamat"),
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
                    text: "Update",
                    onTap: () async {
                      try {
                        final updateUser = ref.watch(
                          updateMemberProvider(
                            widget.id,
                            nameController.text,
                            nikController.text,
                            usernameController.text,
                            selectedUnit != '' ? int.parse(selectedUnit) : 0,
                          ).future,
                        );
                        await updateUser;
                        if (!mounted) return;
                        showDialog(
                          // ignore: use_build_context_synchronously
                          context: context,
                          builder: (BuildContext context) {
                            return const CustomAlertDialog(
                              alertDesc: "Data berhasil diperbarui",
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
          );
        },
        error: (error, stackTrace) => const Text('Gagal terhubung ke api'),
        loading: () => const LinearProgressIndicator(),
      ),
    );
  }
}
