import 'dart:convert';

import 'package:aplikasi_kpri_desktop/models/auth_model.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
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
      await storage.write(key: 'roleId', value: authResponse.role);
      state = AsyncData(authResponse);
    } else {
      throw ErrorResponse.fromJson(jsonDecode(response.body)).errors;
    }
  }

  Future<void> logout() async {
    try {
      await storage.delete(key: "auth");
      await storage.delete(key: "roleId");
    } catch (e) {
      throw Exception('Terjadi Kesalahan');
    }
  }
}
