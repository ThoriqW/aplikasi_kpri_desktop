import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/saving_route_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/saving/data_simpanan_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/header_widget.dart';
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
    }
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 75.0, bottom: 30.0),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                savingsContent,
              ],
            ),
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
