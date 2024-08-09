import 'package:aplikasi_kpri_desktop/models/dashboard_card_model.dart';
import 'package:intl/intl.dart';

final currencyFormatter = NumberFormat.currency(
  locale: 'id_ID', // Locale for Indonesian
  symbol: 'Rp', // Currency symbol for Rupiah
  decimalDigits:
      0, // Number of decimal places, set to 0 for whole Rupiah values
);

class DashboardCardData {
  final dashboardData = <DashboardCardModel>[
    DashboardCardModel(
      value: "547",
      title: "ANGGOTA AKTIF",
    ),
    DashboardCardModel(
      value: "34",
      title: "ANGGOTA TIDAK AKTIF",
    ),
    DashboardCardModel(
      value: currencyFormatter.format(70000000),
      title: "TOTAL SIMPANAN",
    ),
    DashboardCardModel(
      value: currencyFormatter.format(500000),
      title: "JUMLAH TUNGGAKAN",
    ),
  ];
}
