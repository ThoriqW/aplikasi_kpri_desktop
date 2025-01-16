import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/header_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/tagihan/bottom_navigation_tagihan_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/tagihan/data_tagihan_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TagihanWidget extends ConsumerWidget {
  const TagihanWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 75.0, bottom: 30.0),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [DataTagihanWidget()],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: HeaderWidget(),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomCardWidget(
            color: GlobalColors.white,
            padding: EdgeInsets.only(bottom: 20, left: 10, right: 10, top: 20),
            child: BottomNavigationTagihanWidget(),
          ),
        ),
      ],
    );
  }
}
