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
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/material.dart' as _i20;

import '../pages/cash_in_page.dart' as _i2;
import '../pages/cash_in_via_card.dart' as _i3;
import '../pages/cash_in_via_seveneleven_page.dart' as _i4;
import '../pages/grab_bill_page.dart' as _i5;
import '../pages/home_credit_billpage.dart' as _i6;
import '../pages/home_page.dart' as _i7;
import '../pages/login_page.dart' as _i8;
import '../pages/main_page.dart' as _i9;
import '../pages/meralco_bill_page.dart' as _i10;
import '../pages/otp_page.dart' as _i11;
import '../pages/pay_bills_page.dart' as _i12;
import '../pages/pay_qr_scanner.dart' as _i13;
import '../pages/profile_page.dart' as _i14;
import '../pages/qr_payment_result_page.dart' as _i15;
import '../pages/root_page.dart' as _i1;
import '../pages/seven_eleven_recipt.dart' as _i16;
import '../pages/success_transaction_page.dart' as _i17;
import '../pages/transaction_page.dart' as _i18;

class AppRouter extends _i19.RootStackRouter {
  AppRouter([_i20.GlobalKey<_i20.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    RootRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.RootPage(),
      );
    },
    CashInRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.CashInPage(),
      );
    },
    CashInViaCardRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.CashInViaCardPage(),
      );
    },
    CashInViaSevenElevenRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.CashInViaSevenElevenPage(),
      );
    },
    GrabBillRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.GrabBillPage(),
      );
    },
    HomeCreditBillRoute.name: (routeData) {
      final args = routeData.argsAs<HomeCreditBillRouteArgs>(
          orElse: () => const HomeCreditBillRouteArgs());
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.HomeCreditBillPage(key: args.key),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.HomePage(
          key: args.key,
          onProfile: args.onProfile,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.LoginPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.MainPage(),
      );
    },
    MeralcoBillRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.MeralcoBillPage(),
      );
    },
    OtpRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.OtpPage(),
      );
    },
    PayBillsRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.PayBillsPage(),
      );
    },
    PayQRScanner.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.PayQRScanner(),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
      return _i19.MaterialPageX<dynamic>(
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
      return _i19.MaterialPageX<dynamic>(
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
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i16.SevenElevenReciptPage(
          key: args.key,
          amount: args.amount,
        ),
      );
    },
    SuccessTransactionRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.SuccessTransactionPage(),
      );
    },
    TransactionRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.TransactionPage(),
      );
    },
  };

  @override
  List<_i19.RouteConfig> get routes => [
        _i19.RouteConfig(
          RootRoute.name,
          path: '/',
        ),
        _i19.RouteConfig(
          CashInRoute.name,
          path: '/cash-in',
        ),
        _i19.RouteConfig(
          CashInViaCardRoute.name,
          path: '/cash-in-via-card',
        ),
        _i19.RouteConfig(
          CashInViaSevenElevenRoute.name,
          path: '/cash-in-via-seven-eleven',
        ),
        _i19.RouteConfig(
          GrabBillRoute.name,
          path: '/grab-bill',
        ),
        _i19.RouteConfig(
          HomeCreditBillRoute.name,
          path: '/home-credit-bill',
        ),
        _i19.RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
        _i19.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i19.RouteConfig(
          MainRoute.name,
          path: '/main',
        ),
        _i19.RouteConfig(
          MeralcoBillRoute.name,
          path: '/meralco_bill',
        ),
        _i19.RouteConfig(
          OtpRoute.name,
          path: '/otp',
        ),
        _i19.RouteConfig(
          PayBillsRoute.name,
          path: '/pay-bills',
        ),
        _i19.RouteConfig(
          PayQRScanner.name,
          path: '/pay-qr-scanner',
        ),
        _i19.RouteConfig(
          ProfileRoute.name,
          path: '/profile',
        ),
        _i19.RouteConfig(
          QrPaymentResult.name,
          path: '/qr-payment-result',
        ),
        _i19.RouteConfig(
          SevenElevenReciptRoute.name,
          path: '/seven-eleven-recipt',
        ),
        _i19.RouteConfig(
          SuccessTransactionRoute.name,
          path: '/success-transaction',
        ),
        _i19.RouteConfig(
          TransactionRoute.name,
          path: '/transactions',
        ),
      ];
}

/// generated route for
/// [_i1.RootPage]
class RootRoute extends _i19.PageRouteInfo<void> {
  const RootRoute()
      : super(
          RootRoute.name,
          path: '/',
        );

  static const String name = 'RootRoute';
}

/// generated route for
/// [_i2.CashInPage]
class CashInRoute extends _i19.PageRouteInfo<void> {
  const CashInRoute()
      : super(
          CashInRoute.name,
          path: '/cash-in',
        );

  static const String name = 'CashInRoute';
}

