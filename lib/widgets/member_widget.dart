import 'package:aplikasi_kpri_desktop/widgets/data_member_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class MemberWidget extends StatelessWidget {
  const MemberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 78),
              DataMemberWidget(),
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
