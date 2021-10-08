import 'package:flutter_app_test/core/service/api/web_services_impl.dart';

abstract class WebService {
  Future<ResponseObj> getApi(String url);

  Future<ResponseObj> postApi({required String url, Map body, bool fromLogin});

  Future<ResponseObj> putApi({required String url, Map body});
}
