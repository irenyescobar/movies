import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:movies/core/remote_client/remote_client.dart';

import 'interceptors/authenticator_interceptor.dart';

class HttpRemoteClientImplementation implements RemoteClient {
  final Client client = InterceptedClient.build(interceptors: [
    AuthenticatorInterceptor(),
  ]);

  @override
  Future<RemoteResponse> get(String url) async {
    final response = await client.get(Uri.parse(url));

    return RemoteResponse(data: response.body, statusCode: response.statusCode);
  }

  @override
  Future<RemoteResponse> post(String url,
      {required Map<String, dynamic> body}) {
    throw UnimplementedError();
  }
}
