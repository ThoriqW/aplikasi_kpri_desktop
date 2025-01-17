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

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 75.0, bottom: 70.0),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                memberContent,
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
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: currentMemberMode == MemberMode.view
              ? const CustomCardWidget(
                  color: GlobalColors.white,
                  padding:
                      EdgeInsets.only(bottom: 20, left: 10, right: 10, top: 20),
                  child: BottomNavigationMemberWidget(),
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
        ),
      ],
    );
  }
}
