import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/saving_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/member/dropdown_member_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddMemberSimpananWidget extends ConsumerStatefulWidget {
  const AddMemberSimpananWidget({
    super.key,
    required this.year,
    required this.workUnitID,
    required this.perPage,
    required this.currentPage,
  });

  final int year;
  final int workUnitID;
  final int perPage;
  final int currentPage;

  @override
  ConsumerState<AddMemberSimpananWidget> createState() =>
      _AddMemberSimpananWidgetState();
}

class _AddMemberSimpananWidgetState
    extends ConsumerState<AddMemberSimpananWidget> {
  int idMember = 0;
  bool _isLoading = false;
  Key dropdownMemberKey = UniqueKey();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Tambah Anggota Simpanan",
        ),
        const SizedBox(width: 12),
        DropdownMemberWidget(
          resetKey: dropdownMemberKey,
          onSelected: (value) {
            setState(() {
              idMember = int.parse(value);
            });
          },
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
    );
  }

  Future<void> _addMemberSavings() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final addMemberSavings = await ref.read(
        addMemberSavingsProvider(
          idMember.toString(),
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
              widget.year,
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
      setState(() {
        dropdownMemberKey = UniqueKey();
        idMember = 0;
        _isLoading = false;
      });
    }
  }
}
