import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/member_provider.dart';
import 'package:aplikasi_kpri_desktop/providers/member_route_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TableMemberWidget extends ConsumerStatefulWidget {
  const TableMemberWidget({
    super.key,
    required this.selectedUnit,
    required this.searchQuery,
    required this.status,
    required this.currentPage,
  });

  final String selectedUnit;
  final String searchQuery;
  final String status;
  final int currentPage;

  @override
  ConsumerState<TableMemberWidget> createState() => _TableMemberWidgetState();
}

class _TableMemberWidgetState extends ConsumerState<TableMemberWidget> {
  @override
  Widget build(BuildContext context) {
    final getAllMember = ref.watch(getAllMemberProvider(
      widget.searchQuery,
      widget.selectedUnit,
      widget.status,
    ));
    return getAllMember.when(
      data: (member) {
        if (member == null ||
            member is! Map<String, dynamic> ||
            !member.containsKey('data')) {
          return const Text("Data tidak valid");
        }
        final List<dynamic> savingsResponse = member['data'];
        if (savingsResponse.isEmpty) {
          return Text(member['message']);
        }
        List<dynamic> members = savingsResponse;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Table(
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
                10: IntrinsicColumnWidth(),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                TableRow(
                  decoration:
                      const BoxDecoration(color: GlobalColors.secondary),
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(9),
                      child: const Text("No"),
                    ),
                    Container(
                      padding: const EdgeInsets.all(9),
                      child: const Text("ID"),
                    ),
                    Container(
                      padding: const EdgeInsets.all(9),
                      child: const Text("Nama Anggota"),
                    ),
                    Container(
                      padding: const EdgeInsets.all(9),
                      child: const Text("Nomor Anggota"),
                    ),
                    Container(
                      padding: const EdgeInsets.all(9),
                      child: const Text("NIK"),
                    ),
                    Container(
                      padding: const EdgeInsets.all(9),
                      child: const Text("Nomor HP"),
                    ),
                    Container(
                      padding: const EdgeInsets.all(9),
                      child: const Text("Alamat"),
                    ),
                    Container(
                      padding: const EdgeInsets.all(9),
                      child: const Text("Tanggal Lahir"),
                    ),
                    Container(
                      padding: const EdgeInsets.all(9),
                      child: const Text("Unit Kerja"),
                    ),
                    Container(
                      padding: const EdgeInsets.all(9),
                      child: const Text("Status"),
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text("Aksi"),
                      ),
                    ),
                  ],
                ),
                for (int i = 0; i < members.length; i++)
                  TableRow(
                    decoration: BoxDecoration(
                      color: i.isEven ? Colors.grey.shade200 : Colors.white,
                    ),
                    children: <Widget>[
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            (0 + i + 1).toString(),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            members[i]['id'].toString(),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: Text(
                          members[i]['nama_lengkap'].toString(),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: Text(
                          members[i]['nomor_anggota'].toString(),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: Text(
                          members[i]['nik'].toString(),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: Text(
                          members[i]['phone'].toString(),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: Text(
                          members[i]['alamat'].toString(),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: Text(
                          members[i]['tanggal_lahir'].toString(),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: Text(
                          members[i]['work_unit'].toString(),
                        ),
                      ),
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: members[i]['status'].toString() == '1'
                            ? GlobalColors.secondary
                            : const Color.fromARGB(255, 250, 201, 201),
                        child: Icon(
                          members[i]['status'].toString() == '1'
                              ? Icons.check_circle
                              : Icons.cancel,
                          color: members[i]['status'].toString() == '1'
                              ? GlobalColors.primary
                              : Colors.redAccent,
                        ),
                      ),
                      Center(
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(2),
                              child: IconButton(
                                onPressed: () {
                                  ref
                                      .watch(idMemberNotifierProvider.notifier)
                                      .setId(members[i]['id']);
                                  ref
                                      .watch(
                                        memberModeNotifierProvider.notifier,
                                      )
                                      .switchToUpdateUser();
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
                                                  members[i]['id'].toString());
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Text('Sebelumnya'),
                ),
                const Text(
                  'Halaman dari',
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Text('Selanjutnya'),
                ),
              ],
            ),
          ],
        );
      },
      error: (error, stackTrace) =>
          const Text('Oops, something unexpected happened'),
      loading: () => const LinearProgressIndicator(),
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
