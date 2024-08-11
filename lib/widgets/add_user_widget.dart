import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/user_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddUserWidget extends ConsumerStatefulWidget {
  const AddUserWidget({super.key});

  @override
  ConsumerState<AddUserWidget> createState() => _AddUserWidgetState();
}

class _AddUserWidgetState extends ConsumerState<AddUserWidget> {
  bool errorRegister = false;
  String errorText = "";
  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return CustomCardWidget(
      color: GlobalColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Tambah User",
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
                  final addUser = ref.watch(registerUserProvider(
                    usernameController.text,
                    passwordController.text,
                  ).future);
                  await addUser;
                } else {
                  setState(() {
                    errorRegister = true;
                    errorText = "Username dan passsword harus di isi";
                  });
                }
              } catch (e) {
                setState(() {
                  errorRegister = true;
                  errorText = "Gagal input user periksa kembali data";
                });
              } finally {
                usernameController.clear();
                passwordController.clear();
              }
            },
          ),
          if (errorRegister)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                errorText,
                style: TextStyle(
                  color: Colors.red[400],
                ),
              ),
            )
        ],
      ),
    );
  }
}