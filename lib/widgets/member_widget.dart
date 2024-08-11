import 'package:aplikasi_kpri_desktop/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class MemberWidget extends StatelessWidget {
  const MemberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: const Column(
          children: [
            SizedBox(height: 20),
            HeaderWidget(),
          ],
        ),
      ),
    );
  }
}
