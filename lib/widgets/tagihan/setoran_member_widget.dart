import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/bills_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SetoranMemberWidget extends ConsumerStatefulWidget {
  const SetoranMemberWidget({
    super.key,
    required this.jmlSetoranSimpananPokokController,
    required this.jmlSetoranSimpananWajibController,
    required this.jmlSetoranSimpananDanaSosialController,
    required this.jmlSetoranSimpananSukarelaController,
    required this.jmlSetoranPokokController,
    required this.jmlSetoranBungaController,
    required this.jmlSetoranBarangController,
    required this.sisaTunggakanController,
    required this.keteranganController,
  });

  final TextEditingController jmlSetoranSimpananPokokController;
  final TextEditingController jmlSetoranSimpananWajibController;
  final TextEditingController jmlSetoranSimpananDanaSosialController;
  final TextEditingController jmlSetoranSimpananSukarelaController;
  final TextEditingController jmlSetoranPokokController;
  final TextEditingController jmlSetoranBungaController;
  final TextEditingController jmlSetoranBarangController;
  final TextEditingController sisaTunggakanController;
  final TextEditingController keteranganController;

  @override
  ConsumerState<SetoranMemberWidget> createState() =>
      SetoranMemberWidgettState();
}

class SetoranMemberWidgettState extends ConsumerState<SetoranMemberWidget> {
  bool isInitialized = false;
  @override
  Widget build(BuildContext context) {
    final dataTagihanMember =
        ref.watch(dataMemberTagihanNotifierProvider.notifier).getData();

    if (!isInitialized) {
      widget.jmlSetoranSimpananPokokController.text =
          dataTagihanMember['jml_setoran_simpanan_pokok'] != '0.00'
              ? double.parse(
                  dataTagihanMember['jml_setoran_simpanan_pokok'].toString(),
                ).round().toString()
              : '';
      widget.jmlSetoranSimpananWajibController.text =
          dataTagihanMember['jml_setoran_simpanan_wajib'] != '0.00'
              ? double.parse(
                  dataTagihanMember['jml_setoran_simpanan_wajib'].toString(),
                ).round().toString()
              : '';
      widget.jmlSetoranSimpananDanaSosialController.text =
          dataTagihanMember['jml_setoran_dana_sosial'] != '0.00'
              ? double.parse(
                  dataTagihanMember['jml_setoran_dana_sosial'].toString(),
                ).round().toString()
              : '';
      widget.jmlSetoranSimpananSukarelaController.text =
          dataTagihanMember['jml_setoran_sukarela'] != '0.00'
              ? double.parse(
                  dataTagihanMember['jml_setoran_sukarela'].toString(),
                ).round().toString()
              : '';
      widget.jmlSetoranPokokController.text =
          dataTagihanMember['jml_setoran_pokok'] != '0.00'
              ? double.parse(
                  dataTagihanMember['jml_setoran_pokok'].toString(),
                ).round().toString()
              : '';
      widget.jmlSetoranBungaController.text =
          dataTagihanMember['jml_setoran_bunga'] != '0.00'
              ? double.parse(
                  dataTagihanMember['jml_setoran_bunga'].toString(),
                ).round().toString()
              : '';
      widget.jmlSetoranBarangController.text =
          dataTagihanMember['jml_setoran_barang'] != '0.00'
              ? double.parse(
                  dataTagihanMember['jml_setoran_barang'].toString(),
                ).round().toString()
              : '';
      widget.sisaTunggakanController.text =
          dataTagihanMember['sisa_tunggakan'] != '0.00'
              ? double.parse(
                  dataTagihanMember['sisa_tunggakan'].toString(),
                ).round().toString()
              : '';

      widget.keteranganController.text = dataTagihanMember['keterangan'];

      isInitialized = true;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Setoran ${dataTagihanMember['nama_member']}",
          style: const TextStyle(
            color: GlobalColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 20),
        Column(
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
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormWidget(
                        controller: widget.jmlSetoranSimpananPokokController,
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
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormWidget(
                          controller: widget.jmlSetoranSimpananWajibController,
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
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormWidget(
                        controller:
                            widget.jmlSetoranSimpananDanaSosialController,
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
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormWidget(
                          controller:
                              widget.jmlSetoranSimpananSukarelaController,
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
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormWidget(
                        controller: widget.jmlSetoranPokokController,
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
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormWidget(
                          controller: widget.jmlSetoranBungaController,
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
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormWidget(
                        controller: widget.jmlSetoranBarangController,
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
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormWidget(
                        controller: widget.sisaTunggakanController,
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
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                TextFormWidget(
                  controller: widget.keteranganController,
                  text: "",
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
