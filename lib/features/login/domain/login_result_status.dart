enum LoginResultStatus {
  initial,
  loading,
  wrongPassword,
  notRegistered,
  fullFilled,
  error,
  success;

  bool get isLoading => this == LoginResultStatus.loading;
}
