import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/data/side_menu_data.dart';
import 'package:aplikasi_kpri_desktop/providers/auth_provider.dart';
import 'package:aplikasi_kpri_desktop/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

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
          color: Theme.of(context).colorScheme.surfaceContainer,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/koperasi_indonesia.png",
                      width: 70,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "SIMPANA",
                      style: TextStyle(
                        fontFamily: GoogleFonts.libreBaskerville().fontFamily,
                        color: GlobalColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Theme.of(context).colorScheme.surfaceContainerLowest,
                thickness: 2,
                indent: 30,
                endIndent: 30,
              ),
              const SizedBox(height: 20),
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
              Divider(
                color: Theme.of(context).colorScheme.surfaceContainerLowest,
                thickness: 2,
                indent: 30,
                endIndent: 30,
              ),
              Container(
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    overlayColor: Colors.transparent,
                  ),
                  icon: Icon(
                    color: Theme.of(context).colorScheme.onErrorContainer,
                    Icons.logout,
                    size: 25.0,
                  ),
                  label: Text(
                    "Log Out",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onErrorContainer,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
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
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : Colors.transparent,
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
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            Expanded(
              child: Text(
                data.menu[index].title,
                style: TextStyle(
                  color: isSelected
                      ? GlobalColors.white
                      : Theme.of(context).colorScheme.onSurface,
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w700,
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
        color: isSelected ? Colors.red : Colors.transparent,
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
                    : Theme.of(context).colorScheme.primary,
              ),
            ),
            Expanded(
              child: Text(
                data.menu[index].title,
                style: TextStyle(
                  color: isSelected
                      ? GlobalColors.primary
                      : GlobalColors.secondary,
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
