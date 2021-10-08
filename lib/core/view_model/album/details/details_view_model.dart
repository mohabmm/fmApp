import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_test/core/app/app.locator.dart';
import 'package:flutter_app_test/core/model/album/details/album_details.dart';
import 'package:flutter_app_test/core/service/api/api_service.dart';
import 'package:flutter_app_test/core/service/api/web_services_impl.dart';
import 'package:flutter_app_test/core/service/utilities/scaffold/scaffold_service.dart';

class DetailsViewModel extends ChangeNotifier {
  List _searchList = [];
  get getSearchList => _searchList;
  String _appStatus = "Default";

  get appStatus => _appStatus;

  Future<void> showDetails(String album, artist) async {
    _appStatus = "Loading";
    notifyListeners();
    _searchList = [];
    final _apiService = locator<APIService>();
    final scaffoldService = locator<ScaffoldService>();
    notifyListeners();
    ResponseObj response = await _apiService.getSearchDetails(album, artist);
    if (response.success == true) {
      print("successss");
      final List<AlbumDetails> fetchedList = [];
      print(response.body);
      var body = json.decode(response.body);

      fetchedList.add(AlbumDetails.fromJson(body));
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
