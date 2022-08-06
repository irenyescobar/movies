import 'package:http_interceptor/http_interceptor.dart';

const String token =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyYzE5ODY4NzdmMmQxZTNiYjRmNjdiNTNjNzFmMzE2NiIsInN1YiI6IjYyZTlhODNmMzAzYzg1MDA1ZDIzYjk1ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.YS9d2q3AMiyDWVCM_gF-KhaKwfOR2wzoUC8Vngmh39E';

class AuthInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    data.headers["Authorization"] = "Bearer $token";
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data;
  }
}
