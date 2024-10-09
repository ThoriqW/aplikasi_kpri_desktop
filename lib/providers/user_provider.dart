import 'dart:convert';

import 'package:aplikasi_kpri_desktop/api/api_connections.dart';
import 'package:aplikasi_kpri_desktop/models/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

part 'user_provider.g.dart';

const baseUrl = API.baseUrl;

const storage = FlutterSecureStorage();

@riverpod
Future<User> getCurrentUser(GetCurrentUserRef ref) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  try {
    final response = await http.get(
      Uri.parse('$baseUrl/api/v1/users/current'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  } catch (e) {
    throw Exception(e);
  }
}

@riverpod
Future getAllUser(GetAllUserRef ref) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  try {
    final response = await http.get(
      Uri.parse('$baseUrl/api/v1/users'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final List<dynamic> users = jsonResponse['data'];
      return List<Map<String, dynamic>>.from(users);
    } else {
      return response.body;
    }
  } catch (e) {
    throw Exception(e);
  }
}

@riverpod
Future registerUser(
    RegisterUserRef ref, String username, String password) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  try {
    final response = await http.post(
      Uri.parse('$baseUrl/api/v1/users/register'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'username': username, 'password': password}),
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  } catch (e) {
    throw Exception(e);
  }
}

@riverpod
Future updateUser(UpdateUserRef ref, String username, String password) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  try {
    final response = await http.patch(
      Uri.parse('$baseUrl/api/v1/users/current'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'username': username, 'password': password}),
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  } catch (e) {
    throw Exception(e);
  }
}

@riverpod
Future deleteUser(DeleteUserRef ref, String id) async {
  final String? token = await storage.read(key: 'authToken');

  if (token == null) {
    throw Exception('No authentication token found');
  }

  try {
    final response = await http.delete(
      Uri.parse('$baseUrl/api/v1/users/$id'),
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
