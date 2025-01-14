import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/providers/auth_provider.dart';
import 'package:aplikasi_kpri_desktop/views/main_view.dart';
import 'package:aplikasi_kpri_desktop/widgets/custom_alert_dialog.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

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
      body: Container(
        color: GlobalColors.white,
        padding: const EdgeInsets.all(60),
        child: Center(
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  "Aplikasi Koperasi Simpan Pinjam",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormWidget(
                        controller: _usernameController,
                        text: "Username",
                      ),
                      const SizedBox(height: 20),
                      TextFormWidget(
                        controller: _passwordController,
                        text: "Password",
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Material(
                          color: GlobalColors.primary,
                          elevation: 4.0,
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
                                          color: Colors.white,
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
            ],
          ),
        ),
      ),
    );
  }
}
