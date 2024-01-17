import 'package:interview_task_trissur/controller/authentication/authentication_state.dart';
import 'package:interview_task_trissur/services/storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../services/api_service.dart';

part 'authentication_provider.g.dart';

@Riverpod(keepAlive: true)
class Authentication extends _$Authentication {
  @override
  AuthenticationState build() {
    return AuthenticationState(
      token: null,
      isLoading: false,
    );
  }

  void setToken() {
    ref.read(storageProvider).setToken(state.token!);
  }

  void getToken() async {
    String? token = await ref.read(storageProvider).getToken();
    state = state.copyWith(token: token);
  }

  void deleteToken() {
    ref.read(storageProvider).removeToken();
  }

  Future<String?> getProtectedData() async {
    try {
      final protectedMessage = await ref
          .read(apiServiceProvider)
          .getProtectedData(token: state.token!);

      return protectedMessage;
    } catch (e) {
      return 'Failed to get protected data. Try again';
    }
  }

  Future<String?> loginUser(String email, String password) async {
    try {
      final token = await ref
          .read(apiServiceProvider)
          .loginUser(email: email, password: password);
      state = state.copyWith(token: token);
      setToken();
      return null;
    } catch (e) {
      return 'Login failed. Please try again';
    }
  }

  Future<String?> registerUser(
      String email, String password, String name) async {
    try {
      final token = await ref
          .read(apiServiceProvider)
          .registerUser(email: email, password: password, name: name);
      state = state.copyWith(token: token);

      return null;
    } catch (e) {
      return 'Register failed. Please try again';
    }
  }

  void logoutUser() async {
    state = state.copyWith(token: null);
  }

  Future<bool> updateUser(String name, String password) async {
    try {
      final response = await ref
          .read(apiServiceProvider)
          .updateUser(password: password, name: name, token: state.token!);

      return response;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteUser() async {
    try {
      final response =
          await ref.read(apiServiceProvider).deleteUser(token: state.token!);

      return response;
    } catch (e) {
      return false;
    }
  }
}

@riverpod
Future<String?> getProtectedMessage(GetProtectedMessageRef ref) {
  return ref.read(authenticationProvider.notifier).getProtectedData();
}
