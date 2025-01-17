import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/bills_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/work_unit/work_units_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransferMemberTagihanWidget extends ConsumerStatefulWidget {
  const TransferMemberTagihanWidget({super.key});

  @override
  ConsumerState<TransferMemberTagihanWidget> createState() =>
      _TransferMemberTagihanWidgetState();
}

class _TransferMemberTagihanWidgetState
    extends ConsumerState<TransferMemberTagihanWidget> {
  final TextEditingController namaMemberController = TextEditingController();
  final TextEditingController namaWorkUnitController = TextEditingController();
  String selectedUnit = '';
  bool isInitialized = false;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final dataTransferTagihanMember =
        ref.watch(dataTransferMemberTagihanNotifierProvider.notifier).getData();
    if (!isInitialized) {
      namaMemberController.text = dataTransferTagihanMember['nama_member'];
      namaWorkUnitController.text = dataTransferTagihanMember['namaWorkUnit'];

      selectedUnit = dataTransferTagihanMember['unit_kerja_id'];

      isInitialized = true;
    }
    return CustomCardWidget(
      color: GlobalColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              ref
                  .watch(
                    tagihanModeNotifierProvider.notifier,
                  )
                  .switchToView();
            },
          ),
          const SizedBox(height: 20),
          const Text(
            "Pindah Unit Kerja",
            style: TextStyle(
              color: GlobalColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Nama Anggota",
                    ),
                    const SizedBox(height: 8),
                    TextFormWidget(
                      controller: namaMemberController,
                      text: "",
                      isEnabled: false,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Unit Kerja",
                    ),
                    const SizedBox(height: 8),
                    TextFormWidget(
                      controller: namaWorkUnitController,
                      text: "",
                      isEnabled: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              WorkUnitsDropdown(
                currentDropDownName: selectedUnit,
                onSelected: (String value) => setState(
                  () {
                    selectedUnit = value;
                  },
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              ButtonWidget(
                text: _isLoading ? "Loading..." : "Pindah",
                onTap: () async {
                  _transferMemberSaving(
                    dataTransferTagihanMember['member_profile_id'],
                    dataTransferTagihanMember['tahun'],
                    selectedUnit,
                    dataTransferTagihanMember['bulan'],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _transferMemberSaving(
    String id,
    String tahun,
    String workUnitId,
    String bulan,
  ) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final transferMemberSaving =
          await ref.watch(transferMemberTagihanProvider(
        id,
        tahun,
        workUnitId,
        bulan,
      ).future);
      if (!mounted) return;
      if (transferMemberSaving is SuccessResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: transferMemberSaving.message,
              alertTitle: "Sukses",
            );
          },
        ).then((_) {
          ref
              .watch(dataTransferMemberTagihanNotifierProvider.notifier)
              .clearDataTransferMemberTagihan();
          ref
              .watch(
                tagihanModeNotifierProvider.notifier,
              )
              .switchToView();
        });
      } else if (transferMemberSaving is ErrorResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: transferMemberSaving.errors,
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
        _isLoading = false;
      });
    }
  }
}
