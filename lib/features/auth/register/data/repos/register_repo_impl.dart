import 'package:diska_app/features/auth/register/data/models/register_model.dart';
import 'package:diska_app/features/auth/register/data/repos/register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  @override
  Future<void> register(RegisterModel model) async {
    await Future.delayed(const Duration(seconds: 2));

    // simulate success
    print(model.toJson());
  }
}