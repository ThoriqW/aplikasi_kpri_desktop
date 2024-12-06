import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/admin_route_provider.dart';
import 'package:aplikasi_kpri_desktop/providers/work_units_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateWorkUnitWidget extends ConsumerStatefulWidget {
  const UpdateWorkUnitWidget({super.key, required this.homeAdmin});

  final Function homeAdmin;

  @override
  ConsumerState<UpdateWorkUnitWidget> createState() =>
      _UpdateWorkUnitWidgetState();
}

class _UpdateWorkUnitWidgetState extends ConsumerState<UpdateWorkUnitWidget> {
  final TextEditingController namaWorkUnitController = TextEditingController();
  final TextEditingController kodeWorkUnitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final getWorkUnit = ref.watch(getWorkUnitProvider(
        ref.watch(idWorkUnitNotifierProvider.notifier).getId().toString()));
    return CustomCardWidget(
      color: GlobalColors.white,
      child: getWorkUnit.when(
        data: (workUnit) {
          final workUnitData = workUnit as Map<String, dynamic>;

          namaWorkUnitController.text = workUnitData['name'];
          kodeWorkUnitController.text = workUnitData['code'] ?? '';

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ButtonWidget(
                text: "Kembali",
                onTap: () async {
                  widget.homeAdmin();
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "Update Work Unit",
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
                        const Text(
                          "Nama Work Unit",
                          style: TextStyle(
                            color: GlobalColors.onBackground,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(
                            controller: namaWorkUnitController,
                            text: "Nama Work Unit"),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Kode Work Unit",
                          style: TextStyle(
                            color: GlobalColors.onBackground,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormWidget(
                            controller: kodeWorkUnitController,
                            text: "Kode Work Unit"),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWidget(
                    text: "Simpan",
                    onTap: () async {
                      await _updateWorkUnit(workUnitData['id'].toString());
                    },
                  ),
                ],
              ),
            ],
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const LinearProgressIndicator(),
      ),
    );
  }

  Future<void> _updateWorkUnit(String id) async {
    try {
      final updateWorkUnit = await ref.watch(updateWorkUnitProvider(
        id,
        namaWorkUnitController.text,
        kodeWorkUnitController.text,
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
        ).then((_) => ref.invalidate(getWorkUnitProvider(ref
            .watch(idWorkUnitNotifierProvider.notifier)
            .getId()
            .toString())));
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
          return CustomAlertDialog(
            alertDesc: e.toString(),
            alertTitle: "Error",
          );
        },
      );
    }
  }
}
