part of 'authentication_cubit.dart';

@immutable
sealed class AuthenticationState extends Equatable {}

final class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

final class AuthSignUpLoading extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthUserLoggedIn extends AuthenticationState {
  final Either<dynamic, dynamic> user;

  AuthUserLoggedIn({required this.user});

  @override
  List<Object?> get props => [];
}
