import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/member_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/member/add_member_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/member/bottom_navigation_member_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/member/data_member_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/header_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/member/update_member_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MemberWidget extends ConsumerWidget {
  const MemberWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMemberMode = ref.watch(memberModeNotifierProvider);

    Widget memberContent;
    switch (currentMemberMode) {
      case MemberMode.view:
        memberContent = const DataMemberWidget();
        break;
      case MemberMode.add:
        memberContent = const AddMemberWidget();
        break;
      case MemberMode.update:
        memberContent = const UpdateMemberWidget();
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
                  child: memberContent,
                ),
              ),
            ],
          ),
        ),
        currentMemberMode == MemberMode.view
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomCardWidget(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  padding: const EdgeInsets.only(
                      bottom: 20, left: 10, right: 10, top: 20),
                  child: const BottomNavigationMemberWidget(),
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
