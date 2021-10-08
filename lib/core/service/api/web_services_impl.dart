import 'dart:convert';
import 'dart:io';

import 'package:flutter_app_test/core/app/app.locator.dart';
import 'package:flutter_app_test/core/service/api/web_services.dart';
import 'package:flutter_app_test/core/service/utilities/scaffold/scaffold_service.dart';
import 'package:http/http.dart';

class WebServiceImpl implements WebService {
  ScaffoldService scaffoldService = locator<ScaffoldService>();

  @override
  Future<ResponseObj> getApi(String url) async {
    return ResponseObj(statusCode: 200, body: "", message: "", success: true);
  }

  @override
  Future<ResponseObj> postApi(
      {required String url, Map? body, bool? fromLogin}) async {
    try {
      Response response = await post(
        Uri.parse(url),
        body: body,
      );

      if (response.statusCode == 2) {
        return ResponseObj(
            body: response.body,
            statusCode: response.statusCode,
            message: "Invalid service - This service does not exist",
            success: false);
      } else if (response.statusCode == 3) {
        return ResponseObj(
            body: response.body,
            message:
                "Invalid Method - No method with that name in this package",
            success: false);
      } else if (response.statusCode == 4) {
        return ResponseObj(
          body: response.body,
          message:
              " Authentication Failed - You do not have permissions to access the service",
          success: false,
        );
      } else if (response.statusCode == 5) {
        ResponseObj(
          body: response.body,
          message: "Invalid format - This service doesn't exist in that format",
          success: false,
        );
      } else if (response.statusCode == 6) {
        ResponseObj(
          body: response.body,
          message:
              "Invalid parameters - Your request is missing a required parameter",
          success: false,
        );
      } else if (response.statusCode == 7) {
        ResponseObj(
          body: response.body,
          message: " Invalid resource specified",
          success: false,
        );
      } else if (response.statusCode == 8) {
        await scaffoldService.showSnackBar(("Invalid resource specified"));

        return ResponseObj(
          body: "",
          message: "Invalid resource specified",
          success: false,
        );
      } else if (response.statusCode == 9) {
        return ResponseObj(
          body: "",
          message: "Invalid session key - Please re-authenticate",
          success: false,
        );
      } else if (response.statusCode == 10) {
        return ResponseObj(
          body: "",
          message:
              " Invalid API key - You must be granted a valid key by last.fm",
          success: false,
        );
      } else if (response.statusCode == 11) {
        return ResponseObj(
          body: "",
          message:
              "Service Offline - This service is temporarily offline. Try again later",
          success: false,
        );
      } else if (response.statusCode == 13) {
        return ResponseObj(
          body: "",
          message: "invalid method signature supplied",
          success: false,
        );
      } else if (response.statusCode == 16) {
        return ResponseObj(
          body: "",
          message:
              "There was a temporary error processing your request. Please try again",
          success: false,
        );
      } else if (response.statusCode == 26) {
        return ResponseObj(
          body: "",
          message:
              "Suspended API key - Access for your account has been suspended, please contact Last.fm",
          success: false,
        );
      } else if (response.statusCode == 29) {
        return ResponseObj(
          body: "",
          message:
              "Rate limit exceeded - Your IP has made too many requests in a short period",
          success: false,
        );
      } else {
        return ResponseObj(
          body: response.body,
          message: "Successful Operation",
          success: true,
        );
      }
    } on SocketException {
      await scaffoldService.showSnackBar(('interNetConnectionMessage'));
    }
    return ResponseObj(
      body: "",
      message: "",
      success: true,
    );
  }

  @override
  Future<ResponseObj> putApi({required String url, Map? body}) async {
    try {
      Response response = await put(
        Uri.parse(url),
        body: body,
      );
      var result = json.decode(response.body);
      if (response.statusCode == 200) {
        return ResponseObj(
            statusCode: response.statusCode,
            body: response.body,
            message: result["message"],
            success: result["statusCode"] == 200 ? true : false);
      } else {
        var body = json.decode(response.body);
        var message = body['message'];
        return ResponseObj(
            statusCode: response.statusCode,
            body: response.body,
            message: message ?? "Something went wrong",
            success: false);
      }
    } on SocketException {
      await scaffoldService.showSnackBar(('interNetConnectionMessage'));
      //502 BadGateWay
      return ResponseObj(
          statusCode: 502, body: "", message: "", success: false);
    }
  }
}

class ResponseObj {
  String body;
  String message;
  bool success;
  int? statusCode;

  ResponseObj({
    required this.body,
    required this.message,
    required this.success,
    this.statusCode,
  });
}
