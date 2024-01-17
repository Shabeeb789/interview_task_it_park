import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'storage.g.dart';

//initialising the instance

class StorageServices {
  final prefs = SharedPreferences.getInstance();

  void setToken(String token) async {
    await (await prefs).setString("token", token);
  }

  Future<String?> getToken() async {
    return await (await prefs).getString("token");
  }

  Future<bool> removeToken() async {
    return await (await prefs).remove("token");
  }
}

//povider//
@riverpod
StorageServices storage(StorageRef ref) {
  return StorageServices();
}
