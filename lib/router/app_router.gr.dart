// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../models/order_model.dart' as _i11;
import '../pages/cart_page.dart' as _i5;
import '../pages/home_page.dart' as _i2;
import '../pages/login_page.dart' as _i3;
import '../pages/main_page.dart' as _i4;
import '../pages/menu_page.dart' as _i8;
import '../pages/recipt_page.dart' as _i7;
import '../pages/registration_page.dart' as _i6;
import '../pages/root_page.dart' as _i1;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    RootRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.RootPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.LoginPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.MainPage(),
      );
    },
    CartRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.CartPage(),
      );
    },
    RegistrationRoute.name: (routeData) {
      final args = routeData.argsAs<RegistrationRouteArgs>(
          orElse: () => const RegistrationRouteArgs());
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.RegistrationPage(key: args.key),
      );
    },
    ReciptRoute.name: (routeData) {
      final args = routeData.argsAs<ReciptRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.ReciptPage(
          key: args.key,
          order: args.order,
        ),
      );
    },
    MenuRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.MenuPage(),
      );
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          RootRoute.name,
          path: '/',
        ),
        _i9.RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
        _i9.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i9.RouteConfig(
          MainRoute.name,
          path: '/main',
        ),
        _i9.RouteConfig(
          CartRoute.name,
          path: '/cart',
        ),
        _i9.RouteConfig(
          RegistrationRoute.name,
          path: '/registration',
        ),
        _i9.RouteConfig(
          ReciptRoute.name,
          path: '/recipt',
        ),
        _i9.RouteConfig(
          MenuRoute.name,
          path: '/menu',
        ),
      ];
}

/// generated route for
/// [_i1.RootPage]
class RootRoute extends _i9.PageRouteInfo<void> {
  const RootRoute()
      : super(
          RootRoute.name,
          path: '/',
        );

  static const String name = 'RootRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.MainPage]
class MainRoute extends _i9.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '/main',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i5.CartPage]
class CartRoute extends _i9.PageRouteInfo<void> {
  const CartRoute()
      : super(
          CartRoute.name,
          path: '/cart',
        );

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i6.RegistrationPage]
class RegistrationRoute extends _i9.PageRouteInfo<RegistrationRouteArgs> {
  RegistrationRoute({_i10.Key? key})
      : super(
          RegistrationRoute.name,
          path: '/registration',
          args: RegistrationRouteArgs(key: key),
        );

  static const String name = 'RegistrationRoute';
}

class RegistrationRouteArgs {
  const RegistrationRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'RegistrationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.ReciptPage]
class ReciptRoute extends _i9.PageRouteInfo<ReciptRouteArgs> {
  ReciptRoute({
    _i10.Key? key,
    required _i11.OrderModel order,
  }) : super(
          ReciptRoute.name,
          path: '/recipt',
          args: ReciptRouteArgs(
            key: key,
            order: order,
          ),
        );

  static const String name = 'ReciptRoute';
}

class ReciptRouteArgs {
  const ReciptRouteArgs({
    this.key,
    required this.order,
  });

  final _i10.Key? key;

  final _i11.OrderModel order;

  @override
  String toString() {
    return 'ReciptRouteArgs{key: $key, order: $order}';
  }
}

/// generated route for
/// [_i8.MenuPage]
class MenuRoute extends _i9.PageRouteInfo<void> {
  const MenuRoute()
      : super(
          MenuRoute.name,
          path: '/menu',
        );

  static const String name = 'MenuRoute';
}
