import 'package:aplikasi_kpri_desktop/widgets/header_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/bar_chart_card.dart';
import 'package:aplikasi_kpri_desktop/widgets/dashboard_details_card.dart';
import 'package:flutter/material.dart';

class DashBoardWidget extends StatelessWidget {
  const DashBoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 78),
              DashboardDetailsCard(),
              SizedBox(height: 15),
              BarChartCard(),
              SizedBox(height: 20),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: HeaderWidget(),
        ),
      ],
    );
  }
}
