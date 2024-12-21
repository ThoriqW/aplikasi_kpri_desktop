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
        border: 7,
        color: GlobalColors.white,
        child: getCurrentUser.when(
          data: (user) {
            final Map<String, dynamic> currentUser =
                user as Map<String, dynamic>;
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
                      'Hello, ${currentUser['nama_lengkap']}',
                      style: const TextStyle(
                        color: GlobalColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
          error: (error, stackTrace) => const Text('Gagal terhubung ke api'),
          loading: () => const LinearProgressIndicator(),
        ));
  }
}
