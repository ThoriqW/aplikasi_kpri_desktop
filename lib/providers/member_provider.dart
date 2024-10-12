import 'dart:convert';
import 'package:aplikasi_kpri_desktop/api/api_connections.dart';
import 'package:aplikasi_kpri_desktop/utils/error_response.dart';
import 'package:aplikasi_kpri_desktop/utils/success_response.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

part 'member_provider.g.dart';

const baseUrl = API.baseUrl;

const storage = FlutterSecureStorage();

@riverpod
Future addMember(
    AddMemberRef ref,
    String fullName,
    String nik,
    String nomorAnggota,
    String noHp,
    String address,
    DateTime? dateOfBirth,
    int workUnitId) async {
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
        'memberNumber': nomorAnggota,
        'phoneNumber': noHp,
        'address': address,
        'workUnitId': workUnitId,
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
      throw ErrorResponse.fromJson(jsonDecode(response.body)).errors;
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
      throw ErrorResponse.fromJson(jsonDecode(response.body)).errors;
    }
  } catch (e) {
    throw Exception(e);
  }
}

@riverpod
Future updateMember(
  UpdateMemberRef ref,
  String id,
  String fullName,
  String nik,
  String nomorAnggota,
  String noHp,
  String address,
  DateTime? dateOfBirth,
  int workUnitId,
) async {
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
        'dateOfBirth': dateOfBirth != null ? formatDateOnly(dateOfBirth) : null,
        'nik': nik,
        'memberNumber': nomorAnggota,
        'phoneNumber': noHp,
        'address': address,
        'workUnitId': workUnitId,
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
      return SuccessResponse.fromJson(jsonDecode(response.body));
    } else {
      return ErrorResponse.fromJson(jsonDecode(response.body));
    }
  } catch (e) {
    throw Exception(e);
  }
}

String formatDateOnly(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}
