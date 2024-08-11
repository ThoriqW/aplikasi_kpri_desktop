import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarData {
  final barGroups = [
    BarChartGroupData(
      x: 0,
      barRods: [
        BarChartRodData(
          toY: 13.00,
          color: GlobalColors.primary,
          width: 50,
          borderRadius: BorderRadius.zero,
        )
      ],
    ),
    BarChartGroupData(
      x: 20,
      barRods: [
        BarChartRodData(
          toY: 23.00,
          color: GlobalColors.primary,
          width: 50,
          borderRadius: BorderRadius.zero,
        )
      ],
    ),
    BarChartGroupData(
      x: 30,
      barRods: [
        BarChartRodData(
          toY: 33.00,
          color: GlobalColors.primary,
          width: 50,
          borderRadius: BorderRadius.zero,
        )
      ],
    ),
    BarChartGroupData(
      x: 40,
      barRods: [
        BarChartRodData(
          toY: 43.00,
          color: GlobalColors.primary,
          width: 50,
          borderRadius: BorderRadius.zero,
        )
      ],
    ),
    BarChartGroupData(
      x: 50,
      barRods: [
        BarChartRodData(
          toY: 63.00,
          color: GlobalColors.primary,
          width: 50,
          borderRadius: BorderRadius.zero,
        )
      ],
    ),
    BarChartGroupData(
      x: 60,
      barRods: [
        BarChartRodData(
          toY: 33.00,
          color: GlobalColors.primary,
          width: 50,
          borderRadius: BorderRadius.zero,
        )
      ],
    ),
    BarChartGroupData(
      x: 70,
      barRods: [
        BarChartRodData(
          toY: 73.00,
          color: GlobalColors.primary,
          width: 50,
          borderRadius: BorderRadius.zero,
        )
      ],
    ),
    BarChartGroupData(
      x: 80,
      barRods: [
        BarChartRodData(
          toY: 83.00,
          color: GlobalColors.primary,
          width: 50,
          borderRadius: BorderRadius.zero,
        )
      ],
    ),
    BarChartGroupData(
      x: 90,
      barRods: [
        BarChartRodData(
          toY: 93.00,
          color: GlobalColors.primary,
          width: 50,
          borderRadius: BorderRadius.zero,
        )
      ],
    ),
    BarChartGroupData(
      x: 100,
      barRods: [
        BarChartRodData(
          toY: 63.00,
          color: GlobalColors.primary,
          width: 50,
          borderRadius: BorderRadius.zero,
        )
      ],
    ),
    BarChartGroupData(
      x: 110,
      barRods: [
        BarChartRodData(
          toY: 83.00,
          color: GlobalColors.primary,
          width: 50,
          borderRadius: BorderRadius.zero,
        )
      ],
    ),
  ];

  final leftTitle = {
    0: '0',
    20: '20JT',
    40: '40JT',
    60: '60JT',
    80: '80JT',
    100: '100JT',
  };

  final bottomTitle = {
    0: 'Jan',
    10: 'Feb',
    20: 'Mar',
    30: 'Apr',
    40: 'Mei',
    50: 'Jun',
    60: 'Jul',
    70: 'Ags',
    80: 'Sep',
    90: 'Okt',
    100: 'Nov',
    110: 'Des',
  };
}
