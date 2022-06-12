import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class NavigationService {
  /// Creating the first instance
  static final NavigationService _instance = NavigationService._internal();
  NavigationService._internal();

  /// With this factory setup, any time  NavigationService() is called
  /// within the appication _instance will be returned and not a new instance
  factory NavigationService() => _instance;

  ///This would allow the app monitor the current screen state during navigation.
  ///
  ///This is where the singleton setup we did
  ///would help as the state is internally maintained
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  /// For navigating back to the previous screen
  dynamic goBack([dynamic popValue]) {
    return navigationKey.currentState.pop(popValue);
  }

  BuildContext getContext() => navigationKey.currentState.context;

  /// This allows you to naviagte to the next screen by passing the screen widget
  Future<dynamic> navigateToScreen({Widget page, PageTransitionType type}) async => navigationKey.currentState.push(
        PageTransition(child: page, type: type),
      );

  /// This allows you to naviagte to the next screen and
  /// also replace the current screen by passing the screen widget
  Future<dynamic> replaceScreen({Widget page, PageTransitionType type}) async => navigationKey.currentState.pushReplacement(
        PageTransition(child: page, type: type),
      );

  /// Allows you to pop to the first screen to when the app first launched.
  /// This is useful when you need to log out a user,
  /// and also remove all the screens on the navigation stack.
  /// I find this very useful
  void popToFirst() => navigationKey.currentState.popUntil((route) => route.isFirst);
}
