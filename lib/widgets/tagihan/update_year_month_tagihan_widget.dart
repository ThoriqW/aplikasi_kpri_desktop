import 'package:aplikasi_kpri_desktop/providers/bills_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/dropdown_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateYearMonthTagihanWidget extends ConsumerStatefulWidget {
  const UpdateYearMonthTagihanWidget(
      {super.key, required this.tahun, required this.bulan});
  final String tahun;
  final int bulan;
  @override
  ConsumerState<UpdateYearMonthTagihanWidget> createState() =>
      _UpdateYearMonthTagihanWidgetState();
}

class _UpdateYearMonthTagihanWidgetState
    extends ConsumerState<UpdateYearMonthTagihanWidget> {
  final TextEditingController tahunControllerController =
      TextEditingController();
  List<String> bulan = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];
  @override
  Widget build(BuildContext context) {
    tahunControllerController.text = widget.tahun;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Ganti Tahun Simpanan",
                  ),
                  const SizedBox(height: 12),
                  TextFormWidget(
                      controller: tahunControllerController, text: ""),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Bulan",
                ),
                const SizedBox(height: 12),
                DropdownWidget(
                    currentDropDownName: bulan[widget.bulan - 1],
                    items: bulan,
                    onSelected: (value) {
                      ref
                          .watch(editTagihanNotifierProvider.notifier)
                          .setEditDataTagihan(
                            tahunControllerController.text,
                            bulan.indexOf(value) + 1,
                          );
                    }),
              ],
            ),
          ],
        ),
        const SizedBox(height: 15),
        ButtonWidget(
          text: "Simpan",
          onTap: () async {
            await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Info"),
                  content: Text(
                    "Yakin update tagihan tahun ${widget.tahun} bulan ${widget.bulan}?",
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
                          widget.tahun,
                          tahunControllerController.text,
                          widget.bulan.toString(),
                          ref
                              .watch(editTagihanNotifierProvider.notifier)
                              .getEditDataTagihan()['bulan']
                              .toString(),
                        );
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

  Future<void> _updateTahunSavings(
      String tahun, String newTahun, String bulan, String newBulan) async {
    try {
      final updateTahunSavings = await ref.watch(
        updateTahunBulanTagihanProvider(tahun, newTahun, bulan, newBulan)
            .future,
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
