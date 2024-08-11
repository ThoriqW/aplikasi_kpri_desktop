import 'dart:convert';

import 'package:aplikasi_kpri_desktop/models/auth_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:aplikasi_kpri_desktop/api/api_connections.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import "package:http/http.dart" as http;

part 'auth_provider.g.dart';

const storage = FlutterSecureStorage();

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  FutureOr<Authentication?> build() => null;

  final String baseUrl = API.baseUrl;

  Future<void> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/v1/users/login'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({'username': username, 'password': password}),
    );
    if (response.statusCode == 200) {
      final authResponse = Authentication.fromJson(jsonDecode(response.body));
      await storage.write(key: 'authToken', value: authResponse.accessToken);
      state = AsyncData(authResponse);
    } else {
      throw Exception('Username atau password salah');
    }
  }
}
