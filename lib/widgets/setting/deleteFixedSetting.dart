import 'package:aplikasi_kpri_desktop/providers/setting_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeleteFixedSettingWidget extends ConsumerStatefulWidget {
  const DeleteFixedSettingWidget({super.key, required this.id});

  final String id;

  @override
  ConsumerState<DeleteFixedSettingWidget> createState() =>
      _DeleteUserWidgetState();
}

class _DeleteUserWidgetState extends ConsumerState<DeleteFixedSettingWidget> {
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
                  "Yakin hapus fixed setting?",
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
                      _deleteUser(
                        widget.id,
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
          size: 18,
          color: Colors.redAccent,
        ),
      ),
    );
  }

  Future<void> _deleteUser(String id) async {
    try {
      final deleteFixedSetting = await ref.watch(
        deleteFixedSettingProvider(id).future,
      );
      if (!mounted) return;
      Navigator.pop(context, 'OK');
      if (deleteFixedSetting is SuccessResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: deleteFixedSetting.message,
              alertTitle: "Sukses",
            );
          },
        );
        ref.invalidate(getAllFixedSettingProvider);
      } else if (deleteFixedSetting is ErrorResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: deleteFixedSetting.errors,
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
