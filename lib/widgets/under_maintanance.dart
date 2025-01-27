import 'package:flutter/material.dart';

class UnderMaintanance extends StatelessWidget {
  const UnderMaintanance({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 75.0, bottom: 30.0),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [Text("Halaman dalam tahap pengembangan")],
        ),
      ),
    );
  }
}
