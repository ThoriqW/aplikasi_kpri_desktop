import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/user_provider.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataUserWidget extends ConsumerStatefulWidget {
  const DataUserWidget({super.key});

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
              final fullName = m['username'].toString().toLowerCase();
              return fullName.contains(searchQuery.toLowerCase());
            }).toList();
          }

          int startIndex = currentPage * rowsPerPage;
          int endIndex = (startIndex + rowsPerPage < users.length)
              ? startIndex + rowsPerPage
              : users.length;
          List<dynamic> paginatedMembers = users.sublist(startIndex, endIndex);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Data User",
                style: TextStyle(
                  color: GlobalColors.primary,
                  fontWeight: FontWeight.bold,
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
                  1: FlexColumnWidth(),
                  2: IntrinsicColumnWidth(),
                  3: IntrinsicColumnWidth(),
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
                            paginatedMembers[i]['username'].toString(),
                            style: const TextStyle(
                              color: GlobalColors.onBackground,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            paginatedMembers[i]['role'].toString(),
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
                                    setState(() {});
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
                                                try {
                                                  await ref.watch(
                                                    deleteUserProvider(
                                                      (startIndex + i + 1)
                                                          .toString(),
                                                    ).future,
                                                  );
                                                  if (!mounted) return;
                                                  // ignore: use_build_context_synchronously
                                                  Navigator.pop(context, 'OK');
                                                  ref.invalidate(
                                                      getAllUserProvider);
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
                    'Page ${currentPage + 1} of ${(users.length / rowsPerPage).ceil()}',
                  ),
                  ElevatedButton(
                    onPressed: (currentPage + 1) * rowsPerPage < users.length
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
        error: (error, stackTrace) =>
            const Text('Oops, something unexpected happened'),
        loading: () => const LinearProgressIndicator(),
      ),
    );
  }
}
