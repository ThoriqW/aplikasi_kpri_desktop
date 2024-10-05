import 'dart:convert';

import 'package:aplikasi_kpri_desktop/api/api_connections.dart';
import 'package:aplikasi_kpri_desktop/models/member_model.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

part 'member_provider.g.dart';

const baseUrl = API.baseUrl;

const storage = FlutterSecureStorage();

@riverpod
Future addMember(AddMemberRef ref, String fullName, String nik, String noHp,
    String address, DateTime? dateOfBirth, int workUnitId) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  try {
    final response = await http.post(
      Uri.parse('$baseUrl/api/v1/members/register'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'fullName': fullName,
        'dateOfBirth': dateOfBirth != null ? formatDateOnly(dateOfBirth) : null,
        'nik': nik,
        'phoneNumber': noHp,
        'address': address,
        'workUnitId': workUnitId,
      }),
    );
    if (response.statusCode == 201) {
      return Member.fromJson(jsonDecode(response.body));
    } else {
      throw response.body;
    }
  } catch (e) {
    throw Exception(e);
  }
}

@riverpod
Future getAllMember(GetAllMemberRef ref) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  try {
    final response = await http.get(
      Uri.parse('$baseUrl/api/v1/members'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final List<dynamic> members = jsonResponse['data'];
      return List<Map<String, dynamic>>.from(members);
    } else {
      throw response.body;
    }
  } catch (e) {
    throw Exception(e);
  }
}

@riverpod
Future getMember(GetMemberRef ref, String id) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  try {
    final response = await http.get(
      Uri.parse('$baseUrl/api/v1/members/$id'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse['data'];
    } else {
      throw response.body;
    }
  } catch (e) {
    throw Exception(e);
  }
}

@riverpod
Future updateMember(UpdateMemberRef ref, String id, String fullName, String nik,
    String username, int workUnitId) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  try {
    final response = await http.patch(
      Uri.parse('$baseUrl/api/v1/members/$id'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'fullName': fullName,
        'nik': nik,
        'username': username,
        'workUnitId': workUnitId,
      }),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } else {
      throw response.body;
    }
  } catch (e) {
    throw Exception(e);
  }
}

@riverpod
Future deleteMember(DeleteMemberRef ref, String id) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  try {
    final response = await http.delete(
      Uri.parse('$baseUrl/api/v1/members/$id'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } else {
      throw response.body;
    }
  } catch (e) {
    throw Exception(e);
  }
}

String formatDateOnly(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}
