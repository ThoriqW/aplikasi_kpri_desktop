import 'package:aplikasi_kpri_desktop/widgets/header_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/bar_chart_card.dart';
import 'package:aplikasi_kpri_desktop/widgets/dashboard_details_card.dart';
import 'package:flutter/material.dart';

class DashBoardWidget extends StatelessWidget {
  const DashBoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: const Column(
          children: [
            SizedBox(height: 20),
            HeaderWidget(),
            SizedBox(height: 15),
            DashboardDetailsCard(),
            SizedBox(height: 15),
            BarChartCard(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
