import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';

import 'core/app/app.locator.dart';
import 'core/app/app.router.dart';
import 'core/view_model/album/details/details_view_model.dart';
import 'core/view_model/album/serach_view_model/search_view_model.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => SearchViewModel()),
      ChangeNotifierProvider(create: (_) => DetailsViewModel()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () {
        return MaterialApp(
          title: 'FM App',
          navigatorKey: StackedService.navigatorKey,
          onGenerateRoute: StackedRouter().onGenerateRoute,
        );
      },
    );
  }
}
