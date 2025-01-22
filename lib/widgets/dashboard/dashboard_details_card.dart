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
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 15, childAspectRatio: 10),
      itemBuilder: (context, index) => Container(
        height: 80,
        padding: EdgeInsets.zero,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Row(
              children: [
                Text(
                  dashboardCardData.dashboardData[index].title,
                  style: const TextStyle(
                    color: GlobalColors.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  "0",
                  style: TextStyle(
                    fontSize: 16,
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
