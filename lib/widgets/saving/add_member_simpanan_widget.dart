import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/saving_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddMemberSimpananWidget extends ConsumerStatefulWidget {
  const AddMemberSimpananWidget({
    super.key,
    required this.year,
    required this.workUnitID,
    required this.perPage,
    required this.currentPage,
  });

  final String year;
  final int workUnitID;
  final int perPage;
  final int currentPage;

  @override
  ConsumerState<AddMemberSimpananWidget> createState() =>
      _AddMemberSimpananWidgetState();
}

class _AddMemberSimpananWidgetState
    extends ConsumerState<AddMemberSimpananWidget> {
  final TextEditingController idUserController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      color: GlobalColors.white,
      child: Row(
        children: [
          const Text(
            "Tambah Anggota Simpanan",
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextFormField(
              controller: idUserController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                filled: false,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 12,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(0)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: GlobalColors.primary,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          IconButton(
            onPressed: () {
              _addMemberSavings();
            },
            icon: _isLoading
                ? const Icon(
                    Icons.autorenew,
                    color: GlobalColors.primary,
                  )
                : const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Future<void> _addMemberSavings() async {
    setState(() {
      _isLoading = true;
    });
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
              widget.perPage,
              widget.currentPage,
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
          return const CustomAlertDialog(
            alertDesc: "Gagal terhubung ke server!!",
            alertTitle: "Error",
          );
        },
      );
    } finally {
      if (mounted) {
        idUserController.clear();
      }
      setState(() {
        _isLoading = false;
      });
    }
  }
}
