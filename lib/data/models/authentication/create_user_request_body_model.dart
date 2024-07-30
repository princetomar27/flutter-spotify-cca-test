class CreateUserRequestBodyModel {
  final String fullName;
  final String email;
  final String password;

  CreateUserRequestBodyModel(
      {required this.email, required this.fullName, required this.password});
}
