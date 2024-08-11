import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/data/side_menu_data.dart';
import 'package:flutter/material.dart';

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({super.key, required this.onMenuItemSelected});

  final void Function(int index) onMenuItemSelected;

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();
    return Container(
      color: GlobalColors.white,
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
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data.menu.length,
              itemBuilder: (context, index) =>
                  buildMenuEntry(context, data, index),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuEntry(BuildContext context, SideMenuData data, int index) {
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
