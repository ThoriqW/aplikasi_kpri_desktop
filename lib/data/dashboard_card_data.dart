import 'package:aplikasi_kpri_desktop/models/dashboard_card_model.dart';
import 'package:intl/intl.dart';

final currencyFormatter = NumberFormat.currency(
  locale: 'id_ID',
  symbol: 'Rp',
  decimalDigits: 0,
);

class DashboardCardData {
  final dashboardData = <DashboardCardModel>[
    const DashboardCardModel(
      title: "ANGGOTA AKTIF",
    ),
    const DashboardCardModel(
      title: "ANGGOTA TIDAK AKTIF",
    ),
  ];
}
