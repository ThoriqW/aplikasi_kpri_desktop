import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/data/dashboard_card_data.dart';
import 'package:flutter/material.dart';

class DashboardDetailsCard extends StatelessWidget {
  const DashboardDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardCardData = DashboardCardData();

    return GridView.builder(
      itemCount: dashboardCardData.dashboardData.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, crossAxisSpacing: 15, childAspectRatio: 2),
      itemBuilder: (context, index) => Container(
        height: 80,
        padding: EdgeInsets.zero,
        child: Container(
          color: GlobalColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                color: GlobalColors.header,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  ),
                  child: Text(
                    dashboardCardData.dashboardData[index].title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        dashboardCardData.dashboardData[index].value,
                        style: const TextStyle(
                            color: GlobalColors.primary,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
