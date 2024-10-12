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
  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      color: GlobalColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Tambah Work Unit",
            style: TextStyle(
              color: GlobalColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          TextFormWidget(
              controller: namaWorkUnitController, text: "Nama Work Unit"),
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
        addWorkUnitProvider(namaWorkUnitController.text).future,
      );
      if (!mounted) return;
      if (addWorkUnit is SuccessResponse) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: addWorkUnit.message,
              alertTitle: "Sukses",
            );
          },
        ).then((value) => ref.refresh(getAllWorkUnitsProvider));
      } else if (addWorkUnit is ErrorResponse) {
        showDialog(
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
      showDialog(
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
      }
    }
  }
}
