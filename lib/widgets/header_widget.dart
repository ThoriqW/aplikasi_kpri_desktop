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
      color: Theme.of(context).colorScheme.primary,
      padding: const EdgeInsets.all(20),
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
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      radius: 16,
                      child: Icon(
                        Icons.person,
                        size: 22,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Hello, ${userData['nama_lengkap']}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
        error: (error, stackTrace) => const Text('Gagal terhubung ke server!!'),
        loading: () => const LinearProgressIndicator(),
      ),
    );
  }
}
