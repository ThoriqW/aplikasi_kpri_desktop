import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/auth_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/admin_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/dashboard_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/member_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/setting_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/side_menu_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/simpanan_widget.dart';
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
        case 5:
          _currentView = const AdminWidget();
          break;
        case 6:
          _currentView = const SettingWidget();
          break;
        default:
          _currentView = const DashBoardWidget();
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
                      color: GlobalColors.background,
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
