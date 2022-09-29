import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:spice_marriage/Utils/app_colors.dart';
import 'package:spice_marriage/Utils/app_navigation.dart';
import 'package:spice_marriage/Utils/app_route_name.dart';
import 'package:spice_marriage/Widget/app_logo.dart';
import 'package:spice_marriage/Widget/background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    Timer(
      const Duration(seconds: 5),
      () => checkLoginStatus(),

    );
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.4,
        ),
        child: Column(
          children: const [
            AppLogo(),
            SpinKitFadingCircle(
              color: AppColors.RED,
            ),
          ],
        ),
      ),
    );
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {

      // ignore: use_build_context_synchronously
      AppNavigation.navigateTo(context, AppRouteName.PRE_LOGIN_SCREEN_ROUTE);
    } else {
      
     // ignore: use_build_context_synchronously
     AppNavigation.navigateTo(context, AppRouteName.SWIPE_FOR_SELECTION_SCREEN_ROUTE);
    }
  }
}
