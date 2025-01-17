import 'package:aplikasi_kpri_desktop/providers/bills_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeleteMemberTagihanWidget extends ConsumerStatefulWidget {
  const DeleteMemberTagihanWidget({
    super.key,
    required this.tahun,
    required this.workUnitId,
    required this.searchQuery,
    required this.perPage,
    required this.currentPage,
    required this.bulan,
    required this.memberId,
  });

  final String searchQuery;
  final int bulan;
  final int tahun;
  final int workUnitId;
  final int perPage;
  final int currentPage;
  final int memberId;

  @override
  ConsumerState<DeleteMemberTagihanWidget> createState() =>
      _DeleteMemberTagihanWidgetState();
}

class _DeleteMemberTagihanWidgetState
    extends ConsumerState<DeleteMemberTagihanWidget> {
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
                  "Yakin hapus tagihan member?",
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
                      _deleteMemberTagihan(
                        widget.memberId.toString(),
                        widget.tahun.toString(),
                        widget.bulan.toString(),
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

  Future<void> _deleteMemberTagihan(
      String id, String tahun, String bulan) async {
    try {
      final deleteMemberSavings = await ref.watch(
        deleteMemberTagihanProvider(id, tahun, bulan).future,
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
        ref.invalidate(getAllBillsMembersProvider(
          widget.tahun,
          widget.workUnitId,
          widget.searchQuery,
          widget.bulan,
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
