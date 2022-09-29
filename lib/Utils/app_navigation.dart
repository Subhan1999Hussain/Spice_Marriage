import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppNavigation {
  static void navigateToRemoveingAll(context, String routeName,
      {Object? arguments}) async {
    Navigator.pushNamedAndRemoveUntil(
        context, routeName, (Route<dynamic> route) => false,
        arguments: arguments);
  }

  static void navigateTo(context, String routeName, {Object? arguments}) async {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static void navigateReplacment(context, String routeName,
      {Object? arguments}) async {
    Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
  }

  static void navigatorPop(BuildContext context) {
    Navigator.pop(context);
  }

  static void navigateCloseDialog(BuildContext context) async {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
