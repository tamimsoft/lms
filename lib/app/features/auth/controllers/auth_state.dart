enum Status { initial, loading, authenticated, error }

class AuthState {
  final String email;
  final String password;
  final Status status;
  final String errorMsg;

  const AuthState({
    this.email = '',
    this.password = '',
    this.status = Status.initial,
    this.errorMsg = '',
  });

  AuthState copyWith({
    String? email,
    String? password,
    Status? status,
    String? errorMsg,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
