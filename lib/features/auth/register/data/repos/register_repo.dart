import 'package:diska_app/features/auth/register/data/models/register_model.dart';

abstract class RegisterRepo {
  Future<void> register(RegisterModel model);
}