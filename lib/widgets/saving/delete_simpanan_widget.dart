import 'package:aplikasi_kpri_desktop/providers/saving_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeleteSimpananWidget extends ConsumerStatefulWidget {
  const DeleteSimpananWidget({
    super.key,
    required this.tahun,
  });

  final String tahun;

  @override
  ConsumerState<DeleteSimpananWidget> createState() =>
      _DeleteSimpananWidgetState();
}

class _DeleteSimpananWidgetState extends ConsumerState<DeleteSimpananWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () async {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Info"),
              content: Text(
                "Yakin hapus simpanan tahun ${widget.tahun}?",
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(
                    context,
                    'Cancel',
                  ),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    _deleteTahunSavings(
                      widget.tahun,
                    );
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      },
      icon: const Icon(
        Icons.delete,
        color: Colors.redAccent,
      ),
      label: Text(
        'Hapus Simpanan ${widget.tahun}',
      ),
    );
  }

  Future<void> _deleteTahunSavings(String tahun) async {
    try {
      final deleteTahunSavings = await ref.watch(
        deleteTahunSavingsProvider(tahun).future,
      );
      if (!mounted) return;
      Navigator.pop(context, 'OK');
      if (deleteTahunSavings is SuccessResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: deleteTahunSavings.message,
              alertTitle: "Sukses",
            );
          },
        ).then((_) => ref
            .watch(
              savingModeNotifierProvider.notifier,
            )
            .switchToView());
      } else if (deleteTahunSavings is ErrorResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: deleteTahunSavings.errors,
              alertTitle: "Gagal",
            );
          },
        );
      }
    } catch (e) {
      if (!mounted) return;
      Navigator.pop(context, 'OK');
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return const CustomAlertDialog(
            alertDesc: "Gagal terhubung ke server!!",
            alertTitle: "Gagal",
          );
        },
      );
    }
  }
}
