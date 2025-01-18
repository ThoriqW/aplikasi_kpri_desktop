import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/admin_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/user/add_user_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/work_unit/add_work_unit_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/user/data_user_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/header_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/work_unit/data_work_units_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/user/update_user_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/work_unit/update_work_units_widget%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminWidget extends ConsumerWidget {
  const AdminWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMode = ref.watch(adminModeNotifierProvider);
    Widget bodyContent;

    Widget homeAdmin = const Expanded(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Flexible(
              child: CustomCardWidget(
                color: GlobalColors.white,
                padding: EdgeInsets.all(0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: DataUserWidget(),
                    ),
                    SizedBox(width: 15),
                    Expanded(child: AddUserWidget()),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Flexible(
              child: CustomCardWidget(
                color: GlobalColors.white,
                padding: EdgeInsets.all(0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: DataWorkUnitsWidget(),
                    ),
                    SizedBox(width: 15),
                    Expanded(child: AddWorkUnitWidget()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    switch (currentMode) {
      case AdminMode.view:
        bodyContent = homeAdmin;
        break;
      case AdminMode.editUser:
        bodyContent = UpdateUserWidget(
          homeAdmin: () {
            ref.read(adminModeNotifierProvider.notifier).switchToView();
          },
        );
        break;
      case AdminMode.editWorkUnit:
        bodyContent = UpdateWorkUnitWidget(
          homeAdmin: () {
            ref.read(adminModeNotifierProvider.notifier).switchToView();
          },
        );
        break;
    }
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              const HeaderWidget(),
              bodyContent,
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
