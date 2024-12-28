import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/member_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/add_member_widget.dart';
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
            final namaLengkap = m['nama_lengkap'].toString().toLowerCase();
            return namaLengkap.contains(searchQuery.toLowerCase());
          }).toList();
        }

        int startIndex = currentPage * rowsPerPage;
        int endIndex = (startIndex + rowsPerPage < members.length)
            ? startIndex + rowsPerPage
            : members.length;
        List<dynamic> paginatedMembers = members.sublist(startIndex, endIndex);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Daftar Anggota",
              style: TextStyle(
                color: GlobalColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
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
                  hintText: 'Cari Nama Anggota',
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
                1: IntrinsicColumnWidth(),
                2: FlexColumnWidth(),
                3: IntrinsicColumnWidth(),
                4: IntrinsicColumnWidth(),
                5: IntrinsicColumnWidth(),
                6: IntrinsicColumnWidth(),
                7: IntrinsicColumnWidth(),
                8: IntrinsicColumnWidth(),
                9: IntrinsicColumnWidth(),
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
                        "ID",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(9),
                      child: const Text(
                        "Nama Anggota",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(9),
                      child: const Text(
                        "Nomor Anggota",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(9),
                      child: const Text(
                        "NIK",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(9),
                      child: const Text(
                        "Nomor HP",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(9),
                      child: const Text(
                        "Alamat",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(9),
                      child: const Text(
                        "Tanggal Lahir",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(9),
                      child: const Text(
                        "Unit Kerja",
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
                          "Aksi",
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
                            (startIndex + i + 1).toString(),
                            style: const TextStyle(
                              color: GlobalColors.onBackground,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
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
                          paginatedMembers[i]['nama_lengkap'].toString(),
                          style: const TextStyle(
                            color: GlobalColors.onBackground,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: Text(
                          paginatedMembers[i]['nomor_anggota'].toString(),
                          style: const TextStyle(
                            color: GlobalColors.onBackground,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: Text(
                          paginatedMembers[i]['nik'].toString(),
                          style: const TextStyle(
                            color: GlobalColors.onBackground,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: Text(
                          paginatedMembers[i]['phone'].toString(),
                          style: const TextStyle(
                            color: GlobalColors.onBackground,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: Text(
                          paginatedMembers[i]['alamat'].toString(),
                          style: const TextStyle(
                            color: GlobalColors.onBackground,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: Text(
                          paginatedMembers[i]['tanggal_lahir'].toString(),
                          style: const TextStyle(
                            color: GlobalColors.onBackground,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: Text(
                          paginatedMembers[i]['work_unit'].toString(),
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
                                onPressed: () async {
                                  await showDialog(
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
                                              _deleteMember(
                                                paginatedMembers[i]['id']
                                                    .toString(),
                                              );
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
                  child: const Text('Sebelumnya'),
                ),
                Text(
                  'Halaman ${currentPage + 1} dari ${(members.length / rowsPerPage).ceil()}',
                ),
                ElevatedButton(
                  onPressed: (currentPage + 1) * rowsPerPage < members.length
                      ? () {
                          setState(() {
                            currentPage++;
                          });
                        }
                      : null,
                  child: const Text('Selanjutnya'),
                ),
              ],
            ),
          ],
        );
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const LinearProgressIndicator(),
    );

    return CustomCardWidget(
      color: GlobalColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: goToAddMember || goToUpdateMember
                    ? const Icon(Icons.arrow_back)
                    : const Icon(Icons.add),
                onPressed: () {
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

  Future<void> _deleteMember(String id) async {
    try {
      final deleteMember = await ref.watch(
        deleteMemberProvider(id).future,
      );
      if (!mounted) return;
      Navigator.pop(context, 'OK');
      if (deleteMember is SuccessResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: deleteMember.message,
              alertTitle: "Sukses",
            );
          },
        );
        ref.invalidate(getAllMemberProvider);
      } else if (deleteMember is ErrorResponse) {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              alertDesc: deleteMember.errors,
              alertTitle: "Gagal",
            );
          },
        );
      }
    } catch (e) {
      if (!mounted) return;
      Navigator.pop(context, 'OK');
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDialog(
            alertDesc: e.toString().substring(11),
            alertTitle: "Gagal",
          );
        },
      );
    }
  }
}
