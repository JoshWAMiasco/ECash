class ApiResponce {
  bool failure;
  int? status;
  List<dynamic>? data;
  ApiResponce({
    this.failure = false,
    this.status,
    this.data,
  });
}
