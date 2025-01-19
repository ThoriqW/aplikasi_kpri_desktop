import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/member_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DropdownMemberWidget extends ConsumerStatefulWidget {
  const DropdownMemberWidget({
    super.key,
    this.currentDropDownName,
    required this.onSelected,
    this.resetKey,
  });

  final String? currentDropDownName;
  final Function(String) onSelected;
  final Key? resetKey;

  @override
  ConsumerState<DropdownMemberWidget> createState() =>
      _DropdownMemberWidgetState();
}

class _DropdownMemberWidgetState extends ConsumerState<DropdownMemberWidget> {
  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.currentDropDownName;
  }

  @override
  void didUpdateWidget(covariant DropdownMemberWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.resetKey != oldWidget.resetKey) {
      setState(() {
        dropdownValue = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final getMemberDropdown = ref.watch(getDropDownMemberProvider);
    return getMemberDropdown.when(
      data: (data) {
        if (data == null) {
          return const Text("Data tidak valid");
        }
        if (data is ErrorResponse || data is! Map<String, dynamic>) {
          return SizedBox(width: double.infinity, child: Text(data.toString()));
        }
        final List<dynamic> memberDropDown = data['data'];

        return Expanded(
          child: DropdownSearch<String>(
            selectedItem: dropdownValue,
            items: (filter, infiniteScrollProps) => memberDropDown
                .map<String>(
                    (entry) => '${entry['id']}   ${entry['nama_lengkap']}')
                .toList(),
            decoratorProps: DropDownDecoratorProps(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(0)),
                  borderSide:
                      BorderSide(color: Colors.grey.shade300, width: 1.0),
                ),
              ),
            ),
            popupProps: const PopupProps.menu(
              fit: FlexFit.loose,
              constraints: BoxConstraints(
                maxHeight: 300,
              ),
              showSearchBox: true,
            ),
            onChanged: (String? value) {
              if (value != null) {
                final idAndName = value.split(RegExp(r'\s+'));
                final selectedId = idAndName.isNotEmpty ? idAndName[0] : null;

                setState(() {
                  dropdownValue = value;
                });
                widget.onSelected(selectedId!);
              }
            },
          ),
        );
      },
      loading: () => const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          color: GlobalColors.primary,
        ),
      ),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}
