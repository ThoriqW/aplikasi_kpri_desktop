import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/bills_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/header_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/tagihan/bottom_navigation_tagihan_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/tagihan/data_tagihan_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/tagihan/edit_data_tagihan_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/tagihan/transfer_member_tagihan_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/tagihan/update_tagihan_member_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TagihanWidget extends ConsumerWidget {
  const TagihanWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTagiahnMode = ref.watch(tagihanModeNotifierProvider);

    Widget tagiahnContent;
    switch (currentTagiahnMode) {
      case TagihanMode.view:
        tagiahnContent = const DataTagihanWidget();
        break;
      case TagihanMode.editTagihan:
        tagiahnContent = const EditDataTagihanWidget();
        break;
      case TagihanMode.transferMemberTagihan:
        tagiahnContent = const TransferMemberTagihanWidget();
        break;
      case TagihanMode.updateTagihanMember:
        tagiahnContent = const UpdateTagihanMemberWidget();
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
                  child: tagiahnContent,
                ),
              ),
            ],
          ),
        ),
        currentTagiahnMode == TagihanMode.view
            ? const CustomCardWidget(
                color: GlobalColors.white,
                padding:
                    EdgeInsets.only(bottom: 20, left: 10, right: 10, top: 20),
                child: BottomNavigationTagihanWidget(),
              )
            : const CustomCardWidget(
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
