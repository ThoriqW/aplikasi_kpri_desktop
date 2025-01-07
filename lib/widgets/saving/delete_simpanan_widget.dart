import 'package:flutter/material.dart';

class DeleteSimpananWidget extends StatelessWidget {
  const DeleteSimpananWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: const Icon(
        Icons.delete,
        color: Colors.redAccent,
      ),
      label: const Text(
        'Hapus Simpanan',
      ),
    );
  }
}
