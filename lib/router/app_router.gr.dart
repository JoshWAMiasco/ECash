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
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;

import '../models/order_model.dart' as _i19;
import '../pages/cart_page.dart' as _i13;
import '../pages/cash_in_via_card.dart' as _i2;
import '../pages/grab_bill_page.dart' as _i3;
import '../pages/home_credit_billpage.dart' as _i4;
import '../pages/home_page.dart' as _i5;
import '../pages/login_page.dart' as _i6;
import '../pages/main_page.dart' as _i7;
import '../pages/menu_page.dart' as _i16;
import '../pages/otp_page.dart' as _i8;
import '../pages/pay_qr_scanner.dart' as _i9;
import '../pages/qr_payment_result_page.dart' as _i10;
import '../pages/recipt_page.dart' as _i15;
import '../pages/registration_page.dart' as _i14;
import '../pages/root_page.dart' as _i1;
import '../pages/seven_eleven_recipt.dart' as _i11;
import '../pages/success_transaction_page.dart' as _i12;

class AppRouter extends _i17.RootStackRouter {
  AppRouter([_i18.GlobalKey<_i18.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    RootRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.RootPage(),
      );
    },
    CashInViaCardRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.CashInViaCardPage(),
      );
    },
    GrabBillRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.GrabBillPage(),
      );
    },
    HomeCreditBillRoute.name: (routeData) {
      final args = routeData.argsAs<HomeCreditBillRouteArgs>(
          orElse: () => const HomeCreditBillRouteArgs());
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.HomeCreditBillPage(key: args.key),
      );
    },
    HomeRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.LoginPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.MainPage(),
      );
    },
    OtpRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.OtpPage(),
      );
    },
    PayQRScanner.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.PayQRScanner(),
      );
    },
    QrPaymentResult.name: (routeData) {
      final args = routeData.argsAs<QrPaymentResultArgs>(
          orElse: () => const QrPaymentResultArgs());
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.QrPaymentResult(
          key: args.key,
          amount: args.amount,
        ),
      );
    },
    SevenElevenReciptRoute.name: (routeData) {
      final args = routeData.argsAs<SevenElevenReciptRouteArgs>(
          orElse: () => const SevenElevenReciptRouteArgs());
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.SevenElevenReciptPage(
          key: args.key,
          amount: args.amount,
        ),
      );
    },
    SuccessTransactionRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.SuccessTransactionPage(),
      );
    },
    CartRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.CartPage(),
      );
    },
    RegistrationRoute.name: (routeData) {
      final args = routeData.argsAs<RegistrationRouteArgs>(
          orElse: () => const RegistrationRouteArgs());
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i14.RegistrationPage(key: args.key),
      );
    },
    ReciptRoute.name: (routeData) {
      final args = routeData.argsAs<ReciptRouteArgs>();
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.ReciptPage(
          key: args.key,
          order: args.order,
        ),
      );
    },
    MenuRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.MenuPage(),
      );
    },
  };

  @override
  List<_i17.RouteConfig> get routes => [
        _i17.RouteConfig(
          RootRoute.name,
          path: '/',
        ),
        _i17.RouteConfig(
          CashInViaCardRoute.name,
          path: '/cash-in-via-card',
        ),
        _i17.RouteConfig(
          GrabBillRoute.name,
          path: '/grab-bill',
        ),
        _i17.RouteConfig(
          HomeCreditBillRoute.name,
          path: '/home-credit-bill',
        ),
        _i17.RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
        _i17.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i17.RouteConfig(
          MainRoute.name,
          path: '/main',
        ),
        _i17.RouteConfig(
          OtpRoute.name,
          path: '/otp',
        ),
        _i17.RouteConfig(
          PayQRScanner.name,
          path: '/pay-qr-scanner',
        ),
        _i17.RouteConfig(
          QrPaymentResult.name,
          path: '/qr-payment-result',
        ),
        _i17.RouteConfig(
          SevenElevenReciptRoute.name,
          path: '/seven-eleven-recipt',
        ),
        _i17.RouteConfig(
          SuccessTransactionRoute.name,
          path: '/success-transaction',
        ),
        _i17.RouteConfig(
          CartRoute.name,
          path: '/cart',
        ),
        _i17.RouteConfig(
          RegistrationRoute.name,
          path: '/registration',
        ),
        _i17.RouteConfig(
          ReciptRoute.name,
          path: '/recipt',
        ),
        _i17.RouteConfig(
          MenuRoute.name,
          path: '/menu',
        ),
      ];
}

/// generated route for
/// [_i1.RootPage]
class RootRoute extends _i17.PageRouteInfo<void> {
  const RootRoute()
      : super(
          RootRoute.name,
          path: '/',
        );

  static const String name = 'RootRoute';
}

/// generated route for
/// [_i2.CashInViaCardPage]
class CashInViaCardRoute extends _i17.PageRouteInfo<void> {
  const CashInViaCardRoute()
      : super(
          CashInViaCardRoute.name,
          path: '/cash-in-via-card',
        );

