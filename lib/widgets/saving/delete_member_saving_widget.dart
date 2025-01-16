import 'package:aplikasi_kpri_desktop/providers/saving_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeleteMemberSavingWidget extends ConsumerStatefulWidget {
  const DeleteMemberSavingWidget({
    super.key,
    required this.tahun,
    required this.workUnitId,
    required this.currentPage,
    required this.perPage,
    required this.searchQuery,
    required this.memberId,
    required this.tahunSaving,
  });

  final int tahun;
  final int workUnitId;
  final String searchQuery;
  final int perPage;
  final int currentPage;
  final String memberId;
  final String tahunSaving;

  @override
  ConsumerState<DeleteMemberSavingWidget> createState() =>
      _DeleteMemberSavingWidgetState();
}

class _DeleteMemberSavingWidgetState
    extends ConsumerState<DeleteMemberSavingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: IconButton(
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Info"),
                content: const Text(
                  "Yakin hapus member?",
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
                      _deleteMemberSavings(
                        widget.memberId,
                        widget.tahunSaving,
                      );
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        },
        icon: const Icon(
          Icons.delete,
          size: 18,
          color: Colors.redAccent,
        ),
      ),
    );
  }

  Future<void> _deleteMemberSavings(String id, String tahun) async {
    try {
      final deleteMemberSavings = await ref.watch(
        deleteMemberSavingsProvider(id, tahun).future,
      );
      if (!mounted) return;
      Navigator.pop(context, 'OK');
      if (deleteMemberSavings is SuccessResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: deleteMemberSavings.message,
              alertTitle: "Sukses",
            );
          },
        );
        ref.invalidate(getAllSavingMembersProvider(
          widget.tahun,
          widget.workUnitId,
          widget.searchQuery,
          widget.perPage,
          widget.currentPage,
        ));
      } else if (deleteMemberSavings is ErrorResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: deleteMemberSavings.errors,
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
