import 'package:aplikasi_kpri_desktop/providers/saving_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateYearSimpanan extends ConsumerStatefulWidget {
  const UpdateYearSimpanan({super.key, required this.tahun});

  final String tahun;

  @override
  ConsumerState<UpdateYearSimpanan> createState() => _UpdateYearSimpananState();
}

class _UpdateYearSimpananState extends ConsumerState<UpdateYearSimpanan> {
  final TextEditingController tahunControllerController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    tahunControllerController.text = widget.tahun;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Ganti Tahun Simpanan",
        ),
        const SizedBox(height: 12),
        TextFormWidget(controller: tahunControllerController, text: ""),
        const SizedBox(height: 12),
        ButtonWidget(
          text: "Simpan",
          onTap: () async {
            await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Info"),
                  content: Text(
                    "Yakin ganti simpanan tahun ${widget.tahun}?",
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
                        _updateTahunSavings(
                            widget.tahun, tahunControllerController.text);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }

  Future<void> _updateTahunSavings(String tahun, String newTahun) async {
    try {
      final updateTahunSavings = await ref.watch(
        updateTahunSavingsProvider(tahun, newTahun).future,
      );
      if (!mounted) return;
      Navigator.pop(context, 'OK');
      if (updateTahunSavings is SuccessResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: updateTahunSavings.message,
              alertTitle: "Sukses",
            );
          },
        ).then(
          (_) => ref
              .watch(
                savingModeNotifierProvider.notifier,
              )
              .switchToView(),
        );
      } else if (updateTahunSavings is ErrorResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: updateTahunSavings.errors,
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