/// generated route for
/// [_i3.CashInViaCardPage]
class CashInViaCardRoute extends _i19.PageRouteInfo<void> {
  const CashInViaCardRoute()
      : super(
          CashInViaCardRoute.name,
          path: '/cash-in-via-card',
        );

  static const String name = 'CashInViaCardRoute';
}

/// generated route for
/// [_i4.CashInViaSevenElevenPage]
class CashInViaSevenElevenRoute extends _i19.PageRouteInfo<void> {
  const CashInViaSevenElevenRoute()
      : super(
          CashInViaSevenElevenRoute.name,
          path: '/cash-in-via-seven-eleven',
        );

  static const String name = 'CashInViaSevenElevenRoute';
}

/// generated route for
/// [_i5.GrabBillPage]
class GrabBillRoute extends _i19.PageRouteInfo<void> {
  const GrabBillRoute()
      : super(
          GrabBillRoute.name,
          path: '/grab-bill',
        );

  static const String name = 'GrabBillRoute';
}

/// generated route for
/// [_i6.HomeCreditBillPage]
class HomeCreditBillRoute extends _i19.PageRouteInfo<HomeCreditBillRouteArgs> {
  HomeCreditBillRoute({_i20.Key? key})
      : super(
          HomeCreditBillRoute.name,
          path: '/home-credit-bill',
          args: HomeCreditBillRouteArgs(key: key),
        );

  static const String name = 'HomeCreditBillRoute';
}

class HomeCreditBillRouteArgs {
  const HomeCreditBillRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'HomeCreditBillRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.HomePage]
class HomeRoute extends _i19.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i20.Key? key,
    dynamic onProfile,
  }) : super(
          HomeRoute.name,
          path: '/home',
          args: HomeRouteArgs(
            key: key,
            onProfile: onProfile,
          ),
        );

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    this.onProfile,
  });

  final _i20.Key? key;

  final dynamic onProfile;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, onProfile: $onProfile}';
  }
}

/// generated route for
/// [_i8.LoginPage]
class LoginRoute extends _i19.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i9.MainPage]
class MainRoute extends _i19.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '/main',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i10.MeralcoBillPage]
class MeralcoBillRoute extends _i19.PageRouteInfo<void> {
  const MeralcoBillRoute()
      : super(
          MeralcoBillRoute.name,
          path: '/meralco_bill',
        );

  static const String name = 'MeralcoBillRoute';
}

/// generated route for
/// [_i11.OtpPage]
class OtpRoute extends _i19.PageRouteInfo<void> {
  const OtpRoute()
      : super(
          OtpRoute.name,
          path: '/otp',
        );

  static const String name = 'OtpRoute';
}

/// generated route for
/// [_i12.PayBillsPage]
class PayBillsRoute extends _i19.PageRouteInfo<void> {
  const PayBillsRoute()
      : super(
          PayBillsRoute.name,
          path: '/pay-bills',
        );

  static const String name = 'PayBillsRoute';
}

/// generated route for
/// [_i13.PayQRScanner]
class PayQRScanner extends _i19.PageRouteInfo<void> {
  const PayQRScanner()
      : super(
          PayQRScanner.name,
          path: '/pay-qr-scanner',
        );

  static const String name = 'PayQRScanner';
}

/// generated route for
/// [_i14.ProfilePage]
class ProfileRoute extends _i19.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i20.Key? key,
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

  final _i20.Key? key;

  final dynamic onHome;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, onHome: $onHome}';
  }
}

/// generated route for
/// [_i15.QrPaymentResult]
class QrPaymentResult extends _i19.PageRouteInfo<QrPaymentResultArgs> {
  QrPaymentResult({
    _i20.Key? key,
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

  final _i20.Key? key;

  final double? amount;

  @override
  String toString() {
    return 'QrPaymentResultArgs{key: $key, amount: $amount}';
  }
}

/// generated route for
/// [_i16.SevenElevenReciptPage]
class SevenElevenReciptRoute
    extends _i19.PageRouteInfo<SevenElevenReciptRouteArgs> {
  SevenElevenReciptRoute({
    _i20.Key? key,
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

  final _i20.Key? key;

  final double? amount;

  @override
  String toString() {
    return 'SevenElevenReciptRouteArgs{key: $key, amount: $amount}';
  }
}

/// generated route for
/// [_i17.SuccessTransactionPage]
class SuccessTransactionRoute extends _i19.PageRouteInfo<void> {
  const SuccessTransactionRoute()
      : super(
          SuccessTransactionRoute.name,
          path: '/success-transaction',
        );

  static const String name = 'SuccessTransactionRoute';
}

/// generated route for
/// [_i18.TransactionPage]
class TransactionRoute extends _i19.PageRouteInfo<void> {
  const TransactionRoute()
      : super(
          TransactionRoute.name,
          path: '/transactions',
        );

  static const String name = 'TransactionRoute';
}
