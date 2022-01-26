import 'package:flutter/material.dart';
import 'package:pokedex/core/fade_page_route.dart';
import 'package:pokedex/ui/screens/home/home.dart';
import 'package:pokedex/ui/screens/splash/splash.dart';
import 'package:pokedex/ui/screens/userprofile/userprofile.dart';

import 'domain/entities/contact.dart';

enum Routes { splash, home, userprofile }

class _Paths {
  static const String splash = '/';
  static const String home = '/home';
  static const String userprofile = '/userprofile';
  static const Map<Routes, String> _pathMap = {
    Routes.splash: _Paths.splash,
    Routes.home: _Paths.home,
    Routes.userprofile: _Paths.userprofile,
  };

  static String of(Routes route) => _pathMap[route] ?? splash;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.splash:
        return FadeRoute(page: SplashScreen());

      case _Paths.userprofile:
        return FadeRoute(
            page: UserProfileScreen(settings.arguments as Contact));

      case _Paths.home:
      default:
        return FadeRoute(page: HomeScreen());
    }
  }

  static Future? push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state?.pop();

  static NavigatorState? get state => navigatorKey.currentState;
}
