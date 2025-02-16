import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/admin_provider.dart';
import 'package:aplikasi_kpri_desktop/providers/user_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/user/search_user_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/user/table_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataUserWidget extends ConsumerWidget {
  const DataUserWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchCriteriaUsers = ref.watch(searchUsersProvider);
    return SizedBox(
      height: 450,
      child: CustomCardWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "User",
              style: TextStyle(
                color: GlobalColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    ref
                        .watch(adminModeNotifierProvider.notifier)
                        .switchToAddUser();
                  },
                  icon: const Icon(Icons.add),
                ),
                const SizedBox(width: 10),
                const Flexible(
                    child: SizedBox(width: 500, child: SearchUserWidget())),
              ],
            ),
            const SizedBox(height: 20),
            Flexible(
              child: TableUserWidget(
                searchQuery: searchCriteriaUsers['searchQuery'],
                perPage: searchCriteriaUsers['perPage'],
                currentPage: searchCriteriaUsers['currentPage'],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
