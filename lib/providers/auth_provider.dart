import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/user/user.dart';
import '../services/auth_service.dart';
import '../services/sync_service.dart';

class AuthState {
  final User? user;
  final String? token;
  final bool isLoading;

  /// True once the initial session-restore attempt has completed.
  final bool isInitialized;
  final String? error;

  const AuthState({
    this.user,
    this.token,
    this.isLoading = false,
    this.isInitialized = false,
    this.error,
  });

  bool get isAuthenticated => token != null && user != null;

  AuthState copyWith({
    User? user,
    String? token,
    bool? isLoading,
    bool? isInitialized,
    String? error,
    bool clearError = false,
    bool clearUser = false,
    bool clearToken = false,
  }) {
    return AuthState(
      user: clearUser ? null : (user ?? this.user),
      token: clearToken ? null : (token ?? this.token),
      isLoading: isLoading ?? this.isLoading,
      isInitialized: isInitialized ?? this.isInitialized,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

class AuthNotifier extends Notifier<AuthState> {
  static const _tokenKey = 'auth_token';
  static const _storage = FlutterSecureStorage();

  @override
  AuthState build() {
    _tryRestoreSession();
    return const AuthState();
  }

  AuthService get _authService => ref.read(authServiceProvider);

  Future<void> _tryRestoreSession() async {
    final token = await _storage.read(key: _tokenKey);
    if (token == null) {
      state = const AuthState(isInitialized: true);
      return;
    }

    try {
      SyncService.instance.setAuthToken(token);
      final user = await _authService.getMe(token);
      state = AuthState(token: token, user: user, isInitialized: true);
      SyncService.instance.startAutoSync();
    } catch (_) {
      // Token expired or invalid — clear it and go to login
      await _storage.delete(key: _tokenKey);
      SyncService.instance.clearAuthToken();
      state = const AuthState(isInitialized: true);
    }
  }

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final result = await _authService.login(email, password);
      await _storage.write(key: _tokenKey, value: result.token);
      SyncService.instance.setAuthToken(result.token);
      state = AuthState(
        token: result.token,
        user: result.user,
        isInitialized: true,
      );
      SyncService.instance.startAutoSync();
    } on DioException catch (e) {
      final message = e.response?.statusCode == 401
          ? 'Invalid email or password.'
          : 'Could not connect to server. Please try again.';
      state = state.copyWith(isLoading: false, error: message);
    } catch (_) {
      state = state.copyWith(
          isLoading: false, error: 'An unexpected error occurred.');
    }
  }

  Future<void> logout() async {
    await _storage.delete(key: _tokenKey);
    SyncService.instance.clearAuthToken();
    state = const AuthState(isInitialized: true);
  }
}

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

final authProvider = NotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);
