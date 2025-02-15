abstract class ApiConsumer {
  Future<dynamic> get(
    String path, {
    Object? data,
    bool isFormData = false,
    Map<String, dynamic>? queryPram,
  });
  Future<dynamic> post(
    String path, {
    Object? data,
    bool isFormData = false,
    Map<String, dynamic>? queryPram,
  });
  Future<dynamic> patch(
    String path, {
    Object? data,
    bool isFormData = false,
    Map<String, dynamic>? queryPram,
  });
  Future<dynamic> delete(
    String path, {
    Object? data,
    bool isFormData = false,
    Map<String, dynamic>? queryPram,
  });
}
