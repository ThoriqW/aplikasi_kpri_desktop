import 'dart:convert';

import 'package:aplikasi_kpri_desktop/api/api_connections.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'saving_provider.g.dart';

const baseUrl = API.baseUrl;

const storage = FlutterSecureStorage();

@riverpod
Future getAllSavingMembers(ref, String tahun) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  try {
    final response = await http.get(
      Uri.parse('$baseUrl/api/v1/savings?tahun=$tahun'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final List<dynamic> savingsResponse = jsonResponse['data'];
      return List<Map<String, dynamic>>.from(savingsResponse);
    } else {
      throw ErrorResponse.fromJson(jsonDecode(response.body)).errors;
    }
  } catch (e) {
    throw Exception(e);
  }
}

@riverpod
Future createMemberSavings(ref, String tahun) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  try {
    final response = await http.post(
      Uri.parse('$baseUrl/api/v1/savings'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'tahun': tahun}),
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
Future updateMemberSavings(
  ref,
  int tahun,
  int workUnitId,
  Map<String, Map<String, dynamic>> updateSavingsObject,
) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  final transformedUpdateSavings = transformSavingsData(updateSavingsObject);

  print(jsonEncode({
    'tahun': tahun,
    'work_unit_id': workUnitId,
    'savings': transformedUpdateSavings,
  }));

  try {
    final response = await http.post(
      Uri.parse('$baseUrl/api/v1/savings/update'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'tahun': tahun,
        'work_unit_id': workUnitId,
        'savings': transformedUpdateSavings,
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

List<Map<String, dynamic>> transformSavingsData(
  Map<String, Map<String, dynamic>> updateSavingsObject,
) {
  return updateSavingsObject.entries.map((memberEntry) {
    final memberId = memberEntry.key;
    final months = memberEntry.value;

    return {
      "member_profile_id": int.parse(memberId),
      ...months.map((month, savings) => MapEntry(month, savings)),
    };
  }).toList();
}
