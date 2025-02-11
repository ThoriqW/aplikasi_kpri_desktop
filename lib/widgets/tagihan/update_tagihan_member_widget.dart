import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/bills_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/tagihan/setoran_member_widget.dart';
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
  final TextEditingController idMemberController = TextEditingController();
  final TextEditingController simpananPokokController = TextEditingController();
  final TextEditingController simpananWajibController = TextEditingController();
  final TextEditingController danaSosialController = TextEditingController();
  final TextEditingController sukarelaController = TextEditingController();
  final TextEditingController pokokController = TextEditingController();
  final TextEditingController bungaController = TextEditingController();
  final TextEditingController barangController = TextEditingController();
  final TextEditingController jangkaWaktuController = TextEditingController();
  final TextEditingController jangkaWaktuKeController = TextEditingController();
  final TextEditingController jmlPinjamanController = TextEditingController();
  final TextEditingController jmlTagihanController = TextEditingController();
  //SETORAN
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
      simpananPokokController.text =
          dataTagihanMember['simpanan_pokok'] != '0.00'
              ? double.parse(
                  dataTagihanMember['simpanan_pokok'].toString(),
                ).round().toString()
              : '';
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
      sukarelaController.text = dataTagihanMember['sukarela'] != '0.00'
          ? double.parse(
              dataTagihanMember['sukarela'].toString(),
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
      jmlPinjamanController.text = dataTagihanMember['jml_pinjaman'] != '0.00'
          ? double.parse(
              dataTagihanMember['jml_pinjaman'].toString(),
            ).round().toString()
          : '';
      jmlTagihanController.text = dataTagihanMember['jml_tagihan'] != '0.00'
          ? double.parse(
              dataTagihanMember['jml_tagihan'].toString(),
            ).round().toString()
          : '';
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
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Text(
              getMonthName(dataTagihanMember['bulan']),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Tagihan ${dataTagihanMember['nama_member']}",
                          style: const TextStyle(
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
                                  Text(
                                    "Simpanan Pokok",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormWidget(
                                      controller: simpananPokokController,
                                      text: ""),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Simpanan Wajib",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormWidget(
                                    controller: simpananWajibController,
                                    text: "",
                                  ),
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
                                    "Dana Sosial",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormWidget(
                                      controller: danaSosialController,
                                      text: ""),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Sukarela",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormWidget(
                                      controller: sukarelaController, text: ""),
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
                                    "Pokok",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormWidget(
                                      controller: pokokController, text: ""),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Bunga",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormWidget(
                                      controller: bungaController, text: ""),
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
                                    "Barang",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormWidget(
                                      controller: barangController, text: ""),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Jangka Waktu",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormWidget(
                                      controller: jangkaWaktuController,
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
                                    "Jangka Waktu Ke",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormWidget(
                                      controller: jangkaWaktuKeController,
                                      text: ""),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Jumlah Pinjaman",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormWidget(
                                    controller: jmlPinjamanController,
                                    text: "",
                                  ),
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
                                    "Jumlah Tagihan",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormWidget(
                                      controller: jmlTagihanController,
                                      text: ""),
                                ],
                              ),
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
                  const SizedBox(width: 20),
                  Expanded(
                      child: SetoranMemberWidget(
                    jmlSetoranBarangController: jmlSetoranBarangController,
                    jmlSetoranBungaController: jmlSetoranBungaController,
                    jmlSetoranPokokController: jmlSetoranPokokController,
                    jmlSetoranSimpananDanaSosialController:
                        jmlSetoranSimpananDanaSosialController,
                    jmlSetoranSimpananPokokController:
                        jmlSetoranSimpananPokokController,
                    jmlSetoranSimpananSukarelaController:
                        jmlSetoranSimpananSukarelaController,
                    jmlSetoranSimpananWajibController:
                        jmlSetoranSimpananWajibController,
                    keteranganController: keteranganController,
                    sisaTunggakanController: sisaTunggakanController,
                  ))
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
          "simpanan_pokok": simpananPokokController.text,
          "simpanan_wajib": simpananWajibController.text,
          "dana_sosial": danaSosialController.text,
          "sukarela": sukarelaController.text,
          "pokok": pokokController.text,
          "bunga": bungaController.text,
          "barang": barangController.text,
          "jangka_waktu": jangkaWaktuController.text,
          "jangka_waktu_ke": jangkaWaktuKeController.text,
          "jumlah_pinjaman": jmlPinjamanController.text,
          "jumlah_tagihan": jmlTagihanController.text,
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

  List<String> months = [
    '',
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];

  String getMonthName(int month) {
    if (month < 1 || month > 12) return 'Invalid month';
    return months[month];
  }
}
