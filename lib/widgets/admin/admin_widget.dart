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

    Widget homeAdmin = Column(
      children: [
        CustomCardWidget(
          color: GlobalColors.white,
          padding: const EdgeInsets.all(0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: DataUserWidget(
                  onEdit: () {
                    ref
                        .read(adminModeNotifierProvider.notifier)
                        .switchToEditUser();
                  },
                ),
              ),
              const SizedBox(width: 15),
              const Expanded(child: AddUserWidget()),
            ],
          ),
        ),
        const SizedBox(height: 15),
        CustomCardWidget(
          color: GlobalColors.white,
          padding: const EdgeInsets.all(0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: DataWorkUnitsWidget(
                  onEdit: () {
                    ref
                        .watch(adminModeNotifierProvider.notifier)
                        .switchToEditWorkUnit();
                  },
                ),
              ),
              const SizedBox(width: 15),
              const Expanded(child: AddWorkUnitWidget()),
            ],
          ),
        ),
      ],
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
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 75.0, bottom: 30.0),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: bodyContent,
          ),
        ),
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: HeaderWidget(),
        ),
        const Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomCardWidget(
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
        ),
      ],
    );
  }
}
