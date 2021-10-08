// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../ui/view/album/album/home/home_album.dart';
import '../../ui/view/album/album/search/search_page.dart';
import '../../ui/view/album/album_details/album_details.dart';

class Routes {
  static const String homeAlbum = '/';
  static const String albumDetails = '/album-details';
  static const String searchPage = '/search-page';
  static const all = <String>{
    homeAlbum,
    albumDetails,
    searchPage,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeAlbum, page: HomeAlbum),
    RouteDef(Routes.albumDetails, page: AlbumDetails),
    RouteDef(Routes.searchPage, page: SearchPage),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    HomeAlbum: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeAlbum(),
        settings: data,
      );
    },
    AlbumDetails: (data) {
      var args = data.getArgs<AlbumDetailsArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => AlbumDetails(
          key: args.key,
          artist: args.artist,
          album: args.album,
        ),
        settings: data,
      );
    },
    SearchPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SearchPage(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// AlbumDetails arguments holder class
class AlbumDetailsArguments {
  final Key? key;
  final String artist;
  final String album;
  AlbumDetailsArguments({this.key, required this.artist, required this.album});
}
