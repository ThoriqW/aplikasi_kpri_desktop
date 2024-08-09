import 'package:aplikasi_kpri_desktop/const/global_colors.dart';
import 'package:aplikasi_kpri_desktop/views/main_view.dart';
import 'package:aplikasi_kpri_desktop/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(60),
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
                      width: 2,
                      color: GlobalColors.background,
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
                          borderRadius: BorderRadius.circular(8.0),
                          elevation: 4.0,
                          child: InkWell(
                            onTap: () => {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => const MainView()),
                                ),
                              ),
                            },
                            borderRadius: BorderRadius.circular(8.0),
                            child: const SizedBox(
                              width: 150,
                              height: 45,
                              child: Center(
                                child: Text(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
