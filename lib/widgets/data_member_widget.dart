import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/member_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/add_member_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/button_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:aplikasi_kpri_desktop/widgets/update_member_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataMemberWidget extends ConsumerStatefulWidget {
  const DataMemberWidget({super.key});

  @override
  ConsumerState<DataMemberWidget> createState() => _DataMemberWidgetState();
}

class _DataMemberWidgetState extends ConsumerState<DataMemberWidget> {
  bool goToAddMember = false;
  bool goToUpdateMember = false;
  int currentPage = 0;
  final int rowsPerPage = 10;
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  late Widget contentUpdateMember;

  @override
  Widget build(BuildContext context) {
    final getAllMember = ref.watch(getAllMemberProvider);
    Widget content = getAllMember.when(
      data: (member) {
        List<dynamic> members = member as List<dynamic>;

        if (searchQuery.isNotEmpty) {
          members = members.where((m) {
            final fullName = m['fullName'].toString().toLowerCase();
            return fullName.contains(searchQuery.toLowerCase());
          }).toList();
        }

        int startIndex = currentPage * rowsPerPage;
        int endIndex = (startIndex + rowsPerPage < members.length)
            ? startIndex + rowsPerPage
            : members.length;
        List<dynamic> paginatedMembers = members.sublist(startIndex, endIndex);

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                    currentPage = 0;
                  });
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: 'Cari Member',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: GlobalColors.background,
                ),
              ),
            ),
            Table(
              border: TableBorder.all(color: GlobalColors.header),
              columnWidths: const <int, TableColumnWidth>{
                0: IntrinsicColumnWidth(),
                1: FlexColumnWidth(),
                2: IntrinsicColumnWidth(),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                TableRow(
                  decoration: const BoxDecoration(),
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(9),
                      child: const Text(
                        "No",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(9),
                      child: const Text(
                        "Nama Member",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "Action",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                for (int i = 0; i < paginatedMembers.length; i++)
                  TableRow(
                    decoration: const BoxDecoration(),
                    children: <Widget>[
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            paginatedMembers[i]['id'].toString(),
                            style: const TextStyle(
                              color: GlobalColors.onBackground,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: Text(
                          paginatedMembers[i]['fullName'].toString(),
                          style: const TextStyle(
                            color: GlobalColors.onBackground,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Center(
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(2),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    goToUpdateMember = true;
                                    contentUpdateMember = UpdateMemberWidget(
                                      id: paginatedMembers[i]['id'].toString(),
                                      onComplete: () {
                                        setState(() {
                                          goToUpdateMember = false;
                                        });
                                        ref.invalidate(getAllMemberProvider);
                                      },
                                    );
                                  });
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  size: 18,
                                  color: GlobalColors.primary,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(2),
                              child: IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Info"),
                                        content: const Text(
                                          "Yakin hapus member?",
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                              context,
                                              'Cancel',
                                            ),
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              try {
                                                await ref.watch(
                                                  deleteMemberProvider(
                                                    (startIndex + i + 1)
                                                        .toString(),
                                                  ).future,
                                                );
                                                if (!mounted) return;
                                                // ignore: use_build_context_synchronously
                                                Navigator.pop(context, 'OK');
                                                ref.invalidate(
                                                    getAllMemberProvider);
                                              } catch (e) {
                                                if (!mounted) return;
                                                showDialog(
                                                  // ignore: use_build_context_synchronously
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return CustomAlertDialog(
                                                      alertDesc: e
                                                          .toString()
                                                          .substring(11),
                                                      alertTitle: "Error",
                                                    );
                                                  },
                                                );
                                              }
                                            },
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  size: 18,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: currentPage > 0
                      ? () {
                          setState(() {
                            currentPage--;
                          });
                        }
                      : null,
                  child: const Text('Previous'),
                ),
                Text(
                  'Page ${currentPage + 1} of ${(members.length / rowsPerPage).ceil()}',
                ),
                ElevatedButton(
                  onPressed: (currentPage + 1) * rowsPerPage < members.length
                      ? () {
                          setState(() {
                            currentPage++;
                          });
                        }
                      : null,
                  child: const Text('Next'),
                ),
              ],
            ),
          ],
        );
      },
      error: (error, stackTrace) => const Text('Gagal terhubung ke api'),
      loading: () => const LinearProgressIndicator(),
    );

    return CustomCardWidget(
      color: GlobalColors.white,
      child: Column(
        children: [
          Row(
            children: [
              ButtonWidget(
                text: goToAddMember || goToUpdateMember
                    ? "Kembali"
                    : "Tambah Anggota",
                onTap: () {
                  setState(
                    () {
                      if (goToAddMember || goToUpdateMember) {
                        goToAddMember = false;
                        goToUpdateMember = false;
                      } else {
                        goToAddMember = true;
                      }
                    },
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          goToAddMember
              ? AddMemberWidget(
                  onComplete: () {
                    setState(() {
                      goToAddMember = false;
                    });
                    ref.invalidate(getAllMemberProvider);
                  },
                )
              : goToUpdateMember
                  ? contentUpdateMember
                  : content,
        ],
      ),
    );
  }
}
