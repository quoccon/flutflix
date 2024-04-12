part of 'auth_cubit.dart';

@immutable
abstract class AuthState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class AuthInitial extends AuthState {}

class AuthSuccess extends AuthState {
    final User user;
    AuthSuccess({required this.user});
    @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthError extends AuthState {
  final String error;
  AuthError({required this.error});
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}