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
import 'package:auto_route/auto_route.dart' as _i23;
import 'package:flutter/material.dart' as _i24;

import '../pages/cart_page.dart' as _i19;
import '../pages/cash_in_page.dart' as _i2;
import '../pages/cash_in_via_card.dart' as _i3;
import '../pages/cash_in_via_seveneleven_page.dart' as _i4;
import '../pages/grab_bill_page.dart' as _i5;
import '../pages/home_credit_billpage.dart' as _i6;
import '../pages/home_page.dart' as _i7;
import '../pages/login_page.dart' as _i8;
import '../pages/main_page.dart' as _i9;
import '../pages/menu_page.dart' as _i22;
import '../pages/meralco_bill_page.dart' as _i10;
import '../pages/otp_page.dart' as _i11;
import '../pages/pay_bills_page.dart' as _i12;
import '../pages/pay_qr_scanner.dart' as _i13;
import '../pages/profile_page.dart' as _i14;
import '../pages/qr_payment_result_page.dart' as _i15;
import '../pages/recipt_page.dart' as _i21;
import '../pages/registration_page.dart' as _i20;
import '../pages/root_page.dart' as _i1;
import '../pages/seven_eleven_recipt.dart' as _i16;
import '../pages/success_transaction_page.dart' as _i17;
import '../pages/transaction_page.dart' as _i18;

class AppRouter extends _i23.RootStackRouter {
  AppRouter([_i24.GlobalKey<_i24.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i23.PageFactory> pagesMap = {
    RootRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.RootPage(),
      );
    },
    CashInRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.CashInPage(),
      );
    },
    CashInViaCardRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.CashInViaCardPage(),
      );
    },
    CashInViaSevenElevenRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.CashInViaSevenElevenPage(),
      );
    },
    GrabBillRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.GrabBillPage(),
      );
    },
    HomeCreditBillRoute.name: (routeData) {
      final args = routeData.argsAs<HomeCreditBillRouteArgs>(
          orElse: () => const HomeCreditBillRouteArgs());
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.HomeCreditBillPage(key: args.key),
      );
    },
    HomeRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.LoginPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.MainPage(),
      );
    },
    MeralcoBillRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.MeralcoBillPage(),
      );
    },
    OtpRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.OtpPage(),
      );
    },
    PayBillsRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.PayBillsPage(),
      );
    },
    PayQRScanner.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.PayQRScanner(),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i14.ProfilePage(
          key: args.key,
          onHome: args.onHome,
        ),
      );
    },
    QrPaymentResult.name: (routeData) {
      final args = routeData.argsAs<QrPaymentResultArgs>(
          orElse: () => const QrPaymentResultArgs());
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.QrPaymentResult(
          key: args.key,
          amount: args.amount,
        ),
      );
    },
    SevenElevenReciptRoute.name: (routeData) {
      final args = routeData.argsAs<SevenElevenReciptRouteArgs>(
          orElse: () => const SevenElevenReciptRouteArgs());
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i16.SevenElevenReciptPage(
          key: args.key,
          amount: args.amount,
        ),
      );
    },
    SuccessTransactionRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.SuccessTransactionPage(),
      );
    },
    TransactionRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.TransactionPage(),
      );
    },
    CartRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i19.CartPage(),
      );
    },
    RegistrationRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i20.RegistrationPage(),
      );
    },
    ReciptRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i21.ReciptPage(),
      );
    },
    MenuRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i22.MenuPage(),
      );
    },
  };

  @override
  List<_i23.RouteConfig> get routes => [
        _i23.RouteConfig(
          RootRoute.name,
          path: '/',
        ),
        _i23.RouteConfig(
          CashInRoute.name,
          path: '/cash-in',
        ),
        _i23.RouteConfig(
          CashInViaCardRoute.name,
          path: '/cash-in-via-card',
        ),
        _i23.RouteConfig(
          CashInViaSevenElevenRoute.name,
          path: '/cash-in-via-seven-eleven',
        ),
        _i23.RouteConfig(
          GrabBillRoute.name,
          path: '/grab-bill',
        ),
        _i23.RouteConfig(
          HomeCreditBillRoute.name,
          path: '/home-credit-bill',
        ),
        _i23.RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
        _i23.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i23.RouteConfig(
          MainRoute.name,
          path: '/main',
        ),
        _i23.RouteConfig(
          MeralcoBillRoute.name,
          path: '/meralco_bill',
        ),
        _i23.RouteConfig(
          OtpRoute.name,
          path: '/otp',
        ),
        _i23.RouteConfig(
          PayBillsRoute.name,
          path: '/pay-bills',
        ),
        _i23.RouteConfig(
          PayQRScanner.name,
          path: '/pay-qr-scanner',
        ),
        _i23.RouteConfig(
          ProfileRoute.name,
          path: '/profile',
        ),
        _i23.RouteConfig(
          QrPaymentResult.name,
          path: '/qr-payment-result',
        ),
        _i23.RouteConfig(
          SevenElevenReciptRoute.name,
          path: '/seven-eleven-recipt',
        ),
        _i23.RouteConfig(
          SuccessTransactionRoute.name,
          path: '/success-transaction',
        ),
        _i23.RouteConfig(
          TransactionRoute.name,
          path: '/transactions',
        ),
        _i23.RouteConfig(
          CartRoute.name,
          path: '/cart',
        ),
        _i23.RouteConfig(
          RegistrationRoute.name,
          path: '/registration',
        ),
        _i23.RouteConfig(
          ReciptRoute.name,
          path: '/recipt',
        ),
        _i23.RouteConfig(
          MenuRoute.name,
          path: '/menu',
        ),
      ];
}

