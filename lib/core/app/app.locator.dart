// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../service/api/api_service.dart';
import '../service/api/api_service_impl.dart';
import '../service/api/web_services.dart';
import '../service/api/web_services_impl.dart';
import '../service/utilities/scaffold/scaffold_service.dart';
import '../service/utilities/scaffold/scaffold_service_impl.dart';

final locator = StackedLocator.instance;

void setupLocator({String? environment, EnvironmentFilter? environmentFilter}) {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerSingleton<ScaffoldService>(ScaffoldServiceImplementation());
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<APIService>(() => APIServiceImpl());
  locator.registerSingleton<WebService>(WebServiceImpl());
}
