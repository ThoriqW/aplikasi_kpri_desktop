import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/user_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
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
        color: const Color.fromARGB(255, 88, 163, 153),
        gradient: true,
        child: getCurrentUser.when(
          data: (user) {
            if (user == null) {
              return const Text("Data tidak valid");
            }
            if (user is ErrorResponse) {
              return Text(user.toString());
            }

            final userData = user as Map<String, dynamic>;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: GlobalColors.secondary,
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 88, 163, 153),
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
                      'Hello, ${userData['nama_lengkap']}',
                      style: const TextStyle(
                        color: GlobalColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
          error: (error, stackTrace) =>
              const Text('Gagal terhubung ke server!!'),
          loading: () => const LinearProgressIndicator(),
        ));
  }
}
