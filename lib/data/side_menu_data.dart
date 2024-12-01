import 'package:aplikasi_kpri_desktop/models/menu_model.dart';
import 'package:flutter/material.dart';

class SideMenuDataAdmin {
  final menu = const <MenuModel>[
    MenuModel(icon: Icons.home, title: "Beranda"),
    MenuModel(icon: Icons.people, title: "Anggota"),
    MenuModel(icon: Icons.people, title: "Simpanan"),
    MenuModel(icon: Icons.payment, title: "Tagihan"),
    MenuModel(icon: Icons.description, title: "Laporan"),
    MenuModel(icon: Icons.admin_panel_settings, title: "Admin"),
    MenuModel(icon: Icons.settings, title: "Pengaturan"),
  ];
}

class SideMenuDataStaff {
  final menu = const <MenuModel>[
    MenuModel(icon: Icons.home, title: "Beranda"),
    MenuModel(icon: Icons.people, title: "Anggota"),
    MenuModel(icon: Icons.people, title: "Simpanan"),
    MenuModel(icon: Icons.payment, title: "Tagihan"),
    MenuModel(icon: Icons.description, title: "Laporan"),
    MenuModel(icon: Icons.settings, title: "Pengaturan"),
  ];
}
