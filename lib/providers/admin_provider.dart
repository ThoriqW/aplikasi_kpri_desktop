import 'dart:convert';

import 'package:aplikasi_kpri_desktop/api/api_connections.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'admin_provider.g.dart';

const baseUrl = API.baseUrl;

const storage = FlutterSecureStorage();

//ROUTE
enum AdminMode { view, editUser, editWorkUnit, addUser, addWorkUnit }

@riverpod
class AdminModeNotifier extends _$AdminModeNotifier {
  @override
  AdminMode build() => AdminMode.view;

  void switchToView() => state = AdminMode.view;
  void switchToEditUser() => state = AdminMode.editUser;
  void switchToAddUser() => state = AdminMode.addUser;
  void switchToAddWorkUnit() => state = AdminMode.addWorkUnit;
  void switchToEditWorkUnit() => state = AdminMode.editWorkUnit;
}

@riverpod
class IdUserNotifier extends _$IdUserNotifier {
  @override
  int build() => 0;

  void setId(int id) {
    state = id;
  }

  int getId() {
    return state;
  }
}

@riverpod
class IdWorkUnitNotifier extends _$IdWorkUnitNotifier {
  @override
  int build() => 0;

  void setId(int id) {
    state = id;
  }

  int getId() {
    return state;
  }
}

@riverpod
Future getRoleUser(ref) async {
  final String? roleId = await storage.read(key: 'roleId');

  return roleId;
}

@riverpod
Future getApiDashboard(ref) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }
  try {
    final response = await http.get(
      Uri.parse('$baseUrl/api/v1/dashboard'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse['data'];
    } else {
      return ErrorResponse.fromJson(jsonDecode(response.body)).errors;
    }
  } catch (e) {
    throw Exception(e);
  }
}
