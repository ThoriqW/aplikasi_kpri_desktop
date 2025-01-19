import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/setting_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/setting/fixed_setting.dart';
import 'package:aplikasi_kpri_desktop/widgets/user/update_current_user_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingWidget extends ConsumerWidget {
  const SettingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMode = ref.watch(settingModeNotifierProvider);
    Widget bodyContent;

    Widget home = const SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            child: CustomCardWidget(
              color: GlobalColors.white,
              child: Text(
                "Pengaturan User & Aplikasi",
                style: TextStyle(
                  color: GlobalColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    UpdateCurrentUserWidget(),
                    SizedBox(height: 10),
                    FixedSettingWidget()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    switch (currentMode) {
      case SettingMode.view:
        bodyContent = home;
        break;
    }
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              const HeaderWidget(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: bodyContent,
                ),
              ),
            ],
          ),
        ),
        const CustomCardWidget(
          color: GlobalColors.white,
          padding: EdgeInsets.all(6),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Aplikasi Koperasi By Bacreative",
              style: TextStyle(
                color: GlobalColors.primary,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
