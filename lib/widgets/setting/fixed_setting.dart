import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/setting_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/setting/table_fixed_setting.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FixedSettingWidget extends ConsumerStatefulWidget {
  const FixedSettingWidget({super.key});

  @override
  ConsumerState<FixedSettingWidget> createState() => _FixedSettingWidgetState();
}

class _FixedSettingWidgetState extends ConsumerState<FixedSettingWidget> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nilaiController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final searchFixedSetting = ref.watch(searchFixedSettingProvider);
    return CustomCardWidget(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Fixed Setting",
              style: TextStyle(
                color: GlobalColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nama",
                        style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormWidget(controller: namaController, text: ""),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nilai",
                        style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormWidget(controller: nilaiController, text: ""),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Deskripsi",
                        style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormWidget(controller: deskripsiController, text: ""),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ButtonWidget(
              text: _isLoading ? "Loading..." : "Simpan",
              onTap: () async {
                _createFixedSetting();
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 400,
              child: TableFixedSettingWidget(
                searchQuery: searchFixedSetting['searchQuery'],
                perPage: searchFixedSetting['perPage'],
                currentPage: searchFixedSetting['currentPage'],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _createFixedSetting() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final createFixedSetting = await ref.watch(createFixedSettingProvider(
        namaController.text,
        nilaiController.text,
        deskripsiController.text,
      ).future);
      if (!mounted) return;
      if (createFixedSetting is SuccessResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: createFixedSetting.message,
              alertTitle: "Sukses",
            );
          },
        ).then((_) {
          namaController.clear();
          nilaiController.clear();
          deskripsiController.clear();
          ref.invalidate(getAllFixedSettingProvider);
        });
      } else if (createFixedSetting is ErrorResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: createFixedSetting.errors,
              alertTitle: "Gagal",
            );
          },
        );
      }
    } catch (e) {
      if (!mounted) return;
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return const CustomAlertDialog(
            alertDesc: "Gagal terhubung ke server!!",
            alertTitle: "Error",
          );
        },
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
      namaController.clear();
      nilaiController.clear();
      deskripsiController.clear();
    }
  }
}
