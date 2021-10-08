import 'package:flutter_app_test/core/app/app.locator.dart';
import 'package:flutter_app_test/core/constant/constant.dart';
import 'package:flutter_app_test/core/service/api/web_services.dart';
import 'package:flutter_app_test/core/service/api/web_services_impl.dart';

import 'api_service.dart';

class APIServiceImpl implements APIService {
  @override
  Future<ResponseObj> search(String searchedItem) async {
    var map = new Map<String, dynamic>();
    map["method"] = "album.search";
    map["album"] = searchedItem;
    map["api_key"] = Constant.API_KEY;
    map["format"] = "json";
    final network = locator<WebService>();
    ResponseObj responseObject = await network.postApi(
      url: Constant.FM_URL_API,
      body: map,
    );
    return responseObject;
  }

  @override
  Future<ResponseObj> getSearchDetails(String artist, String album) async {
    var map = new Map<String, dynamic>();
    map["method"] = "album.getinfo";
    map["album"] = album;
    map["artist"] = artist;
    map["api_key"] = Constant.API_KEY;
    map["format"] = "json";
    final network = locator<WebService>();
    ResponseObj responseObject = await network.postApi(
      url: Constant.FM_URL_API,
      body: map,
    );
    return responseObject;
  }
}
