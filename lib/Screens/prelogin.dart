import 'package:flutter/material.dart';
import 'package:spice_marriage/Utils/asset_paths.dart';
import 'package:spice_marriage/Utils/app_colors.dart';
import 'package:spice_marriage/Widget/app_logo.dart';
import 'package:spice_marriage/Widget/background.dart';
import 'package:spice_marriage/Widget/custom_text.dart';
import '../Utils/app_navigation.dart';
import '../Utils/app_route_name.dart';
import '../Utils/app_strings.dart';
import '../Widget/custom_button_withicon.dart';

class PreLogin extends StatefulWidget {
  const PreLogin({Key? key}) : super(key: key);

  @override
  State<PreLogin> createState() => _PreLoginState();
}

class _PreLoginState extends State<PreLogin> {
  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          const AppLogo(),
          const CustomText(
            maintext: AppStrings.PRELOGIN_TEXT,
            underline: true,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          CustomButtonWithIcon(
            text: AppStrings.SIGNIN_WITH_EMAIL_BUTTON_TEXT,
            btnimg: AssetPaths.EMAIL_ICON,
            color: AppColors.WHITE,
            textcolor: AppColors.BLACK,
            onclick: () {
               AppNavigation.navigateTo(context, AppRouteName.LOGIN_SCREEN_ROUTE);
            },
          ),
          spacearea(),
          const CustomButtonWithIcon(
            text: AppStrings.SIGNIN_WITH_FACEBOOK_BUTTON_TEXT,
            btnimg: AssetPaths.FACEBOOK_ICON,
            color: AppColors.BLUE,
            textcolor: AppColors.WHITE,
          ),
          spacearea(),
          const CustomButtonWithIcon(
            text: AppStrings.SIGNIN_WITH_GOOGLE_BUTTON_TEXT,
            btnimg: AssetPaths.GOOGLE_ICON,
            color: AppColors.LIGHTRED,
            textcolor: AppColors.WHITE,
          ),
          spacearea(),
          const CustomButtonWithIcon(
            text: AppStrings.SIGNIN_WITH_APPLE_BUTTON_TEXT,
            btnimg: AssetPaths.APPLE_ICON,
            color: AppColors.BLACK,
            textcolor: AppColors.WHITE,
          ),
        ],
      ),
    );
  }

  Widget spacearea() {
    return SizedBox(height: MediaQuery.of(context).size.height * 0.015);
  }
}
