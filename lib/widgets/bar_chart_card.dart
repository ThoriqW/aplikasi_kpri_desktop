import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/data/bar_chart_data.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartCard extends StatelessWidget {
  const BarChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    final data = BarData();

    return CustomCardWidget(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.surfaceDim,
        width: 1,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "SIMPANAN KOPERASI",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            AspectRatio(
              aspectRatio: 16 / 6,
              child: BarChart(
                BarChartData(
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          rod.toY.toString(),
                          const TextStyle(
                            color: GlobalColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                    handleBuiltInTouches: true,
                  ),
                  gridData: const FlGridData(show: true),
                  titlesData: FlTitlesData(
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return data.bottomTitle[value.toInt()] != null
                              ? SideTitleWidget(
                                  axisSide: meta.axisSide,
                                  child: Text(
                                    data.bottomTitle[value.toInt()].toString(),
                                  ),
                                )
                              : const SizedBox();
                        },
                        interval: 10,
                        reservedSize: 40,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return data.leftTitle[value.toInt()] != null
                              ? SideTitleWidget(
                                  axisSide: meta.axisSide,
                                  child: Text(
                                    data.leftTitle[value.toInt()].toString(),
                                  ),
                                )
                              : const SizedBox();
                        },
                        interval: 20,
                        reservedSize: 50,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: data.barGroups,
                  maxY: 105,
                  minY: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
