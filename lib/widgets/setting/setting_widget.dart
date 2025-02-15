import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/admin_provider.dart';
import 'package:aplikasi_kpri_desktop/providers/setting_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/setting/fixed_setting.dart';
import 'package:aplikasi_kpri_desktop/widgets/setting/update_fixed_setting.dart';
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
    final roleId = ref.watch(getRoleUserProvider).value;

    Widget bodyContent;

    Widget home = SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            child: CustomCardWidget(
              color: Theme.of(context).colorScheme.secondaryContainer,
              child: const Text(
                "Pengaturan User & Aplikasi",
                style: TextStyle(
                  color: GlobalColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const UpdateCurrentUserWidget(),
                    const SizedBox(height: 10),
                    if (roleId == 'admin') const FixedSettingWidget()
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
      case SettingMode.editFixedSetting:
        bodyContent = const UpdateFixedSettingWidget();
        break;
    }
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: HeaderWidget(),
              ),
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
          padding: EdgeInsets.all(10),
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
