import 'package:aplikasi_kpri_desktop/providers/work_units_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeleteWorkUnitWidget extends ConsumerStatefulWidget {
  const DeleteWorkUnitWidget({super.key, required this.id});

  final String id;

  @override
  ConsumerState<DeleteWorkUnitWidget> createState() =>
      _DeleteWorkUnitWidgetState();
}

class _DeleteWorkUnitWidgetState extends ConsumerState<DeleteWorkUnitWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Info"),
                content: const Text(
                  "Yakin hapus work unit?",
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
                    onPressed: () async {
                      _deleteWorkUnit(widget.id);
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
          size: 18,
          color: Colors.redAccent,
        ),
      ),
    );
  }

  Future<void> _deleteWorkUnit(String id) async {
    try {
      final deleteMember = await ref.watch(
        deleteWorkUnitProvider(id).future,
      );
      if (!mounted) return;
      Navigator.pop(context, 'OK');
      if (deleteMember is SuccessResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: deleteMember.message,
              alertTitle: "Sukses",
            );
          },
        );
        ref.invalidate(getAllWorkUnitsProvider);
      } else if (deleteMember is ErrorResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: deleteMember.errors,
              alertTitle: "Gagal",
            );
          },
        );
      }
    } catch (e) {
      if (!mounted) return;
      Navigator.pop(context, 'OK');
      showDialog(
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
