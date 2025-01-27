import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/admin_provider.dart';
import 'package:aplikasi_kpri_desktop/providers/setting_provider.dart';
import 'package:aplikasi_kpri_desktop/providers/work_units_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateFixedSettingWidget extends ConsumerStatefulWidget {
  const UpdateFixedSettingWidget({super.key});

  @override
  ConsumerState<UpdateFixedSettingWidget> createState() =>
      _UpdateFixedSettingWidgetState();
}

class _UpdateFixedSettingWidgetState
    extends ConsumerState<UpdateFixedSettingWidget> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nilaiController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  bool _isLoading = false;
  bool isInitialized = false;
  @override
  Widget build(BuildContext context) {
    final getFixedSetting = ref.watch(getFixedSettingProvider(
        ref.watch(idFixedSettingProvider.notifier).getId().toString()));
    return CustomCardWidget(
      child: getFixedSetting.when(
        data: (workUnit) {
          if (workUnit == null) {
            return const Text("Data tidak valid");
          }
          if (workUnit is ErrorResponse) {
            return Text(workUnit.toString());
          }

          final workUnitData = workUnit as Map<String, dynamic>;

          if (!isInitialized) {
            namaController.text = workUnitData['nama'] ?? '';
            nilaiController.text = workUnitData['nilai'] ?? '';
            deskripsiController.text = workUnitData['deskripsi'] ?? '';
            isInitialized = true;
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () async {
                  ref
                      .watch(settingModeNotifierProvider.notifier)
                      .switchToView();
                },
              ),
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
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
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
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
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
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormWidget(
                            controller: deskripsiController, text: ""),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ButtonWidget(
                text: _isLoading ? "Loading..." : "Simpan",
                onTap: () async {
                  _updateFixedSetting(
                      ref.watch(idFixedSettingProvider).toString());
                },
              ),
            ],
          );
        },
        error: (error, stackTrace) => const Text('Gagal terhubung ke server!!'),
        loading: () => const Align(
          alignment: Alignment.topCenter,
          child: LinearProgressIndicator(),
        ),
      ),
    );
  }

  Future<void> _updateFixedSetting(String id) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final updateWorkUnit = await ref.watch(updateWorkUnitProvider(
        namaController.text,
        nilaiController.text,
        deskripsiController.text,
      ).future);
      if (!mounted) return;
      if (updateWorkUnit is SuccessResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: updateWorkUnit.message,
              alertTitle: "Sukses",
            );
          },
        ).then(
            (_) => ref.read(adminModeNotifierProvider.notifier).switchToView());
      } else if (updateWorkUnit is ErrorResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: updateWorkUnit.errors,
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
    }
  }
}
