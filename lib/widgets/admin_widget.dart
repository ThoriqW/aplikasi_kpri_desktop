import 'package:aplikasi_kpri_desktop/widgets/add_user_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/add_work_unit_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/data_user_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/header_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/data_work_units_widget.dart';
import 'package:flutter/material.dart';

class AdminWidget extends StatelessWidget {
  const AdminWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 78),
              AddUserWidget(),
              SizedBox(height: 15),
              DataUserWidget(),
              SizedBox(height: 15),
              AddWorkUnitWidget(),
              SizedBox(height: 15),
              DataWorkUnitsWidget(),
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
