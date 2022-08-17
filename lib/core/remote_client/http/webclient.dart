import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:movies/core/remote_client/http/interceptors/authenticator_interceptor.dart';

Client client = InterceptedClient.build(interceptors: [
  AuthenticatorInterceptor(),
]);
