import 'package:flutter/material.dart';
import 'package:spice_marriage/Screens/details_screen.dart';
import 'package:spice_marriage/Screens/forgot_password.dart';
import 'package:spice_marriage/Screens/game_settings.dart';
import 'package:spice_marriage/Screens/login.dart';
import 'package:spice_marriage/Screens/otp_verification.dart';
import 'package:spice_marriage/Screens/prelogin.dart';
import 'package:spice_marriage/Screens/reset_password.dart';
import 'package:spice_marriage/Screens/signup.dart';
import 'package:spice_marriage/Screens/splash.dart';
import 'package:spice_marriage/Screens/swipefor_selection.dart';
import 'package:spice_marriage/Utils/app_route_name.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (BuildContext context) {
        switch (routeSettings.name) {
          case AppRouteName.SPLASH_SCREEN_ROUTE:
            return const SplashScreen();
          case AppRouteName.PRE_LOGIN_SCREEN_ROUTE:
            return const PreLogin();
          case AppRouteName.LOGIN_SCREEN_ROUTE:
            return const Login();
          case AppRouteName.SIGNUP_SCREEN_ROUTE:
            return SignUp();
          case AppRouteName.FORGOT_PASSWORD__SCREEN_ROUTE:
            return const ForgotPassword();

          case AppRouteName.OTP_VERIFICATION_SCREEN_ROUTE:
            final args = routeSettings.arguments as String;
            return OtpVerification(user_id: args);

          case AppRouteName.RESET_PASSWORD_SCREEN_ROUTE:
            final args = routeSettings.arguments as String;
            return ResetPassword(user_id: args);
          case AppRouteName.SWIPE_FOR_SELECTION_SCREEN_ROUTE:
            return const SwipeForSelection();
          case AppRouteName.GAME_SETTING_SCREEN_ROUTE:
            return const GameSettings();
          case AppRouteName.DETAILS_SCREEN_ROUTE:
            return const DetailsScreen();
          default:
            return Container();
        }
      },
    );
  }
}
