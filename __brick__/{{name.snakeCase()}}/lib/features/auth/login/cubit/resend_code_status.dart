/// Enum representing the status while performing resend operation
enum ResendCodeStatus {
  /// The operation has not started.
  idle,

  /// The operation is in process.
  inProgress,

  /// The operation has been successful.
  success,

  /// The operation failed.
  failure
}
