import 'package:klinik_app_fikri/helpers/user_info.dart';

class LoginService {
  Future<bool> login(String username, String password) async {
    bool isLogin = false;
    if (username == 'admin' && password == 'admin') {
      await UserInfo().setToken('admin');
      await UserInfo().setUserId('1');
      await UserInfo().setUsername('admin');
      isLogin = true;
    }
    return isLogin;
  }
}
