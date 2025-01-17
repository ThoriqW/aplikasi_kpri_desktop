import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/saving_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateSimpananWidget extends ConsumerStatefulWidget {
  const UpdateSimpananWidget({
    super.key,
    required this.tahun,
    required this.workUnitId,
    required this.currentPage,
    required this.perPage,
    required this.searchQuery,
  });

  final int tahun;
  final int workUnitId;
  final String searchQuery;
  final int perPage;
  final int currentPage;

  @override
  ConsumerState<UpdateSimpananWidget> createState() =>
      _UpdateSimpananWidgetState();
}

class _UpdateSimpananWidgetState extends ConsumerState<UpdateSimpananWidget> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ButtonWidget(
          text: _isLoading ? "Loading..." : "Simpan",
          onTap: () {
            updateDataSavings(widget.tahun, widget.workUnitId);
          },
        ),
        const SizedBox(
          height: 4,
        ),
        const Text(
          "*tekan enter setelah edit simpanan",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: GlobalColors.onBackground,
          ),
        ),
      ],
    );
  }

  Future<void> updateDataSavings(
    int tahun,
    int workUnitId,
  ) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final updateMemberSavings = await ref.watch(updateMemberSavingsProvider(
        tahun,
        workUnitId,
        ref.watch(updateSavingObjectProvider.notifier).getUpdateValueSaving(),
      ).future);
      if (!mounted) return;
      if (updateMemberSavings is SuccessResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: updateMemberSavings.message,
              alertTitle: "Sukses",
            );
          },
        ).then(
          (_) => ref.invalidate(
            getAllSavingMembersProvider(
              widget.tahun,
              int.parse(workUnitId.toString()),
              widget.searchQuery,
              widget.perPage,
              widget.currentPage,
            ),
          ),
        );
      } else if (updateMemberSavings is ErrorResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: updateMemberSavings.errors,
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
      ref.watch(updateSavingObjectProvider.notifier).clearUpdateValueSaving();
      setState(() {
        _isLoading = false;
      });
    }
  }
}
