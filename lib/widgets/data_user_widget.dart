import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/admin_route_provider.dart';
import 'package:aplikasi_kpri_desktop/providers/user_provider.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataUserWidget extends ConsumerStatefulWidget {
  const DataUserWidget({super.key, required this.onEdit});

  final Function onEdit;

  @override
  ConsumerState<DataUserWidget> createState() => _DataUserWidgetState();
}

class _DataUserWidgetState extends ConsumerState<DataUserWidget> {
  int currentPage = 0;
  final int rowsPerPage = 5;
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';
  @override
  Widget build(BuildContext context) {
    final dataUsers = ref.watch(getAllUserProvider);
    return CustomCardWidget(
      color: GlobalColors.white,
      child: dataUsers.when(
        data: (user) {
          List<dynamic> users = user as List<dynamic>;

          if (searchQuery.isNotEmpty) {
            users = users.where((m) {
              final username = m['username'].toString().toLowerCase();
              return username.contains(searchQuery.toLowerCase());
            }).toList();
          }

          int startIndex = currentPage * rowsPerPage;
          int endIndex = (startIndex + rowsPerPage < users.length)
              ? startIndex + rowsPerPage
              : users.length;
          List<dynamic> paginatedUsers = users.sublist(startIndex, endIndex);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "User",
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
                    hintText: 'Cari User',
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
                  2: IntrinsicColumnWidth(),
                  3: FlexColumnWidth(),
                  4: IntrinsicColumnWidth(),
                  5: IntrinsicColumnWidth(),
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
                          "Username",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "Nama Lengkap",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(9),
                        child: const Text(
                          "Role",
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
                  for (int i = 0; i < paginatedUsers.length; i++)
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
                              paginatedUsers[i]['id'].toString(),
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
                            paginatedUsers[i]['username'].toString(),
                            style: const TextStyle(
                              color: GlobalColors.onBackground,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            paginatedUsers[i]['nama_lengkap'].toString(),
                            style: const TextStyle(
                              color: GlobalColors.onBackground,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            paginatedUsers[i]['role'].toString(),
                            style: const TextStyle(
                              color: GlobalColors.onBackground,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(2),
                                child: IconButton(
                                  onPressed: () async {
                                    ref
                                        .watch(idUserNotifierProvider.notifier)
                                        .setId(paginatedUsers[i]['id']);
                                    widget.onEdit();
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
                                            "Yakin hapus user?",
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
                                                _deleteUser(
                                                  paginatedUsers[i]['id']
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
                    'Halaman ${currentPage + 1} dari ${(users.length / rowsPerPage).ceil()}',
                  ),
                  ElevatedButton(
                    onPressed: (currentPage + 1) * rowsPerPage < users.length
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
        error: (error, stackTrace) =>
            const Text('Oops, something unexpected happened'),
        loading: () => const LinearProgressIndicator(),
      ),
    );
  }

  Future<void> _deleteUser(String id) async {
    try {
      final deleteMember = await ref.watch(
        deleteUserProvider(id).future,
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
        ref.invalidate(getAllUserProvider);
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