  static const String name = 'CashInViaCardRoute';
}

/// generated route for
/// [_i3.GrabBillPage]
class GrabBillRoute extends _i17.PageRouteInfo<void> {
  const GrabBillRoute()
      : super(
          GrabBillRoute.name,
          path: '/grab-bill',
        );

  static const String name = 'GrabBillRoute';
}

/// generated route for
/// [_i4.HomeCreditBillPage]
class HomeCreditBillRoute extends _i17.PageRouteInfo<HomeCreditBillRouteArgs> {
  HomeCreditBillRoute({_i18.Key? key})
      : super(
          HomeCreditBillRoute.name,
          path: '/home-credit-bill',
          args: HomeCreditBillRouteArgs(key: key),
        );

  static const String name = 'HomeCreditBillRoute';
}

class HomeCreditBillRouteArgs {
  const HomeCreditBillRouteArgs({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return 'HomeCreditBillRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i17.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i6.LoginPage]
class LoginRoute extends _i17.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i7.MainPage]
class MainRoute extends _i17.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '/main',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i8.OtpPage]
class OtpRoute extends _i17.PageRouteInfo<void> {
  const OtpRoute()
      : super(
          OtpRoute.name,
          path: '/otp',
        );

  static const String name = 'OtpRoute';
}

/// generated route for
/// [_i9.PayQRScanner]
class PayQRScanner extends _i17.PageRouteInfo<void> {
  const PayQRScanner()
      : super(
          PayQRScanner.name,
          path: '/pay-qr-scanner',
        );

  static const String name = 'PayQRScanner';
}

/// generated route for
/// [_i10.QrPaymentResult]
class QrPaymentResult extends _i17.PageRouteInfo<QrPaymentResultArgs> {
  QrPaymentResult({
    _i18.Key? key,
    double? amount,
  }) : super(
          QrPaymentResult.name,
          path: '/qr-payment-result',
          args: QrPaymentResultArgs(
            key: key,
            amount: amount,
          ),
        );

  static const String name = 'QrPaymentResult';
}

class QrPaymentResultArgs {
  const QrPaymentResultArgs({
    this.key,
    this.amount,
  });

  final _i18.Key? key;

  final double? amount;

  @override
  String toString() {
    return 'QrPaymentResultArgs{key: $key, amount: $amount}';
  }
}

/// generated route for
/// [_i11.SevenElevenReciptPage]
class SevenElevenReciptRoute
    extends _i17.PageRouteInfo<SevenElevenReciptRouteArgs> {
  SevenElevenReciptRoute({
    _i18.Key? key,
    double? amount,
  }) : super(
          SevenElevenReciptRoute.name,
          path: '/seven-eleven-recipt',
          args: SevenElevenReciptRouteArgs(
            key: key,
            amount: amount,
          ),
        );

  static const String name = 'SevenElevenReciptRoute';
}

class SevenElevenReciptRouteArgs {
  const SevenElevenReciptRouteArgs({
    this.key,
    this.amount,
  });

  final _i18.Key? key;

  final double? amount;

  @override
  String toString() {
    return 'SevenElevenReciptRouteArgs{key: $key, amount: $amount}';
  }
}

/// generated route for
/// [_i12.SuccessTransactionPage]
class SuccessTransactionRoute extends _i17.PageRouteInfo<void> {
  const SuccessTransactionRoute()
      : super(
          SuccessTransactionRoute.name,
          path: '/success-transaction',
        );

  static const String name = 'SuccessTransactionRoute';
}

/// generated route for
/// [_i13.CartPage]
class CartRoute extends _i17.PageRouteInfo<void> {
  const CartRoute()
      : super(
          CartRoute.name,
          path: '/cart',
        );

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i14.RegistrationPage]
class RegistrationRoute extends _i17.PageRouteInfo<RegistrationRouteArgs> {
  RegistrationRoute({_i18.Key? key})
      : super(
          RegistrationRoute.name,
          path: '/registration',
          args: RegistrationRouteArgs(key: key),
        );

  static const String name = 'RegistrationRoute';
}

class RegistrationRouteArgs {
  const RegistrationRouteArgs({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return 'RegistrationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i15.ReciptPage]
class ReciptRoute extends _i17.PageRouteInfo<ReciptRouteArgs> {
  ReciptRoute({
    _i18.Key? key,
    required _i19.OrderModel order,
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

  final _i18.Key? key;

  final _i19.OrderModel order;

  @override
  String toString() {
    return 'ReciptRouteArgs{key: $key, order: $order}';
  }
}

/// generated route for
/// [_i16.MenuPage]
class MenuRoute extends _i17.PageRouteInfo<void> {
  const MenuRoute()
      : super(
          MenuRoute.name,
          path: '/menu',
        );

  static const String name = 'MenuRoute';
}
