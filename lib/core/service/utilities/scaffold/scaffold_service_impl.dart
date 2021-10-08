import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/core/service/utilities/scaffold/scaffold_service.dart';
import 'package:stacked_services/stacked_services.dart';

class ScaffoldServiceImplementation implements ScaffoldService {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext get context =>
      StackedService.navigatorKey!.currentState!.overlay!.context;

  ScaffoldState get scaffoldState => Scaffold.of(context);

  @override
  showSnackBar(String value) {
    showFlash(
      context: context,
      duration: Duration(milliseconds: 8000),
      builder: (context, controller) {
        return Flash.bar(
          borderRadius: BorderRadius.circular(18),
          margin: EdgeInsets.all(18),
          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeOut,
          onTap: () {
            removeCurrentSnackBar(controller);
          },
          controller: controller,
          position: FlashPosition.bottom,
          boxShadows: kElevationToShadow[4],
          backgroundColor: Colors.black87,
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          child: FlashBar(
            icon: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
              // child: Image.asset(
              //   "assets/images/logo.png",
              //   width: 40,
              //   height: 40,
              // ),
            ),
            content: Container(
              child: new Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  removeCurrentSnackBar(FlashController controller,
      {SnackBarClosedReason reason = SnackBarClosedReason.remove}) {
    controller.dismiss();
  }
}
