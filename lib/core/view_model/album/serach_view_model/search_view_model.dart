import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_test/core/app/app.locator.dart';
import 'package:flutter_app_test/core/model/album/home/album.dart';
import 'package:flutter_app_test/core/service/api/api_service.dart';
import 'package:flutter_app_test/core/service/api/web_services_impl.dart';
import 'package:flutter_app_test/core/service/utilities/scaffold/scaffold_service.dart';

class SearchViewModel extends ChangeNotifier {
  List _searchList = [];
  get getSearchList => _searchList;
  String _appStatus = "Default";

  get appStatus => _appStatus;
  final _apiService = locator<APIService>();
  final scaffoldService = locator<ScaffoldService>();

  Future<void> startSearch(String searchedItem) async {
    _searchList = [];
    _appStatus = "Loading";
    notifyListeners();
    ResponseObj response = await _apiService.search(searchedItem);
    if (response.success == true) {
      final List<AlbumElement> fetchedList = [];
      print(response.body);
      var body = json.decode(response.body);
      var data = body['results']['albummatches']['album'];
      data?.forEach((dynamic item) {
        fetchedList.add(AlbumElement.fromJson(item));
      });
      _appStatus = "Default";
      _searchList.addAll(fetchedList);
      _searchList = _searchList.toSet().toList();
      notifyListeners();
      scaffoldService.showSnackBar(response.message);
    } else {
      scaffoldService.showSnackBar(response.message);
    }
  }
}
