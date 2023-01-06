enum LoginResultStatus {
  initial,
  loading,
  wrongPassword,
  notRegistered,
  error,
  success;

  bool get isLoading => this == LoginResultStatus.loading;
}
