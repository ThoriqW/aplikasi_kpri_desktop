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
Future createMemberTagihan(ref, int tahun, int bulan) async {
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
      body: jsonEncode({
        'tahun': tahun,
        'bulan': bulan,
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
Future updateMemberTagihan(
  ref,
  int tahun,
  int bulan,
  Map<String, dynamic> updateTagihanObject,
) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  try {
    final response = await http.post(
      Uri.parse('$baseUrl/api/v1/bills/update'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'tahun': tahun,
        'bulan': bulan,
        'bills': [updateTagihanObject],
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
Future deleteMemberTagihan(ref, String id, String tahun, String bulan) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  try {
    final response = await http.delete(
      Uri.parse('$baseUrl/api/v1/bills/$tahun/$bulan/member/$id'),
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
class TotalPageBills extends _$TotalPageBills {
  @override
  int build() => 0;

  void setTotalMember(int total) {
    state = total;
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
      'perPage': 25,
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

@riverpod
class DataMemberTagihanNotifier extends _$DataMemberTagihanNotifier {
  @override
  Map<String, dynamic> build() => {};

  void setData(
    int memberProfileId,
    String namaMember,
    String simpananPokok,
    String simpananWajib,
    String danaSosial,
    String sukarela,
    String pokok,
    String bunga,
    String barang,
    String jangkaWaktu,
    String jangkaWaktuKe,
    String jumlahPinjaman,
    String jumlahTagihan,
    String jmlSetoranSimpananPokok,
    String jmlSetoranSimpananWajib,
    String jmlSetoranDanaSosial,
    String jmlSetoranSukarela,
    String jmlSetoranPokok,
    String jmlSetoranBunga,
    String jmlSetoranBarang,
    String sisaTunggakan,
    String keterangan,
    int tahun,
    int bulan,
  ) {
    state = {
      "member_profile_id": memberProfileId,
      "nama_member": namaMember,
      "simpanan_pokok": simpananPokok,
      "simpanan_wajib": simpananWajib,
      "dana_sosial": danaSosial,
      "sukarela": sukarela,
      "pokok": pokok,
      "bunga": bunga,
      "barang": barang,
      "jangka_waktu": jangkaWaktu,
      "jangka_waktu_ke": jangkaWaktuKe,
      "jml_pinjaman": jumlahPinjaman,
      "jml_tagihan": jumlahTagihan,
      "jml_setoran_simpanan_pokok": jmlSetoranSimpananPokok,
      "jml_setoran_simpanan_wajib": jmlSetoranSimpananWajib,
      "jml_setoran_dana_sosial": jmlSetoranDanaSosial,
      "jml_setoran_sukarela": jmlSetoranSukarela,
      "jml_setoran_pokok": jmlSetoranPokok,
      "jml_setoran_bunga": jmlSetoranBunga,
      "jml_setoran_barang": jmlSetoranBarang,
      "sisa_tunggakan": sisaTunggakan,
      "keterangan": keterangan,
      "tahun": tahun,
      "bulan": bulan,
    };
  }

  void clearDataMemberTagihan() {
    state = {};
  }

  Map<String, dynamic> getData() {
    return state;
  }
}

@riverpod
Future transferMemberTagihan(
    ref, String id, String tahun, String workUnitId, String bulan) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  try {
    final response = await http.patch(
      Uri.parse('$baseUrl/api/v1/bills/$tahun/$bulan/transfer-work-unit/$id'),
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
class DataTransferMemberTagihanNotifier
    extends _$DataTransferMemberTagihanNotifier {
  @override
  Map<String, dynamic> build() => {};

  void setData(
    String memberProfileId,
    String namaMember,
    String unitKeraId,
    String unitKerja,
    String tahun,
    String bulan,
  ) {
    state = {
      "member_profile_id": memberProfileId,
      "nama_member": namaMember,
      "unit_kerja_id": unitKeraId,
      "namaWorkUnit": unitKerja,
      "tahun": tahun,
      "bulan": bulan,
    };
  }

  void clearDataTransferMemberTagihan() {
    state = {};
  }

  Map<String, dynamic> getData() {
    return state;
  }
}

@riverpod
Future updateTahunBulanTagihan(
  ref,
  String tahun,
  String newTahun,
  String bulan,
  String newBulan,
) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }
  try {
    final response = await http.put(
      Uri.parse('$baseUrl/api/v1/bills/$tahun/$bulan'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'tahun': newTahun,
        'bulan': newBulan,
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
Future deleteBulanTagihan(
  ref,
  String tahun,
  String bulan,
) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  try {
    final response = await http.delete(
      Uri.parse('$baseUrl/api/v1/bills/$tahun/$bulan'),
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

//ROUTE
enum TagihanMode {
  view,
  editTagihan,
  transferMemberTagihan,
  updateTagihanMember
}

@riverpod
class TagihanModeNotifier extends _$TagihanModeNotifier {
  @override
  TagihanMode build() => TagihanMode.view;

  void switchToView() => state = TagihanMode.view;
  void switchToeditTagihan() => state = TagihanMode.editTagihan;
  void switchToUpdateTagihanMember() => state = TagihanMode.updateTagihanMember;
  void switchToTransferTagihanMember() =>
      state = TagihanMode.transferMemberTagihan;
}

@riverpod
class EditTagihanNotifier extends _$EditTagihanNotifier {
  @override
  Map<String, dynamic> build() => {};

  void setEditDataTagihan(String tahun, int bulan) {
    state = {
      "tahun": tahun,
      "bulan": bulan,
    };
  }

  Map<String, dynamic> getEditDataTagihan() {
    return state;
  }

  void clearDataEditTagihan() {
    state = {};
  }
}
