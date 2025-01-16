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
  int tahun,
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
    } else {
      return ErrorResponse.fromJson(jsonDecode(response.body)).errors;
    }
  } catch (e) {
    throw Exception(e);
  }
}

@riverpod
Future createMemberSavings(ref, int tahun) async {
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
  int tahun,
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
    } else {
      return ErrorResponse.fromJson(jsonDecode(response.body));
    }
  } catch (e) {
    throw Exception(e);
  }
}

@riverpod
Future deleteTahunSavings(
  ref,
  String tahun,
) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  try {
    final response = await http.delete(
      Uri.parse('$baseUrl/api/v1/savings/$tahun'),
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
Future updateTahunSavings(
  ref,
  String tahun,
  String newTahun,
) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  try {
    final response = await http.put(
      Uri.parse('$baseUrl/api/v1/savings/$tahun'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'tahun': newTahun,
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

@riverpod
class UpdateSavingObject extends _$UpdateSavingObject {
  @override
  Map<String, Map<String, dynamic>> build() => {};

  void updateValueSaving(
    String nomorAnggota,
    String bulan,
    String jenis,
    String newValue,
  ) {
    String key = nomorAnggota;

    if (!state.containsKey(key)) {
      state[key] = {};
    }

    if (!state[key]!.containsKey(bulan)) {
      state[key]![bulan] = {};
    }

    state[key]![bulan]![jenis] = int.tryParse(
            newValue.replaceAll("Rp", "").replaceAll(".", "").trim()) ??
        0;

    state = {...state};
  }

  void clearUpdateValueSaving() {
    state = {};
  }

  Map<String, Map<String, dynamic>> getUpdateValueSaving() {
    return state;
  }
}

@riverpod
class SearchSavings extends _$SearchSavings {
  @override
  Map<String, dynamic> build() {
    return {
      'tahun': DateTime.now().year,
      'workUnitId': 0,
      'searchQuery': '',
      'perPage': 10,
      'currentPage': 1,
    };
  }

  void setSearchSavings({
    int? tahun,
    int? workUnitId,
    String? searchQuery,
    int? perPage,
    int? currentPage,
  }) {
    state = {
      'tahun': tahun ?? state['tahun'],
      'workUnitId': workUnitId ?? state['workUnitId'],
      'searchQuery': searchQuery ?? state['searchQuery'],
      'perPage': perPage ?? state['perPage'],
      'currentPage': currentPage ?? state['currentPage'],
    };
  }

  Map<String, dynamic> getSearchSavings() {
    return state;
  }
}
