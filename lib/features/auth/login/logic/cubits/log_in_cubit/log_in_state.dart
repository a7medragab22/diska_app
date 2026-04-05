abstract class LogInState {}

class AuthInitial extends LogInState {}

class AuthLoading extends LogInState {}

class AuthSuccess extends LogInState {}

class AuthError extends LogInState {
  final String message;
  AuthError(this.message);
}
