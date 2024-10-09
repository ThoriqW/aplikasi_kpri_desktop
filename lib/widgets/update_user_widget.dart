import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/user_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateUserWidget extends ConsumerStatefulWidget {
  const UpdateUserWidget({super.key});

  @override
  ConsumerState<UpdateUserWidget> createState() => _UpdateUserWidgetState();
}

class _UpdateUserWidgetState extends ConsumerState<UpdateUserWidget> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final getCurrentUser = ref.watch(getCurrentUserProvider);
    return CustomCardWidget(
      color: GlobalColors.white,
      child: getCurrentUser.when(
        data: (user) {
          usernameController.text = user.username;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Akun",
                style: TextStyle(
                  color: GlobalColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextFormWidget(controller: usernameController, text: "Username"),
              const SizedBox(height: 15),
              TextFormWidget(controller: passwordController, text: "Password"),
              const SizedBox(height: 15),
              ButtonWidget(
                text: "Simpan",
                onTap: () async {
                  try {
                    if (usernameController.text != "" &&
                        passwordController.text != "") {
                      final updateUser = ref.watch(updateUserProvider(
                        usernameController.text,
                        passwordController.text,
                      ).future);
                      await updateUser;
                      if (mounted) {
                        showDialog(
                          // ignore: use_build_context_synchronously
                          context: context,
                          builder: (BuildContext context) {
                            return const CustomAlertDialog(
                              alertDesc: "Berhasil update user",
                              alertTitle: "Sukses",
                            );
                          },
                        );
                      }
                    } else {
                      if (mounted) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const CustomAlertDialog(
                              alertDesc: "Periksa kembali data yang diisi",
                              alertTitle: "Gagal",
                            );
                          },
                        );
                      }
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
          );
        },
        error: (error, stackTrace) =>
            const Text('Oops, something unexpected happened'),
        loading: () => const LinearProgressIndicator(),
      ),
    );
  }
}
