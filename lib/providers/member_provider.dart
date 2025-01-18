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
  ref,
  String namaLengkap,
  String nik,
  String nomorAnggota,
  String noHp,
  String alamat,
  DateTime? dateOfBirth,
  String email,
  String jenisKelamin,
  String agama,
  String jabatan,
  String pangkat,
  String nip,
  DateTime? tanggalMasuk,
  int workUnitId,
  int status,
) async {
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
        'nama_lengkap': namaLengkap,
        'nik': nik,
        'nomor_anggota': nomorAnggota,
        'phone': noHp,
        'alamat': alamat,
        'tanggal_lahir':
            dateOfBirth != null ? formatDateOnly(dateOfBirth) : null,
        'email': email,
        'jenis_kelamin': jenisKelamin,
        'agama': agama,
        'jabatan': jabatan,
        'pangkat': pangkat,
        'nip': nip,
        'tanggal_masuk':
            tanggalMasuk != null ? formatDateOnly(tanggalMasuk) : null,
        'work_unit_id': workUnitId,
        'status': status,
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
Future getAllMember(
  ref,
  String search,
  int workUnitId,
  String status,
  int perPage,
  int page,
) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  if (status == 'Aktif') {
    status = '1';
  } else if (status == "Tidal Aktif") {
    status = '0';
  }

  try {
    final response = await http.get(
      Uri.parse(
          '$baseUrl/api/v1/members?search=$search&work_unit_id=$workUnitId&status=$status&per_page=$perPage&page=$page'),
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
Future getMember(ref, String id) async {
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
      return ErrorResponse.fromJson(jsonDecode(response.body)).errors;
    }
  } catch (e) {
    throw Exception(e);
  }
}

@riverpod
Future updateMember(
  ref,
  String id,
  String namaLengkap,
  String nik,
  String nomorAnggota,
  String noHp,
  String alamat,
  DateTime? dateOfBirth,
  String email,
  String jenisKelamin,
  String agama,
  String jabatan,
  String pangkat,
  String nip,
  DateTime? tanggalMasuk,
  DateTime? tanggalKeluar,
  int workUnitId,
  int status,
) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  try {
    final response = await http.put(
      Uri.parse('$baseUrl/api/v1/members/$id'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'nama_lengkap': namaLengkap,
        'nik': nik,
        'nomor_anggota': nomorAnggota,
        'phone': noHp,
        'alamat': alamat,
        'tanggal_lahir':
            dateOfBirth != null ? formatDateOnly(dateOfBirth) : null,
        'email': email,
        'jenis_kelamin': jenisKelamin,
        'agama': agama,
        'jabatan': jabatan,
        'pangkat': pangkat,
        'nip': nip,
        'tanggal_masuk':
            tanggalMasuk != null ? formatDateOnly(tanggalMasuk) : null,
        'tanggal_keluar':
            tanggalKeluar != null ? formatDateOnly(tanggalKeluar) : null,
        'work_unit_id': workUnitId,
        'status': status,
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
Future deleteMember(ref, String id) async {
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

@riverpod
Future resetPasswordMember(ref, String id) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }
  try {
    final response = await http.put(
      Uri.parse('$baseUrl/api/v1/members/$id/reset-password'),
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
class TotalPageMember extends _$TotalPageMember {
  @override
  int build() => 0;

  void setTotalMember(int total) {
    state = total;
  }
}

String formatDateOnly(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}

@riverpod
class SearchMember extends _$SearchMember {
  @override
  Map<String, dynamic> build() {
    return {
      'tahun': DateTime.now().year,
      'workUnitId': 0,
      'searchQuery': '',
      'perPage': 35,
      'currentPage': 1,
      'status': '',
    };
  }

  void setSearchMember({
    int? tahun,
    int? workUnitId,
    String? searchQuery,
    int? perPage,
    int? currentPage,
    String? status,
  }) {
    state = {
      'tahun': tahun ?? state['tahun'],
      'workUnitId': workUnitId ?? state['workUnitId'],
      'searchQuery': searchQuery ?? state['searchQuery'],
      'perPage': perPage ?? state['perPage'],
      'currentPage': currentPage ?? state['currentPage'],
      'status': status ?? state['status'],
    };
  }

  Map<String, dynamic> getSearchMember() {
    return state;
  }
}

//ROUTE

enum MemberMode { view, update, add }

@riverpod
class MemberModeNotifier extends _$MemberModeNotifier {
  @override
  MemberMode build() => MemberMode.view;

  void switchToView() => state = MemberMode.view;
  void switchToUpdateUser() => state = MemberMode.update;
  void switchToAddUser() => state = MemberMode.add;
}

@riverpod
class IdMemberNotifier extends _$IdMemberNotifier {
  @override
  int build() => 0;

  void setId(int id) {
    state = id;
  }

  int getId() {
    return state;
  }
}
