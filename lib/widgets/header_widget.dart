import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/user_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HeaderWidget extends ConsumerWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getCurrentUser = ref.watch(getCurrentUserProvider);
    return CustomCardWidget(
        color: GlobalColors.white,
        child: getCurrentUser.when(
          data: (user) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: GlobalColors.secondary,
                      child: CircleAvatar(
                        backgroundColor: GlobalColors.white,
                        radius: 18,
                        child: Icon(
                          Icons.person,
                          size: 22,
                          color: GlobalColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Hello, ${user.username}',
                      style: const TextStyle(
                        color: GlobalColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: GlobalColors.header,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: GlobalColors.primary,
                          width: 2.0,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      hintText: "Cari",
                      prefixIcon: Icon(
                        Icons.search,
                        color: GlobalColors.onBackground,
                        size: 21,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          error: (error, stackTrace) =>
              const Text('Oops, something unexpected happened'),
          loading: () => const LinearProgressIndicator(),
        ));
  }
}
