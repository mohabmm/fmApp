import 'package:flutter_app_test/core/service/api/api_service.dart';
import 'package:flutter_app_test/core/service/api/api_service_impl.dart';
import 'package:flutter_app_test/core/service/api/web_services.dart';
import 'package:flutter_app_test/core/service/api/web_services_impl.dart';
import 'package:flutter_app_test/core/service/utilities/scaffold/scaffold_service.dart';
import 'package:flutter_app_test/core/service/utilities/scaffold/scaffold_service_impl.dart';
import 'package:flutter_app_test/ui/view/album/album/home/home_album.dart';
import 'package:flutter_app_test/ui/view/album/album/search/search_page.dart';
import 'package:flutter_app_test/ui/view/album/album_details/album_details.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  /// Routes
  MaterialRoute(page: HomeAlbum, children: [], initial: true),
  MaterialRoute(
    page: AlbumDetails,
    children: [],
  ),

  MaterialRoute(
    page: SearchPage,
    children: [],
  ),

  /// Dependency Injection
], dependencies: [
  Singleton(classType: ScaffoldServiceImplementation, asType: ScaffoldService),
  LazySingleton(classType: NavigationService, asType: NavigationService),
  LazySingleton(classType: APIServiceImpl, asType: APIService),
  Singleton(classType: WebServiceImpl, asType: WebService),
])
class AppSetup {}
