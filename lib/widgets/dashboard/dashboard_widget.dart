import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/header_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/bar_chart_card.dart';
import 'package:aplikasi_kpri_desktop/widgets/dashboard/dashboard_details_card.dart';
import 'package:flutter/material.dart';

class DashBoardWidget extends StatelessWidget {
  const DashBoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: HeaderWidget(),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        DashboardDetailsCard(),
                        SizedBox(height: 20),
                        BarChartCard(),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        CustomCardWidget(
          padding: EdgeInsets.all(6),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Aplikasi Koperasi By Bacreative",
              style: TextStyle(
                color: GlobalColors.primary,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
