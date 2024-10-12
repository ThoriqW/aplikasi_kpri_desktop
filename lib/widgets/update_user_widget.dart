import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/user_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
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
                "Edit User",
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
                  await _updateUser();
                },
              ),
            ],
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const LinearProgressIndicator(),
      ),
    );
  }

  Future<void> _updateUser() async {
    try {
      final updateUser = await ref.watch(updateUserProvider(
        usernameController.text,
        passwordController.text,
      ).future);
      if (!mounted) return;
      if (updateUser is SuccessResponse) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: updateUser.message,
              alertTitle: "Sukses",
            );
          },
        ).then((_) => ref.invalidate(getCurrentUserProvider));
      } else if (updateUser is ErrorResponse) {
        showDialog(
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
