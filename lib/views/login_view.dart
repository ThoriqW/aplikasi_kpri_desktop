import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/auth_provider.dart';
import 'package:aplikasi_kpri_desktop/views/main_view.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final authNotifier = ref.watch(authNotifierProvider.notifier);
      await authNotifier.login(
        _usernameController.text,
        _passwordController.text,
      );
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const MainView(),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertDialog(
            alertTitle: "Gagal",
            alertDesc: e.toString(),
          );
        },
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(color: GlobalColors.secondary),
                child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: Center(
                    child: Text(
                      "Aplikasi Koperasi Simpan Pinjam",
                      style: TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                        color: GlobalColors.primary,
                        fontFamily: GoogleFonts.libreBaskerville().fontFamily,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(50),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerLowest,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Silahkan Masuk",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(
                          color: GlobalColors.primary,
                          thickness: 2,
                          endIndent: 500,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Username",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 500,
                          child: TextFormWidget(
                            controller: _usernameController,
                            text: "",
                            icons: Icons.person,
                            isIconActive: true,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 500,
                          child: TextFormWidget(
                            controller: _passwordController,
                            text: "",
                            isPassword: true,
                            icons: Icons.lock,
                            isIconActive: true,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: GlobalColors.primary,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: InkWell(
                              onTap: () {
                                _login();
                              },
                              child: SizedBox(
                                width: 150,
                                height: 45,
                                child: Center(
                                  child: _isLoading
                                      ? const SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            color: GlobalColors.white,
                                          ),
                                        )
                                      : const Text(
                                          "Masuk",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: GlobalColors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
