import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;

  static double? safeAreaHeight;
  static double? safeAreaWidth;

  void init(context) {
    _mediaQueryData = MediaQuery.of(context);
    if (_mediaQueryData!.orientation == Orientation.portrait) {
      screenWidth = _mediaQueryData!.size.width;
      screenHeight = _mediaQueryData!.size.height;
    } else {
      screenWidth = _mediaQueryData!.size.height;
      screenHeight = _mediaQueryData!.size.width;
    }

    safeAreaWidth = (screenWidth! -
        (_mediaQueryData!.padding.left + _mediaQueryData!.padding.right));
    safeAreaHeight = screenHeight! -
        (_mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom);
  }
}
