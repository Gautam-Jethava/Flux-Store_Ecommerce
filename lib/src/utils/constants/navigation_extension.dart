import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  // Push methods
  void navigateTo(Widget page, {RouteSettings? settings}) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => page, settings: settings));
  }

  void navigateToNamed(String routeName, {Object? arguments}) {
    Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  Future<T?> navigateToForResult<T extends Object?>(Route<T> route) {
    return Navigator.push(this, route);
  }

  Future<T?> navigateToNamedForResult<T extends Object?>(String routeName, {Object? arguments}) {
    return Navigator.pushNamed<T>(this, routeName, arguments: arguments);
  }

  // Replace methods
  void navigateAndReplace(Widget page, {RouteSettings? settings}) {
    Navigator.pushReplacement(this, MaterialPageRoute(builder: (context) => page, settings: settings));
  }

  void navigateAndReplaceNamed(String routeName, {Object? arguments}) {
    Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  }

// Remove and push methods
  void navigateAndRemoveUntil(Widget page, {RouteSettings? settings}) {
    Navigator.pushAndRemoveUntil(
        this, MaterialPageRoute(builder: (context) => page, settings: settings), (route) => false);
  }

  void navigateAndRemoveUntilNamed(String routeName, {Object? arguments}) {
    Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false, arguments: arguments);
  }

// Pop methods
  void pop({Object? result}) {
    Navigator.pop(this, result);
  }

  void popUntil(RoutePredicate predicate) {
    Navigator.popUntil(this, predicate);
  }

  void maybePop() {
    Navigator.maybePop(this);
  }

  bool canPop() {
    return Navigator.canPop(this);
  }
}
