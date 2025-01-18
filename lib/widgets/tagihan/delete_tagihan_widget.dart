import 'package:aplikasi_kpri_desktop/providers/bills_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeleteTagihanWidget extends ConsumerStatefulWidget {
  const DeleteTagihanWidget({
    super.key,
    required this.tahun,
    required this.bulan,
  });

  final String tahun;
  final int bulan;

  @override
  ConsumerState<DeleteTagihanWidget> createState() =>
      _DeleteTagihanWidgetState();
}

class _DeleteTagihanWidgetState extends ConsumerState<DeleteTagihanWidget> {
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
                "Yakin hapus tagihan  tahun ${widget.tahun} bulan ${widget.bulan}?",
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
                    _deleteBulanTagihan(
                      widget.tahun,
                      widget.bulan,
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
        'Hapus Tagihan Tahun ${widget.tahun} bulan ${widget.bulan}',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Future<void> _deleteBulanTagihan(String tahun, int bulan) async {
    try {
      final deleteTahunSavings = await ref.watch(
        deleteBulanTagihanProvider(tahun, bulan.toString()).future,
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
        ).then((_) {
          ref
              .watch(editTagihanNotifierProvider.notifier)
              .clearDataEditTagihan();
          ref
              .watch(
                tagihanModeNotifierProvider.notifier,
              )
              .switchToView();
        });
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
