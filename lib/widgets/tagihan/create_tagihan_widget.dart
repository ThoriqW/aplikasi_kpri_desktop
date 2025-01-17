import 'package:aplikasi_kpri_desktop/providers/bills_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateTagihanWidget extends ConsumerStatefulWidget {
  const CreateTagihanWidget({
    super.key,
    required this.tahun,
    required this.onComplete,
    required this.bulan,
  });

  final int tahun;
  final int bulan;
  final Future<void> Function() onComplete;

  @override
  ConsumerState<CreateTagihanWidget> createState() =>
      _CreateTagihanWidgetState();
}

class _CreateTagihanWidgetState extends ConsumerState<CreateTagihanWidget> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: _isLoading ? const Icon(Icons.autorenew) : const Icon(Icons.add),
      label: Text(
        _isLoading
            ? "Loading..."
            : 'Tambah Tagihan Bulan ${widget.bulan} Tahun ${widget.tahun}',
      ),
      onPressed: () {
        createTagihanMember(widget.tahun, widget.bulan);
      },
    );
  }

  Future<void> createTagihanMember(int tahun, int bulan) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final createTagihanMember =
          await ref.watch(createMemberTagihanProvider(tahun, bulan).future);
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
      if (createTagihanMember is SuccessResponse) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: createTagihanMember.message,
              alertTitle: "Sukses",
            );
          },
        ).then((_) {
          widget.onComplete();
        });
      } else if (createTagihanMember is ErrorResponse) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: createTagihanMember.errors,
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
          return const CustomAlertDialog(
            alertDesc: "Gagal terhubung ke server!!",
            alertTitle: "Gagal",
          );
        },
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
