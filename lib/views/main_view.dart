import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/widgets/dashboard_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/side_menu_widget.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            const Expanded(
              flex: 2,
              child: SizedBox(
                child: SideMenuWidget(),
              ),
            ),
            Expanded(
              flex: 10,
              child: SizedBox.expand(
                child: Container(
                  color: GlobalColors.background,
                  child: const DashBoardWidget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
