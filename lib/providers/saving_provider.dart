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
Future getAllSavingMembers(
  ref,
  String tahun,
  int workUnitId,
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
          '$baseUrl/api/v1/savings?tahun=$tahun&work_unit_id=$workUnitId&search=$search&per_page=$perPage&page=$page'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } else if (response.statusCode == 404) {
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

  try {
    final response = await http.post(
      Uri.parse('$baseUrl/api/v1/savings/update'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'tahun': tahun,
        'savings': transformedUpdateSavings,
      }),
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
Future addMemberSavings(
  ref,
  String memberId,
  String tahun,
) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  try {
    final response = await http.post(
      Uri.parse('$baseUrl/api/v1/savings/$tahun/add-member'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'member_profile_id': memberId == '' ? 0 : int.parse(memberId),
      }),
    );
    if (response.statusCode == 201) {
      return SuccessResponse.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } else {
      return ErrorResponse.fromJson(jsonDecode(response.body));
    }
  } catch (e) {
    throw Exception(e);
  }
}

@riverpod
Future deleteMemberSavings(
  ref,
  String id,
  String tahun,
) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  try {
    final response = await http.delete(
      Uri.parse('$baseUrl/api/v1/savings/$tahun/member/$id'),
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
Future transferMemberSavings(
  ref,
  String id,
  String tahun,
  String workUnitId,
) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }
  try {
    final response = await http.patch(
      Uri.parse('$baseUrl/api/v1/savings/$tahun/transfer-work-unit/$id'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'work_unit_id': workUnitId == '' ? 0 : int.parse(workUnitId),
      }),
    );
    if (response.statusCode == 200) {
      return SuccessResponse.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse;
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

@riverpod
class TotalPageSavings extends _$TotalPageSavings {
  @override
  int build() => 0;

  void setTotalMember(int total) {
    state = total;
  }

  int getTotalMember() {
    return state;
  }
}
