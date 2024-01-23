abstract class ApiConsumer {
  Future<dynamic> get(String path, {
    Map<String, dynamic>? queryParam,
  });

  Future<dynamic> post(String path, {
    Map<String, dynamic>? queryParam,
    Map<String, dynamic>? body,
  });

  Future<dynamic> put(String path, {
    Map<String, dynamic>? queryParam,
    Map<String, dynamic>? body,
  });
}
