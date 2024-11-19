import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  // Push methods
  void screenNavigateTo(Widget page, {RouteSettings? settings}) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => page, settings: settings));
  }

  void screenNavigateToNamed(String routeName, {Object? arguments}) {
    Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  Future<T?> screenNavigateToForResult<T extends Object?>(Route<T> route) {
    return Navigator.push(this, route);
  }

  Future<T?> screenNavigateToNamedForResult<T extends Object?>(String routeName, {Object? arguments}) {
    return Navigator.pushNamed<T>(this, routeName, arguments: arguments);
  }

  // Replace methods
  void screenNavigateAndReplace(Widget page, {RouteSettings? settings}) {
    Navigator.pushReplacement(this, MaterialPageRoute(builder: (context) => page, settings: settings));
  }

  void screenNavigateAndReplaceNamed(String routeName, {Object? arguments}) {
    Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  }

// Remove and push methods
  void screenNavigateAndRemoveUntil(Widget page, {RouteSettings? settings}) {
    Navigator.pushAndRemoveUntil(
        this, MaterialPageRoute(builder: (context) => page, settings: settings), (route) => false);
  }

  void screenNavigateAndRemoveUntilNamed(String routeName, {Object? arguments}) {
    Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false, arguments: arguments);
  }

// Pop methods
  void screenPop({Object? result}) {
    Navigator.pop(this, result);
  }

  void screenPopUntil(RoutePredicate predicate) {
    Navigator.popUntil(this, predicate);
  }

  void screenMaybePop() {
    Navigator.maybePop(this);
  }

  bool screenCanPop() {
    return Navigator.canPop(this);
  }
}
