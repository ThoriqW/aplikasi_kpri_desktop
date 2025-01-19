import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FixedSettingWidget extends ConsumerStatefulWidget {
  const FixedSettingWidget({super.key});

  @override
  ConsumerState<FixedSettingWidget> createState() => _FixedSettingWidgetState();
}

class _FixedSettingWidgetState extends ConsumerState<FixedSettingWidget> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      color: GlobalColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            "Fixed Setting",
            style: TextStyle(
              color: GlobalColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Nama",
              ),
              const SizedBox(height: 8),
              TextFormWidget(controller: usernameController, text: ""),
            ],
          ),
          const SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Nilai",
              ),
              const SizedBox(height: 8),
              TextFormWidget(controller: passwordController, text: ""),
            ],
          ),
          const SizedBox(height: 15),
          ButtonWidget(
            text: _isLoading ? "Loading..." : "Simpan",
            onTap: () async {},
          ),
        ],
      ),
    );
  }
}
