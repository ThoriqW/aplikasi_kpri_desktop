import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/bills_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateTagihanMemberWidget extends ConsumerStatefulWidget {
  const UpdateTagihanMemberWidget({
    super.key,
  });

  @override
  ConsumerState<UpdateTagihanMemberWidget> createState() =>
      _UpdateTagihanMemberWidgetState();
}

class _UpdateTagihanMemberWidgetState
    extends ConsumerState<UpdateTagihanMemberWidget> {
  final TextEditingController memberProfileIdController =
      TextEditingController();
  final TextEditingController simpananWajibController = TextEditingController();
  final TextEditingController danaSosialController = TextEditingController();
  final TextEditingController pokokController = TextEditingController();
  final TextEditingController bungaController = TextEditingController();
  final TextEditingController barangController = TextEditingController();
  final TextEditingController jangkaWaktuController = TextEditingController();
  final TextEditingController jangkaWaktuKeController = TextEditingController();
  final TextEditingController sisaTunggakanController = TextEditingController();
  final TextEditingController jumlahSetoranController = TextEditingController();
  final TextEditingController keteranganController = TextEditingController();
  bool _isLoading = false;
  bool isInitialized = false;
  @override
  Widget build(BuildContext context) {
    final dataTagihanMember =
        ref.watch(dataMemberTagihanNotifierProvider.notifier).getData();

    if (!isInitialized) {
      memberProfileIdController.text =
          dataTagihanMember['member_profile_id'].toString();
      simpananWajibController.text =
          dataTagihanMember['simpanan_wajib'] != '0.00'
              ? double.parse(
                  dataTagihanMember['simpanan_wajib'].toString(),
                ).round().toString()
              : '';
      danaSosialController.text = dataTagihanMember['dana_sosial'] != '0.00'
          ? double.parse(
              dataTagihanMember['dana_sosial'].toString(),
            ).round().toString()
          : '';
      pokokController.text = dataTagihanMember['pokok'] != '0.00'
          ? double.parse(
              dataTagihanMember['pokok'].toString(),
            ).round().toString()
          : '';
      bungaController.text = dataTagihanMember['bunga'] != '0.00'
          ? double.parse(
              dataTagihanMember['bunga'].toString(),
            ).round().toString()
          : '';
      barangController.text = dataTagihanMember['barang'] != '0.00'
          ? double.parse(
              dataTagihanMember['barang'].toString(),
            ).round().toString()
          : '';
      jangkaWaktuController.text = dataTagihanMember['jangka_waktu'] != '0'
          ? double.parse(
              dataTagihanMember['jangka_waktu'].toString(),
            ).round().toString()
          : '';
      jangkaWaktuKeController.text = dataTagihanMember['jangka_waktu_ke'] != '0'
          ? double.parse(
              dataTagihanMember['jangka_waktu_ke'].toString(),
            ).round().toString()
          : '';
      sisaTunggakanController.text =
          dataTagihanMember['sisa_tunggakan'] != '0.00'
              ? double.parse(
                  dataTagihanMember['sisa_tunggakan'].toString(),
                ).round().toString()
              : '';

      jumlahSetoranController.text =
          dataTagihanMember['jumlah_setoran'] != '0.00'
              ? double.parse(
                  dataTagihanMember['jumlah_setoran'].toString(),
                ).round().toString()
              : '';

      keteranganController.text = dataTagihanMember['keterangan'];

      isInitialized = true;
    }
    return CustomCardWidget(
      color: GlobalColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              ref.watch(tagihanModeNotifierProvider.notifier).switchToView();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          const SizedBox(height: 20),
          Text(
            "Update Tagihan Anggota ${dataTagihanMember['nama_member']}",
            style: const TextStyle(
              color: GlobalColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "ID Member",
                            ),
                            const SizedBox(height: 10),
                            TextFormWidget(
                              controller: memberProfileIdController,
                              text: "",
                              isEnabled: false,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Simpanan Wajib",
                            ),
                            const SizedBox(height: 10),
                            TextFormWidget(
                                controller: simpananWajibController, text: ""),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Dana Sosial",
                            ),
                            const SizedBox(height: 10),
                            TextFormWidget(
                                controller: danaSosialController, text: ""),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Pokok",
                            ),
                            const SizedBox(height: 10),
                            TextFormWidget(
                                controller: pokokController, text: ""),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Bunga",
                            ),
                            const SizedBox(height: 10),
                            TextFormWidget(
                                controller: bungaController, text: ""),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Barang",
                            ),
                            const SizedBox(height: 10),
                            TextFormWidget(
                                controller: barangController, text: ""),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Jangka Waktu",
                            ),
                            const SizedBox(height: 10),
                            TextFormWidget(
                                controller: jangkaWaktuController, text: ""),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Jangka Waktu Ke",
                            ),
                            const SizedBox(height: 10),
                            TextFormWidget(
                                controller: jangkaWaktuKeController, text: ""),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Sisa Tunggakan",
                            ),
                            const SizedBox(height: 10),
                            TextFormWidget(
                              controller: sisaTunggakanController,
                              text: "",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Jumlah Setoran",
                            ),
                            const SizedBox(height: 10),
                            TextFormWidget(
                              controller: jumlahSetoranController,
                              text: '',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Keterangan",
                      ),
                      const SizedBox(height: 10),
                      TextFormWidget(
                        controller: keteranganController,
                        text: "",
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ButtonWidget(
                    text: _isLoading ? "Loading..." : "Simpan",
                    onTap: () async {
                      updateDataTagihan(
                        dataTagihanMember['tahun'],
                        dataTagihanMember['bulan'],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> updateDataTagihan(
    int tahun,
    int bulan,
  ) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final updateMemberSavings = await ref.watch(updateMemberTagihanProvider(
        tahun,
        bulan,
        {
          "member_profile_id": memberProfileIdController.text,
          "simpanan_wajib": simpananWajibController.text,
          "dana_sosial": danaSosialController.text,
          "pokok": pokokController.text,
          "bunga": bungaController.text,
          "barang": barangController.text,
          "jangka_waktu": jangkaWaktuController.text,
          "jangka_waktu_ke": jangkaWaktuKeController.text,
          "sisa_tunggakan": sisaTunggakanController.text,
          "jumlah_setoran": jumlahSetoranController.text,
          "keterangan": keteranganController.text,
        },
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
        ).then((_) {
          ref
              .watch(dataMemberTagihanNotifierProvider.notifier)
              .clearDataMemberTagihan();
          ref.watch(tagihanModeNotifierProvider.notifier).switchToView();
        });
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
      setState(() {
        _isLoading = false;
      });
    }
  }
}
