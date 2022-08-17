import 'package:http_interceptor/http_interceptor.dart';

import '../../../utils/provisories.dart';

class AuthenticatorInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    data.headers["Authorization"] =
        "Bearer ${ProvisoryAutenticatorToken.token}";
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data;
  }
}
