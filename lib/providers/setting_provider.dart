import 'dart:convert';

import 'package:aplikasi_kpri_desktop/api/api_connections.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'setting_provider.g.dart';

const baseUrl = API.baseUrl;

const storage = FlutterSecureStorage();

//ROUTE
enum SettingMode { view, editFixedSetting }

@riverpod
class SettingModeNotifier extends _$SettingModeNotifier {
  @override
  SettingMode build() => SettingMode.view;

  void switchToView() => state = SettingMode.view;
  void switchToEditFixedSetting() => state = SettingMode.editFixedSetting;
}

@riverpod
Future createFixedSetting(
  ref,
  String nama,
  String nilai,
  String deskripsi,
) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/api/v1/fixed-settings'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "nama": nama,
        "nilai": nilai,
        "deskripsi": deskripsi,
      }),
    );
    if (response.statusCode == 201) {
      return SuccessResponse.fromJson(jsonDecode(response.body));
    } else {
      return ErrorResponse.fromJson(jsonDecode(response.body));
    }
  } catch (e) {
    throw Exception(e);
  }
}

@riverpod
Future getAllFixedSetting(
  ref,
  String search,
  int perPage,
  int page,
) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  try {
    final response = await http.get(
      Uri.parse(
          '$baseUrl/api/v1/fixed-settings?search=$search&per_page=$perPage&page=$page'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } else {
      return ErrorResponse.fromJson(jsonDecode(response.body)).errors;
    }
  } catch (e) {
    throw Exception(e);
  }
}

@riverpod
Future deleteFixedSetting(ref, String id) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  try {
    final response = await http.delete(
      Uri.parse('$baseUrl/api/v1/fixed-settings/$id'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return SuccessResponse.fromJson(jsonDecode(response.body));
    } else {
      return ErrorResponse.fromJson(jsonDecode(response.body));
    }
  } catch (e) {
    throw Exception(e);
  }
}

@riverpod
Future getFixedSetting(ref, String id) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }
  try {
    final response = await http.get(
      Uri.parse('$baseUrl/api/v1/fixed-settings/$id'),
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

@riverpod
class TotalFixedSetting extends _$TotalFixedSetting {
  @override
  int build() => 0;

  void setTotalMember(int total) {
    state = total;
  }

  int getTotalMember() {
    return state;
  }
}

@riverpod
class SearchFixedSetting extends _$SearchFixedSetting {
  @override
  Map<String, dynamic> build() {
    return {
      'searchQuery': '',
      'perPage': 10,
      'currentPage': 1,
    };
  }

  void setSearchUsers({
    String? gender,
    String? searchQuery,
    int? perPage,
    int? currentPage,
  }) {
    state = {
      'searchQuery': searchQuery ?? state['searchQuery'],
      'perPage': perPage ?? state['perPage'],
      'currentPage': currentPage ?? state['currentPage'],
    };
  }

  Map<String, dynamic> getSearchUsers() {
    return state;
  }
}

@riverpod
class IdFixedSetting extends _$IdFixedSetting {
  @override
  int build() => 0;

  void setId(int id) {
    state = id;
  }

  int getId() {
    return state;
  }
}
