import 'package:aplikasi_kpri_desktop/providers/auth_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/admin/admin_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/dashboard/dashboard_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/member/member_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/setting/setting_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/side_menu_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/saving/simpanan_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/tagihan/tagihan_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/under_maintanance.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  Widget _currentView = const DashBoardWidget();

  void _onMenuItemSelectedAdmin(int index) {
    setState(() {
      switch (index) {
        case 0:
          _currentView = const DashBoardWidget();
          break;
        case 1:
          _currentView = const MemberWidget();
          break;
        case 2:
          _currentView = const SimpananWidget();
          break;
        case 3:
          _currentView = const TagihanWidget();
          break;
        case 5:
          _currentView = const AdminWidget();
          break;
        case 6:
          _currentView = const SettingWidget();
          break;
        default:
          _currentView = const UnderMaintanance();
          break;
      }
    });
  }

  void _onMenuItemSelectedStaff(int index) {
    setState(() {
      switch (index) {
        case 0:
          _currentView = const DashBoardWidget();
          break;
        case 1:
          _currentView = const MemberWidget();
          break;
        case 2:
          _currentView = const SimpananWidget();
          break;
        case 5:
          _currentView = const SettingWidget();
          break;
        default:
          _currentView = const DashBoardWidget();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: storage.read(key: 'roleId'),
      builder: (context, snapshot) {
        final roleId = snapshot.data;
        return Scaffold(
          body: SafeArea(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    child: SideMenuWidget(
                      onMenuItemSelected: roleId == 'admin'
                          ? _onMenuItemSelectedAdmin
                          : _onMenuItemSelectedStaff,
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: SizedBox.expand(
                    child: Container(
                      color:
                          Theme.of(context).colorScheme.surfaceContainerLowest,
                      child: _currentView,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
