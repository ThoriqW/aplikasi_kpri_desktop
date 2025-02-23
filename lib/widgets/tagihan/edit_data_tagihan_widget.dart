import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/bills_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/tagihan/delete_tagihan_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/tagihan/update_year_month_tagihan_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditDataTagihanWidget extends ConsumerStatefulWidget {
  const EditDataTagihanWidget({super.key});

  @override
  ConsumerState<EditDataTagihanWidget> createState() =>
      _EditDataTagihanWidgetState();
}

class _EditDataTagihanWidgetState extends ConsumerState<EditDataTagihanWidget> {
  @override
  Widget build(BuildContext context) {
    final editDataTagihan =
        ref.watch(editTagihanNotifierProvider.notifier).getEditDataTagihan();
    return CustomCardWidget(
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
          Text(
            "Tagihan Tahun ${editDataTagihan['tahun']} Bulan ${editDataTagihan['bulan']}",
            style: const TextStyle(
              color: GlobalColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          UpdateYearMonthTagihanWidget(
              tahun: editDataTagihan['tahun'], bulan: editDataTagihan['bulan']),
          const SizedBox(height: 25),
          DeleteTagihanWidget(
            tahun: editDataTagihan['tahun'],
            bulan: editDataTagihan['bulan'],
          ),
        ],
      ),
    );
  }
}
