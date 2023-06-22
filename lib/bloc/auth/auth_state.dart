part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Loading extends AuthState {
  @override
  List<Object?> get props => [];
}

// When the user is authenticated the state is changed to Authenticated.
class Authenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

// When the user is authenticated and forgot his password the state is changed to Authenticated.
class ForgotPassword extends AuthState {
  @override
  List<Object?> get props => [];
}

// This is the initial state of the bloc. When the user is not authenticated the state is changed to Unauthenticated.
class UnAuthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

class ResetStatus extends AuthState {
  final bool status;
  final String email;

  ResetStatus(this.status, this.email);
  @override
  List<Object?> get props => [status, email];
}

// If any error occurs the state is changed to AuthError.
class AuthError extends AuthState {
  final String error;

  AuthError(this.error);
  @override
  List<Object?> get props => [error];
}