/// generated route for
/// [_i1.RootPage]
class RootRoute extends _i23.PageRouteInfo<void> {
  const RootRoute()
      : super(
          RootRoute.name,
          path: '/',
        );

  static const String name = 'RootRoute';
}

/// generated route for
/// [_i2.CashInPage]
class CashInRoute extends _i23.PageRouteInfo<void> {
  const CashInRoute()
      : super(
          CashInRoute.name,
          path: '/cash-in',
        );

  static const String name = 'CashInRoute';
}

/// generated route for
/// [_i3.CashInViaCardPage]
class CashInViaCardRoute extends _i23.PageRouteInfo<void> {
  const CashInViaCardRoute()
      : super(
          CashInViaCardRoute.name,
          path: '/cash-in-via-card',
        );

  static const String name = 'CashInViaCardRoute';
}

/// generated route for
/// [_i4.CashInViaSevenElevenPage]
class CashInViaSevenElevenRoute extends _i23.PageRouteInfo<void> {
  const CashInViaSevenElevenRoute()
      : super(
          CashInViaSevenElevenRoute.name,
          path: '/cash-in-via-seven-eleven',
        );

  static const String name = 'CashInViaSevenElevenRoute';
}

/// generated route for
/// [_i5.GrabBillPage]
class GrabBillRoute extends _i23.PageRouteInfo<void> {
  const GrabBillRoute()
      : super(
          GrabBillRoute.name,
          path: '/grab-bill',
        );

  static const String name = 'GrabBillRoute';
}

/// generated route for
/// [_i6.HomeCreditBillPage]
class HomeCreditBillRoute extends _i23.PageRouteInfo<HomeCreditBillRouteArgs> {
  HomeCreditBillRoute({_i24.Key? key})
      : super(
          HomeCreditBillRoute.name,
          path: '/home-credit-bill',
          args: HomeCreditBillRouteArgs(key: key),
        );

  static const String name = 'HomeCreditBillRoute';
}

class HomeCreditBillRouteArgs {
  const HomeCreditBillRouteArgs({this.key});

  final _i24.Key? key;

  @override
  String toString() {
    return 'HomeCreditBillRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.HomePage]
class HomeRoute extends _i23.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i8.LoginPage]
class LoginRoute extends _i23.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i9.MainPage]
class MainRoute extends _i23.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '/main',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i10.MeralcoBillPage]
class MeralcoBillRoute extends _i23.PageRouteInfo<void> {
  const MeralcoBillRoute()
      : super(
          MeralcoBillRoute.name,
          path: '/meralco_bill',
        );

