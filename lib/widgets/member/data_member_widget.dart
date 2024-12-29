import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/member_route_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/member/table_member_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataMemberWidget extends ConsumerWidget {
  const DataMemberWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomCardWidget(
      color: GlobalColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Data Anggota Koperasi",
            style: TextStyle(
              color: GlobalColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          IconButton(
            onPressed: () {
              ref.watch(memberModeNotifierProvider.notifier).switchToAddUser();
            },
            icon: const Icon(Icons.add),
          ),
          const SizedBox(height: 20),
          const TableMemberWidget()
        ],
      ),
    );
  }
}
