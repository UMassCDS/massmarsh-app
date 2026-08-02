import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/organization/organization.dart';
import '../models/user/user.dart';

// Lets the app open with a valid session and org list when there is no
// signal to reach the server at all, not just when a request is slow
class AuthCache {
  static const _storage = FlutterSecureStorage();
  static const _userKey = 'cached_user';
  static const _orgsKey = 'cached_orgs';

  // Shared with AuthNotifier and every Dio client that consumes
  // X-Refreshed-Token, so a renewed token always lands in the same place
  static const tokenKey = 'auth_token';

  static Future<void> updateToken(String token) async {
    await _storage.write(key: tokenKey, value: token);
  }

  static Future<void> saveUser(User user) async {
    await _storage.write(key: _userKey, value: jsonEncode(user.toJson()));
  }

  static Future<User?> readUser() async {
    final raw = await _storage.read(key: _userKey);
    if (raw == null) return null;
    try {
      return User.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  static Future<void> saveOrgs(List<Organization> orgs) async {
    await _storage.write(
      key: _orgsKey,
      value: jsonEncode(orgs.map((o) => o.toJson()).toList()),
    );
  }

  static Future<List<Organization>> readOrgs() async {
    final raw = await _storage.read(key: _orgsKey);
    if (raw == null) return [];
    try {
      final decoded = jsonDecode(raw) as List<dynamic>;
      return decoded
          .map((o) => Organization.fromJson(o as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return [];
    }
  }

  static Future<void> clear() async {
    await _storage.delete(key: _userKey);
    await _storage.delete(key: _orgsKey);
  }
}
