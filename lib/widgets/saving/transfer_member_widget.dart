import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/saving_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/work_unit/work_units_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransferMemberWidget extends ConsumerStatefulWidget {
  const TransferMemberWidget({super.key});

  @override
  ConsumerState<TransferMemberWidget> createState() =>
      _TransferMemberWidgetState();
}

class _TransferMemberWidgetState extends ConsumerState<TransferMemberWidget> {
  final TextEditingController namaMemberController = TextEditingController();
  final TextEditingController namaWorkUnitController = TextEditingController();
  String selectedUnit = '';
  String currentDropDownName = '';
  bool isInitialized = false;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final dataTransferSavingsMember =
        ref.watch(dataTransferMemberSavingsNotifierProvider.notifier).getData();
    if (!isInitialized) {
      namaMemberController.text =
          dataTransferSavingsMember['nama_member'].toString();
      namaWorkUnitController.text =
          dataTransferSavingsMember['namaWorkUnit'].toString();

      selectedUnit = dataTransferSavingsMember['unit_kerja_id'].toString();
      currentDropDownName =
          dataTransferSavingsMember['namaWorkUnit'].toString();

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
                    savingModeNotifierProvider.notifier,
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
                currentDropDownName: currentDropDownName,
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
                    dataTransferSavingsMember['member_profile_id'].toString(),
                    dataTransferSavingsMember['tahun'].toString(),
                    selectedUnit,
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
  ) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final transferMemberSaving =
          await ref.watch(transferMemberSavingsProvider(
        id,
        tahun,
        workUnitId,
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
              .watch(dataTransferMemberSavingsNotifierProvider.notifier)
              .clearDataTransferMemberSavings();
          ref
              .watch(
                savingModeNotifierProvider.notifier,
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
