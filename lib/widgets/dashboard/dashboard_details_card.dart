import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/data/dashboard_card_data.dart';
import 'package:flutter/material.dart';

class DashboardDetailsCard extends StatelessWidget {
  const DashboardDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardCardData = DashboardCardData();

    return GridView.builder(
      itemCount: 2,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 15, childAspectRatio: 18),
      itemBuilder: (context, index) => Container(
        height: 80,
        padding: EdgeInsets.zero,
        child: Container(
          width: double.infinity,
          color: index == 0
              ? GlobalColors.secondary
              : const Color.fromARGB(255, 250, 195, 195),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 8.0,
            ),
            child: Row(
              children: [
                Text(
                  dashboardCardData.dashboardData[index].title,
                ),
                const SizedBox(width: 12),
                const Text(
                  "0",
                  style: TextStyle(
                    color: GlobalColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
