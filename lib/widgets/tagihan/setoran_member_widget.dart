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

class SetoranMemberWidget extends ConsumerStatefulWidget {
  const SetoranMemberWidget({
    super.key,
  });

  @override
  ConsumerState<SetoranMemberWidget> createState() =>
      SetoranMemberWidgettState();
}

class SetoranMemberWidgettState extends ConsumerState<SetoranMemberWidget> {
  final TextEditingController idMemberController = TextEditingController();
  final TextEditingController jmlSetoranSimpananPokokController =
      TextEditingController();
  final TextEditingController jmlSetoranSimpananWajibController =
      TextEditingController();
  final TextEditingController jmlSetoranSimpananDanaSosialController =
      TextEditingController();
  final TextEditingController jmlSetoranSimpananSukarelaController =
      TextEditingController();
  final TextEditingController jmlSetoranPokokController =
      TextEditingController();
  final TextEditingController jmlSetoranBungaController =
      TextEditingController();
  final TextEditingController jmlSetoranBarangController =
      TextEditingController();
  final TextEditingController sisaTunggakanController = TextEditingController();
  final TextEditingController keteranganController = TextEditingController();
  bool _isLoading = false;
  bool isInitialized = false;
  @override
  Widget build(BuildContext context) {
    final dataTagihanMember =
        ref.watch(dataMemberTagihanNotifierProvider.notifier).getData();

    if (!isInitialized) {
      idMemberController.text =
          dataTagihanMember['member_profile_id'].toString();
      jmlSetoranSimpananPokokController.text =
          dataTagihanMember['jml_setoran_simpanan_pokok'] != '0.00'
              ? double.parse(
                  dataTagihanMember['jml_setoran_simpanan_pokok'].toString(),
                ).round().toString()
              : '';
      jmlSetoranSimpananWajibController.text =
          dataTagihanMember['jml_setoran_simpanan_wajib'] != '0.00'
              ? double.parse(
                  dataTagihanMember['jml_setoran_simpanan_wajib'].toString(),
                ).round().toString()
              : '';
      jmlSetoranSimpananDanaSosialController.text =
          dataTagihanMember['jml_setoran_dana_sosial'] != '0.00'
              ? double.parse(
                  dataTagihanMember['jml_setoran_dana_sosial'].toString(),
                ).round().toString()
              : '';
      jmlSetoranSimpananSukarelaController.text =
          dataTagihanMember['jml_setoran_sukarela'] != '0.00'
              ? double.parse(
                  dataTagihanMember['jml_setoran_sukarela'].toString(),
                ).round().toString()
              : '';
      jmlSetoranPokokController.text =
          dataTagihanMember['jml_setoran_pokok'] != '0.00'
              ? double.parse(
                  dataTagihanMember['jml_setoran_pokok'].toString(),
                ).round().toString()
              : '';
      jmlSetoranBungaController.text =
          dataTagihanMember['jml_setoran_bunga'] != '0.00'
              ? double.parse(
                  dataTagihanMember['jml_setoran_bunga'].toString(),
                ).round().toString()
              : '';
      jmlSetoranBarangController.text =
          dataTagihanMember['jml_setoran_barang'] != '0.00'
              ? double.parse(
                  dataTagihanMember['jml_setoran_barang'].toString(),
                ).round().toString()
              : '';
      sisaTunggakanController.text =
          dataTagihanMember['sisa_tunggakan'] != '0.00'
              ? double.parse(
                  dataTagihanMember['sisa_tunggakan'].toString(),
                ).round().toString()
              : '';

      keteranganController.text = dataTagihanMember['keterangan'];

      isInitialized = true;
    }
    return CustomCardWidget(
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
            "Setoran Anggota ${dataTagihanMember['nama_member']}",
            style: const TextStyle(
              color: GlobalColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
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
                            Text(
                              "Setoran Simpanan Pokok",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFormWidget(
                              controller: jmlSetoranSimpananPokokController,
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
                            Text(
                              "Setoran Simpanan Wajib",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFormWidget(
                                controller: jmlSetoranSimpananWajibController,
                                text: ""),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Setoran Dana Sosial",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFormWidget(
                              controller:
                                  jmlSetoranSimpananDanaSosialController,
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
                            Text(
                              "Setoran Sukarela",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFormWidget(
                                controller:
                                    jmlSetoranSimpananSukarelaController,
                                text: ""),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Setoran Pokok",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFormWidget(
                              controller: jmlSetoranPokokController,
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
                            Text(
                              "Setoran Bunga",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFormWidget(
                                controller: jmlSetoranBungaController,
                                text: ""),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Setoran Barang",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFormWidget(
                              controller: jmlSetoranBarangController,
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
                            Text(
                              "Sisa Tunggakan",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFormWidget(
                              controller: sisaTunggakanController,
                              text: '',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Keterangan",
                        style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
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
          "member_profile_id": idMemberController.text,
          "jumlah_setoran_simpanan_pokok":
              jmlSetoranSimpananPokokController.text,
          "jumlah_setoran_simpanan_wajib":
              jmlSetoranSimpananWajibController.text,
          "jumlah_setoran_dana_sosial":
              jmlSetoranSimpananDanaSosialController.text,
          "jumlah_setoran_sukarela": jmlSetoranSimpananSukarelaController.text,
          "jumlah_setoran_pokok": jmlSetoranPokokController.text,
          "jumlah_setoran_bunga": jmlSetoranBungaController.text,
          "jumlah_setoran_barang": jmlSetoranBarangController.text,
          "sisa_tunggakan": sisaTunggakanController.text,
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
