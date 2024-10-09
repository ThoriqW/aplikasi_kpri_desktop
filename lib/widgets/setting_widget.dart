import 'package:aplikasi_kpri_desktop/widgets/profile_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/update_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_kpri_desktop/widgets/header_widget.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 75),
              UpdateUserWidget(),
              SizedBox(height: 15),
              ProfileWidget(),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: HeaderWidget(),
        ),
      ],
    );
  }
}
