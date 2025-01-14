import 'dart:convert';

import 'package:aplikasi_kpri_desktop/api/api_connections.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

part 'work_units_provider.g.dart';

const baseUrl = API.baseUrl;

const storage = FlutterSecureStorage();

@riverpod
Future getAllWorkUnits(
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
          '$baseUrl/api/v1/work-units?search=$search&per_page=$perPage&page=$page'),
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
Future getWorkUnit(ref, String id) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  try {
    final response = await http.get(
      Uri.parse('$baseUrl/api/v1/work-units/$id'),
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
Future addWorkUnit(ref, String namaWorkUnit, String kodeWorkUnit) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  try {
    final response = await http.post(
      Uri.parse('$baseUrl/api/v1/work-units'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'nama': namaWorkUnit, 'kode': kodeWorkUnit}),
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
Future updateWorkUnit(
    ref, String id, String namaWorkUnit, String kodeWorkUnit) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  try {
    final response = await http.patch(
      Uri.parse('$baseUrl/api/v1/work-units/$id'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'nama': namaWorkUnit, 'kode': kodeWorkUnit}),
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
Future deleteWorkUnit(ref, String id) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  try {
    final response = await http.delete(
      Uri.parse('$baseUrl/api/v1/work-units/$id'),
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
class TotalPageWorkUnits extends _$TotalPageWorkUnits {
  @override
  int build() => 0;

  void setTotalMember(int total) {
    state = total;
  }

  int getTotalMember() {
    return state;
  }
}
