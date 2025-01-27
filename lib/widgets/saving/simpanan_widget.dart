import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/saving_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/saving/bottom_navigation_simpanan_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/saving/data_simpanan_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/header_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/saving/edit_data_simpanan_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/saving/transfer_member_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SimpananWidget extends ConsumerWidget {
  const SimpananWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSavingMode = ref.watch(savingModeNotifierProvider);

    Widget savingsContent;
    switch (currentSavingMode) {
      case SavingMode.view:
        savingsContent = const DataSimpananWidget();
        break;
      case SavingMode.transferMember:
        savingsContent = const TransferMemberWidget();
        break;
      case SavingMode.editSimpanan:
        savingsContent = const EditDataSimpanan();
        break;
    }
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: HeaderWidget(),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: savingsContent,
                ),
              ),
            ],
          ),
        ),
        currentSavingMode == SavingMode.view
            ? Padding(
                padding: const EdgeInsets.all(10),
                child: CustomCardWidget(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  padding: const EdgeInsets.only(
                      bottom: 20, left: 10, right: 10, top: 20),
                  child: const BottomNavigationSimpananWidget(),
                ),
              )
            : const CustomCardWidget(
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
