import 'package:aplikasi_kpri_desktop/providers/saving_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateSimpananWidget extends ConsumerStatefulWidget {
  const CreateSimpananWidget(
      {super.key, required this.tahun, required this.onComplete});

  final int tahun;
  final VoidCallback onComplete;

  @override
  ConsumerState<CreateSimpananWidget> createState() =>
      _CreateSimpananWidgetState();
}

class _CreateSimpananWidgetState extends ConsumerState<CreateSimpananWidget> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: _isLoading ? const Icon(Icons.autorenew) : const Icon(Icons.add),
      label: Text(
        _isLoading ? "Loading..." : 'Tambah Simpanan ${widget.tahun}',
      ),
      onPressed: () {
        createSimpanan(widget.tahun);
      },
    );
  }

  Future<void> createSimpanan(int tahun) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final createSimpanan =
          await ref.watch(createMemberSavingsProvider(tahun).future);
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
      if (createSimpanan is SuccessResponse) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: createSimpanan.message,
              alertTitle: "Sukses",
            );
          },
        ).then((_) {
          widget.onComplete();
        });
      } else if (createSimpanan is ErrorResponse) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: createSimpanan.errors,
              alertTitle: "Gagal",
            );
          },
        );
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
      showDialog(
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
