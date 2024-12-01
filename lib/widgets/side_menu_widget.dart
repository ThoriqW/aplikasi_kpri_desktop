import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/data/side_menu_data.dart';
import 'package:aplikasi_kpri_desktop/providers/auth_provider.dart';
import 'package:aplikasi_kpri_desktop/views/login_view.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SideMenuWidget extends ConsumerStatefulWidget {
  const SideMenuWidget({super.key, required this.onMenuItemSelected});

  final void Function(int index) onMenuItemSelected;

  @override
  ConsumerState<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends ConsumerState<SideMenuWidget> {
  int selectedIndex = 0;
  late String roleId;

  @override
  Widget build(BuildContext context) {
    final dataAdmin = SideMenuDataAdmin();
    final dataStaff = SideMenuDataStaff();

    return FutureBuilder<String?>(
      future: storage.read(key: 'roleId'),
      builder: (context, snapshot) {
        final roleId = snapshot.data;
        return Container(
          decoration: const BoxDecoration(
            color: GlobalColors.white,
            border: Border(
              right: BorderSide(color: GlobalColors.secondary, width: 3),
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 30,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/koperasi_indonesia.png",
                      width: 50,
                    ),
                    Expanded(
                      child: Text(
                        "APLIKASI KOPERASI",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (roleId == 'admin')
                Expanded(
                  child: ListView.builder(
                    itemCount: dataAdmin.menu.length,
                    itemBuilder: (context, index) =>
                        buildMenuAdminEntry(context, dataAdmin, index),
                  ),
                )
              else if (roleId == 'staff')
                Expanded(
                  child: ListView.builder(
                    itemCount: dataStaff.menu.length,
                    itemBuilder: (context, index) =>
                        buildMenuStaffEntry(context, dataStaff, index),
                  ),
                ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 30,
                ),
                child: ButtonWidget(
                  text: "Keluar",
                  onTap: () async {
                    final authNotifier =
                        ref.watch(authNotifierProvider.notifier);
                    await authNotifier.logout();

                    if (!context.mounted) return;

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const LoginView(),
                      ),
                    );
                  },
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildMenuAdminEntry(
      BuildContext context, SideMenuDataAdmin data, int index) {
    final isSelected = selectedIndex == index;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: isSelected ? GlobalColors.secondary : Colors.transparent,
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
          widget.onMenuItemSelected(index);
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 13,
                vertical: 10,
              ),
              child: Icon(
                data.menu[index].icon,
                color: isSelected
                    ? GlobalColors.primary
                    : GlobalColors.onBackground,
              ),
            ),
            Expanded(
              child: Text(
                data.menu[index].title,
                style: TextStyle(
                  color: isSelected
                      ? GlobalColors.primary
                      : GlobalColors.onBackground,
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildMenuStaffEntry(
      BuildContext context, SideMenuDataStaff data, int index) {
    final isSelected = selectedIndex == index;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: isSelected ? GlobalColors.secondary : Colors.transparent,
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
          widget.onMenuItemSelected(index);
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 13,
                vertical: 10,
              ),
              child: Icon(
                data.menu[index].icon,
                color: isSelected
                    ? GlobalColors.primary
                    : GlobalColors.onBackground,
              ),
            ),
            Expanded(
              child: Text(
                data.menu[index].title,
                style: TextStyle(
                  color: isSelected
                      ? GlobalColors.primary
                      : GlobalColors.onBackground,
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
