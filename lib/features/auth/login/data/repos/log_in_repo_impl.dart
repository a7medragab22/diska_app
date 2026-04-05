import 'package:diska_app/features/auth/login/data/models/log_in_model.dart';
import 'package:diska_app/features/auth/login/data/repos/log_in_repo.dart';

class LogInRepoImpl implements LogInRepo {
  @override
  Future<void> login(LoginModel model) async {
    await Future.delayed(const Duration(seconds: 2));

    if (model.phone != "01000000000" || model.password != "123456") {
      throw Exception("Login Failed");
    }
  }
}
