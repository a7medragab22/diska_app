import 'package:diska_app/features/auth/login/data/models/log_in_model.dart';
import 'package:diska_app/features/auth/login/data/repos/log_in_repo.dart';
import 'package:diska_app/features/auth/login/logic/cubits/log_in_cubit/log_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInCubit extends Cubit<LogInState> {
  final LogInRepo repo;

  LogInCubit(this.repo) : super(AuthInitial());

  Future<void> login(String phone, String password) async {
    emit(AuthLoading());

    try {
      await repo.login(LoginModel(phone: phone, password: password));
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
