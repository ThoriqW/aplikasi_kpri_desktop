import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/saving_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddMemberSimpananWidget extends ConsumerStatefulWidget {
  const AddMemberSimpananWidget(
      {super.key, required this.year, required this.workUnitID});

  final String year;
  final int workUnitID;

  @override
  ConsumerState<AddMemberSimpananWidget> createState() =>
      _AddMemberSimpananWidgetState();
}

class _AddMemberSimpananWidgetState
    extends ConsumerState<AddMemberSimpananWidget> {
  final TextEditingController idUserController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      color: GlobalColors.white,
      child: Row(
        children: [
          const Text(
            "Tambah Member Simpanan",
          ),
          const SizedBox(width: 12),
          Expanded(
              child: TextFormWidget(
                  controller: idUserController, text: "ID User")),
          const SizedBox(width: 12),
          IconButton(
            onPressed: () {
              _addMemberSavings();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Future<void> _addMemberSavings() async {
    try {
      final addMemberSavings = await ref.read(
        addMemberSavingsProvider(
          idUserController.text,
          widget.year,
        ).future,
      );
      if (!mounted) return;
      if (addMemberSavings is SuccessResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: addMemberSavings.message,
              alertTitle: "Sukses",
            );
          },
        ).then(
          (value) => ref.invalidate(
            getAllSavingMembersProvider(
              widget.year.toString(),
              widget.workUnitID,
              '',
            ),
          ),
        );
      } else if (addMemberSavings is ErrorResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: addMemberSavings.errors,
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
        idUserController.clear();
      }
    }
  }
}
