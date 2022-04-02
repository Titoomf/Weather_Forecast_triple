class AppError implements Exception {
  final String? mensage;
  //Um stack trace é gerado sempre que seu app falha devido a um erro ou uma exceção
  final StackTrace? strackTrace;
  AppError({
    this.mensage,
    this.strackTrace,
  });
}