  static const String name = 'MeralcoBillRoute';
}

/// generated route for
/// [_i11.OtpPage]
class OtpRoute extends _i23.PageRouteInfo<void> {
  const OtpRoute()
      : super(
          OtpRoute.name,
          path: '/otp',
        );

  static const String name = 'OtpRoute';
}

/// generated route for
/// [_i12.PayBillsPage]
class PayBillsRoute extends _i23.PageRouteInfo<void> {
  const PayBillsRoute()
      : super(
          PayBillsRoute.name,
          path: '/pay-bills',
        );

  static const String name = 'PayBillsRoute';
}

/// generated route for
/// [_i13.PayQRScanner]
class PayQRScanner extends _i23.PageRouteInfo<void> {
  const PayQRScanner()
      : super(
          PayQRScanner.name,
          path: '/pay-qr-scanner',
        );

  static const String name = 'PayQRScanner';
}

/// generated route for
/// [_i14.ProfilePage]
class ProfileRoute extends _i23.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i24.Key? key,
    dynamic onHome,
  }) : super(
          ProfileRoute.name,
          path: '/profile',
          args: ProfileRouteArgs(
            key: key,
            onHome: onHome,
          ),
        );

  static const String name = 'ProfileRoute';
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    this.onHome,
  });

  final _i24.Key? key;

  final dynamic onHome;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, onHome: $onHome}';
  }
}

/// generated route for
/// [_i15.QrPaymentResult]
class QrPaymentResult extends _i23.PageRouteInfo<QrPaymentResultArgs> {
  QrPaymentResult({
    _i24.Key? key,
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

  final _i24.Key? key;

  final double? amount;

  @override
  String toString() {
    return 'QrPaymentResultArgs{key: $key, amount: $amount}';
  }
}

/// generated route for
/// [_i16.SevenElevenReciptPage]
class SevenElevenReciptRoute
    extends _i23.PageRouteInfo<SevenElevenReciptRouteArgs> {
  SevenElevenReciptRoute({
    _i24.Key? key,
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

  final _i24.Key? key;

  final double? amount;

  @override
  String toString() {
    return 'SevenElevenReciptRouteArgs{key: $key, amount: $amount}';
  }
}

/// generated route for
/// [_i17.SuccessTransactionPage]
class SuccessTransactionRoute extends _i23.PageRouteInfo<void> {
  const SuccessTransactionRoute()
      : super(
          SuccessTransactionRoute.name,
          path: '/success-transaction',
        );

  static const String name = 'SuccessTransactionRoute';
}

/// generated route for
/// [_i18.TransactionPage]
class TransactionRoute extends _i23.PageRouteInfo<void> {
  const TransactionRoute()
      : super(
          TransactionRoute.name,
          path: '/transactions',
        );

  static const String name = 'TransactionRoute';
}

/// generated route for
/// [_i19.CartPage]
class CartRoute extends _i23.PageRouteInfo<void> {
  const CartRoute()
      : super(
          CartRoute.name,
          path: '/cart',
        );

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i20.RegistrationPage]
class RegistrationRoute extends _i23.PageRouteInfo<void> {
  const RegistrationRoute()
      : super(
          RegistrationRoute.name,
          path: '/registration',
        );

  static const String name = 'RegistrationRoute';
}

/// generated route for
/// [_i21.ReciptPage]
class ReciptRoute extends _i23.PageRouteInfo<void> {
  const ReciptRoute()
      : super(
          ReciptRoute.name,
          path: '/recipt',
        );

  static const String name = 'ReciptRoute';
}

/// generated route for
/// [_i22.MenuPage]
class MenuRoute extends _i23.PageRouteInfo<void> {
  const MenuRoute()
      : super(
          MenuRoute.name,
          path: '/menu',
        );

  static const String name = 'MenuRoute';
}
