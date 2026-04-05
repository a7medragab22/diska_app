import 'package:diska_app/features/auth/login/data/models/log_in_model.dart';

abstract class LogInRepo {
  Future<void> login(LoginModel model);
}