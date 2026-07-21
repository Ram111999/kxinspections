import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kxinspections/app/router/app_router.dart';
import 'package:kxinspections/core/constants/app_strings.dart';
import 'package:kxinspections/core/theme/app_theme.dart';

/// Root widget. Providers will be wired here in the next implementation step.
class KxInspectionsApp extends StatelessWidget {
  KxInspectionsApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyScrollBehavior(),
      title: AppStrings.appTitle,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: _appRouter.router,
    );
  }
}

// scrolling behavior on mobile and dragging behavior on web
class MyScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}
