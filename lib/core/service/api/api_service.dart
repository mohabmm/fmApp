import 'package:flutter_app_test/core/service/api/web_services_impl.dart';

abstract class APIService {
  Future<ResponseObj> search(String searchedItem);
  Future<ResponseObj> getSearchDetails(String artist, String album);
}
