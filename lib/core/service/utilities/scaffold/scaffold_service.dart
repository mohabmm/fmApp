import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

abstract class ScaffoldService {
  showSnackBar(String value);

  removeCurrentSnackBar(FlashController controller,
      {SnackBarClosedReason reason = SnackBarClosedReason.remove});
}
