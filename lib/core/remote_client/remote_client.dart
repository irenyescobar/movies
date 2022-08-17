abstract class RemoteClient {
  Future<RemoteResponse> get(String url);
  Future<RemoteResponse> post(String url, {required Map<String, dynamic> body});
}

class RemoteResponse {
  final dynamic data;
  final int? statusCode;

  RemoteResponse({required this.data, required this.statusCode});
}
