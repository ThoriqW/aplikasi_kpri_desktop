import 'package:aplikasi_kpri_desktop/providers/saving_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateSimpananWidget extends ConsumerStatefulWidget {
  const CreateSimpananWidget(
      {super.key, required this.tahun, required this.onComplete});

  final String tahun;
  final VoidCallback onComplete;

  @override
  ConsumerState<CreateSimpananWidget> createState() =>
      _CreateSimpananWidgetState();
}

class _CreateSimpananWidgetState extends ConsumerState<CreateSimpananWidget> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return CustomCardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Belum ada simpanan tahun ${widget.tahun}",
            style: const TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ButtonWidget(
                  text: "Buat Simpanan ${widget.tahun}",
                  onTap: () {
                    createSimpanan(widget.tahun);
                  },
                  width: 160,
                ),
        ],
      ),
    );
  }

  Future<void> createSimpanan(String year) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final createSimpanan =
          await ref.watch(createMemberSavingsProvider(year).future);
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
          return CustomAlertDialog(
            alertDesc: e.toString().substring(11),
            alertTitle: "Gagal",
          );
        },
      );
    }
  }
}