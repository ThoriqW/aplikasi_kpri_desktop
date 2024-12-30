import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/work_units_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddWorkUnitWidget extends ConsumerStatefulWidget {
  const AddWorkUnitWidget({super.key});

  @override
  ConsumerState<AddWorkUnitWidget> createState() => _AddWorkUnitWidgetState();
}

class _AddWorkUnitWidgetState extends ConsumerState<AddWorkUnitWidget> {
  final TextEditingController namaWorkUnitController = TextEditingController();
  final TextEditingController kodeWorkUnitController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      color: GlobalColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Tambah Unit Kerja",
            style: TextStyle(
              color: GlobalColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Nama Work Unit",
              ),
              const SizedBox(height: 8),
              TextFormWidget(controller: namaWorkUnitController, text: ""),
            ],
          ),
          const SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Kode Work Unit",
              ),
              const SizedBox(height: 8),
              TextFormWidget(controller: kodeWorkUnitController, text: ""),
            ],
          ),
          const SizedBox(height: 15),
          ButtonWidget(
            text: "Simpan",
            onTap: () async {
              await _saveWorkUnit();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _saveWorkUnit() async {
    try {
      final addWorkUnit = await ref.read(
        addWorkUnitProvider(
                namaWorkUnitController.text, kodeWorkUnitController.text)
            .future,
      );
      if (!mounted) return;
      if (addWorkUnit is SuccessResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: addWorkUnit.message,
              alertTitle: "Sukses",
            );
          },
        ).then((value) => ref.invalidate(getAllWorkUnitsProvider));
      } else if (addWorkUnit is ErrorResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: addWorkUnit.errors,
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
    } finally {
      if (mounted) {
        namaWorkUnitController.clear();
        kodeWorkUnitController.clear();
      }
    }
  }
}
