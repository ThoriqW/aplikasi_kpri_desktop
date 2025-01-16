import 'dart:convert';

import 'package:aplikasi_kpri_desktop/api/api_connections.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'bills_provider.g.dart';

const baseUrl = API.baseUrl;

const storage = FlutterSecureStorage();

@riverpod
Future getAllBillsMembers(
  ref,
  int tahun,
  int workUnitId,
  String search,
  int bulan,
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
          '$baseUrl/api/v1/bills?tahun=$tahun&work_unit_id=$workUnitId&search=$search&per_page=$perPage&page=$page&bulan=$bulan'),
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
Future createMemberTagihan(ref, String tahun) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  try {
    final response = await http.post(
      Uri.parse('$baseUrl/api/v1/bills'),
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
class TotalPageBills extends _$TotalPageBills {
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
class SearchBills extends _$SearchBills {
  @override
  Map<String, dynamic> build() {
    return {
      'tahun': DateTime.now().year,
      'workUnitId': 0,
      'searchQuery': '',
      'perPage': 10,
      'currentPage': 1,
      'bulan': DateTime.now().month,
    };
  }

  void setSearchBills({
    int? tahun,
    int? workUnitId,
    String? searchQuery,
    int? perPage,
    int? currentPage,
    int? bulan,
  }) {
    state = {
      'tahun': tahun ?? state['tahun'],
      'workUnitId': workUnitId ?? state['workUnitId'],
      'searchQuery': searchQuery ?? state['searchQuery'],
      'perPage': perPage ?? state['perPage'],
      'currentPage': currentPage ?? state['currentPage'],
      'bulan': bulan ?? state['bulan'],
    };
  }

  Map<String, dynamic> getSearchBills() {
    return state;
  }
}
