import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({
    super.key,
    required this.items,
    required this.onSelected,
    this.currentDropDownName,
    this.resetKey,
  });

  final Function(String) onSelected;
  final String? currentDropDownName;
  final List<String> items;
  final Key? resetKey;

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.currentDropDownName;
  }

  @override
  void didUpdateWidget(covariant DropdownWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.resetKey != oldWidget.resetKey) {
      setState(() {
        selectedValue = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      underline: Container(
        height: 2,
        color: GlobalColors.onBackground,
      ),
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue;
        });
        widget.onSelected(selectedValue!);
      },
      items: widget.items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(value),
          ),
        );
      }).toList(),
    );
  }
}
