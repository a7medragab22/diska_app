import 'package:diska_app/features/auth/register/data/models/register_model.dart';
import 'package:diska_app/features/auth/register/data/repos/register_repo.dart';
import 'package:diska_app/features/auth/register/logic/cubits/register_cubit/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo repo;

  RegisterCubit(this.repo) : super(RegisterState());

  void toggleRole(bool isMerchant) {
    emit(state.copyWith(isMerchant: isMerchant));
  }

  Future<void> register(RegisterModel model) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      await repo.register(model);
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
