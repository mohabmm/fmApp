// Mocks generated by Mockito 5.0.15 from annotations
// in flutter_app_test/test/view_model_test/album/album_view_model_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:flash/flash.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:flutter_app_test/core/service/api/api_service.dart' as _i3;
import 'package:flutter_app_test/core/service/api/web_services.dart' as _i5;
import 'package:flutter_app_test/core/service/api/web_services_impl.dart'
    as _i2;
import 'package:flutter_app_test/core/service/utilities/scaffold/scaffold_service.dart'
    as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i9;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeResponseObj_0 extends _i1.Fake implements _i2.ResponseObj {}

/// A class which mocks [APIService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAPIService extends _i1.Mock implements _i3.APIService {
  @override
  _i4.Future<_i2.ResponseObj> search(String? searchedItem) =>
      (super.noSuchMethod(Invocation.method(#search, [searchedItem]),
              returnValue: Future<_i2.ResponseObj>.value(_FakeResponseObj_0()))
          as _i4.Future<_i2.ResponseObj>);
  @override
  _i4.Future<_i2.ResponseObj> getSearchDetails(String? artist, String? album) =>
      (super.noSuchMethod(Invocation.method(#getSearchDetails, [artist, album]),
              returnValue: Future<_i2.ResponseObj>.value(_FakeResponseObj_0()))
          as _i4.Future<_i2.ResponseObj>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [WebService].
///
/// See the documentation for Mockito's code generation for more information.
class MockWebService extends _i1.Mock implements _i5.WebService {
  @override
  _i4.Future<_i2.ResponseObj> getApi(String? url) =>
      (super.noSuchMethod(Invocation.method(#getApi, [url]),
              returnValue: Future<_i2.ResponseObj>.value(_FakeResponseObj_0()))
          as _i4.Future<_i2.ResponseObj>);
  @override
  _i4.Future<_i2.ResponseObj> postApi(
          {String? url, Map<dynamic, dynamic>? body, bool? fromLogin}) =>
      (super.noSuchMethod(
              Invocation.method(#postApi, [],
                  {#url: url, #body: body, #fromLogin: fromLogin}),
              returnValue: Future<_i2.ResponseObj>.value(_FakeResponseObj_0()))
          as _i4.Future<_i2.ResponseObj>);
  @override
  _i4.Future<_i2.ResponseObj> putApi(
          {String? url, Map<dynamic, dynamic>? body}) =>
      (super.noSuchMethod(
              Invocation.method(#putApi, [], {#url: url, #body: body}),
              returnValue: Future<_i2.ResponseObj>.value(_FakeResponseObj_0()))
          as _i4.Future<_i2.ResponseObj>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [ScaffoldService].
///
/// See the documentation for Mockito's code generation for more information.
class MockScaffoldService extends _i1.Mock implements _i6.ScaffoldService {
  @override
  dynamic showSnackBar(String? value) =>
      super.noSuchMethod(Invocation.method(#showSnackBar, [value]));
  @override
  dynamic removeCurrentSnackBar(_i7.FlashController<dynamic>? controller,
          {_i8.SnackBarClosedReason? reason =
              _i8.SnackBarClosedReason.remove}) =>
      super.noSuchMethod(Invocation.method(
          #removeCurrentSnackBar, [controller], {#reason: reason}));
  @override
  String toString() => super.toString();
}

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i9.NavigationService {
  @override
  String get previousRoute =>
      (super.noSuchMethod(Invocation.getter(#previousRoute), returnValue: '')
          as String);
  @override
  String get currentRoute =>
      (super.noSuchMethod(Invocation.getter(#currentRoute), returnValue: '')
          as String);
  @override
  _i8.GlobalKey<_i8.NavigatorState>? nestedNavigationKey(int? index) =>
      (super.noSuchMethod(Invocation.method(#nestedNavigationKey, [index]))
          as _i8.GlobalKey<_i8.NavigatorState>?);
  @override
  void config(
          {bool? enableLog,
          bool? defaultPopGesture,
          bool? defaultOpaqueRoute,
          Duration? defaultDurationTransition,
          bool? defaultGlobalState,
          String? defaultTransition}) =>
      super.noSuchMethod(
          Invocation.method(#config, [], {
            #enableLog: enableLog,
            #defaultPopGesture: defaultPopGesture,
            #defaultOpaqueRoute: defaultOpaqueRoute,
            #defaultDurationTransition: defaultDurationTransition,
            #defaultGlobalState: defaultGlobalState,
            #defaultTransition: defaultTransition
          }),
          returnValueForMissingStub: null);
  @override
  _i4.Future<T?>? navigateWithTransition<T>(_i8.Widget? page,
          {bool? opaque,
          String? transition = r'',
          Duration? duration,
          bool? popGesture,
          int? id,
          _i8.Curve? curve,
          _i9.Bindings? binding,
          bool? fullscreenDialog = false,
          bool? preventDuplicates = true,
          _i9.Transition? transitionClass}) =>
      (super.noSuchMethod(Invocation.method(#navigateWithTransition, [
        page
      ], {
        #opaque: opaque,
        #transition: transition,
        #duration: duration,
        #popGesture: popGesture,
        #id: id,
        #curve: curve,
        #binding: binding,
        #fullscreenDialog: fullscreenDialog,
        #preventDuplicates: preventDuplicates,
        #transitionClass: transitionClass
      })) as _i4.Future<T?>?);
  @override
  _i4.Future<T?>? replaceWithTransition<T>(_i8.Widget? page,
          {bool? opaque,
          String? transition = r'',
          Duration? duration,
          bool? popGesture,
          int? id,
          _i8.Curve? curve,
          _i9.Bindings? binding,
          bool? fullscreenDialog = false,
          bool? preventDuplicates = true,
          _i9.Transition? transitionClass}) =>
      (super.noSuchMethod(Invocation.method(#replaceWithTransition, [
        page
      ], {
        #opaque: opaque,
        #transition: transition,
        #duration: duration,
        #popGesture: popGesture,
        #id: id,
        #curve: curve,
        #binding: binding,
        #fullscreenDialog: fullscreenDialog,
        #preventDuplicates: preventDuplicates,
        #transitionClass: transitionClass
      })) as _i4.Future<T?>?);
  @override
  bool back<T>({T? result, int? id}) => (super.noSuchMethod(
      Invocation.method(#back, [], {#result: result, #id: id}),
      returnValue: false) as bool);
  @override
  void popUntil(_i8.RoutePredicate? predicate) =>
      super.noSuchMethod(Invocation.method(#popUntil, [predicate]),
          returnValueForMissingStub: null);
  @override
  void popRepeated(int? popTimes) =>
      super.noSuchMethod(Invocation.method(#popRepeated, [popTimes]),
          returnValueForMissingStub: null);
  @override
  _i4.Future<T?>? navigateTo<T>(String? routeName,
          {dynamic arguments,
          int? id,
          bool? preventDuplicates = true,
          Map<String, String>? parameters}) =>
      (super.noSuchMethod(Invocation.method(#navigateTo, [
        routeName
      ], {
        #arguments: arguments,
        #id: id,
        #preventDuplicates: preventDuplicates,
        #parameters: parameters
      })) as _i4.Future<T?>?);
  @override
  _i4.Future<T?>? navigateToView<T>(_i8.Widget? view,
          {dynamic arguments,
          int? id,
          bool? opaque,
          _i8.Curve? curve,
          _i9.Bindings? binding,
          Duration? duration,
          bool? fullscreenDialog = false,
          bool? popGesture,
          bool? preventDuplicates = true,
          _i9.Transition? transition}) =>
      (super.noSuchMethod(Invocation.method(#navigateToView, [
        view
      ], {
        #arguments: arguments,
        #id: id,
        #opaque: opaque,
        #curve: curve,
        #binding: binding,
        #duration: duration,
        #fullscreenDialog: fullscreenDialog,
        #popGesture: popGesture,
        #preventDuplicates: preventDuplicates,
        #transition: transition
      })) as _i4.Future<T?>?);
  @override
  _i4.Future<T?>? replaceWith<T>(String? routeName,
          {dynamic arguments,
          int? id,
          bool? preventDuplicates = true,
          Map<String, String>? parameters}) =>
      (super.noSuchMethod(Invocation.method(#replaceWith, [
        routeName
      ], {
        #arguments: arguments,
        #id: id,
        #preventDuplicates: preventDuplicates,
        #parameters: parameters
      })) as _i4.Future<T?>?);
  @override
  _i4.Future<T?>? clearStackAndShow<T>(String? routeName,
          {dynamic arguments, int? id, Map<String, String>? parameters}) =>
      (super.noSuchMethod(Invocation.method(#clearStackAndShow, [
        routeName
      ], {
        #arguments: arguments,
        #id: id,
        #parameters: parameters
      })) as _i4.Future<T?>?);
  @override
  _i4.Future<T?>? clearTillFirstAndShow<T>(String? routeName,
          {dynamic arguments,
          int? id,
          bool? preventDuplicates = true,
          Map<String, String>? parameters}) =>
      (super.noSuchMethod(Invocation.method(#clearTillFirstAndShow, [
        routeName
      ], {
        #arguments: arguments,
        #id: id,
        #preventDuplicates: preventDuplicates,
        #parameters: parameters
      })) as _i4.Future<T?>?);
  @override
  _i4.Future<T?>? clearTillFirstAndShowView<T>(_i8.Widget? view,
          {dynamic arguments, int? id}) =>
      (super.noSuchMethod(Invocation.method(#clearTillFirstAndShowView, [view],
          {#arguments: arguments, #id: id})) as _i4.Future<T?>?);
  @override
  _i4.Future<T?>? pushNamedAndRemoveUntil<T>(String? routeName,
          {_i8.RoutePredicate? predicate, dynamic arguments, int? id}) =>
      (super.noSuchMethod(Invocation.method(#pushNamedAndRemoveUntil, [
        routeName
      ], {
        #predicate: predicate,
        #arguments: arguments,
        #id: id
      })) as _i4.Future<T?>?);
  @override
  String toString() => super.toString();
}
