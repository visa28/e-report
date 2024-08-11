

import 'package:get/get.dart';

import '../models/user_model.dart';
class AuthService extends GetConnect {
  Future<UserModel?> login(String user, String password) async {
    final response = await post(
      'http://api.ut.petrolab.co.id/users/login',
      {'username': user, 'password': password},
    );

    if (response.statusCode == 200) {
      // Parse the respons
      final tokenKey = response.body['tokenKey'];
      final name = response.body['user']['nama'];
      final user = response.body['user']['username'];

      // Save token and user data to local storage
      // You might want to use SharedPreferences or GetStorage for this
      return UserModel(tokenKey: tokenKey, name: name, username: user);
    } else {
      return null; // Handle error accordingly
    }
  }
}
