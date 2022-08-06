import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:movies/http/authInterceptor.dart';

Client client = InterceptedClient.build(interceptors: [
  AuthInterceptor(),
]);
