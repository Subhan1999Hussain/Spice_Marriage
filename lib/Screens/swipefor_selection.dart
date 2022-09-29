import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spice_marriage/Utils/app_colors.dart';
import 'package:spice_marriage/Widget/app_logo.dart';
import 'package:spice_marriage/Widget/background.dart';
import 'package:spice_marriage/Widget/custom_appbar.dart';
import 'package:spice_marriage/Widget/custom_button.dart';
import 'package:spice_marriage/Widget/custom_text.dart';
import '../Utils/app_navigation.dart';
import '../Utils/app_route_name.dart';
import '../Utils/app_strings.dart';
import '../Widget/custom_card_container.dart';

class SwipeForSelection extends StatefulWidget {
  const SwipeForSelection({Key? key}) : super(key: key);

  @override
  State<SwipeForSelection> createState() => _SwipeForSelectionState();
}

class _SwipeForSelectionState extends State<SwipeForSelection> {
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // const CustomAppBar(
            //   isLeading: true,
            // ),
            SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
            const AppLogo(),
            const CustomText(
              maintext: AppStrings.SWIPE_FOR_SELECTION_TEXT,
              underline: true,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomCardContainer(
                  onclick: () {
                    AppNavigation.navigateTo(
          context, AppRouteName.GAME_SETTING_SCREEN_ROUTE);
                  },
                  backgroundcolor: AppColors.RED,
                  text: AppStrings.STANDARD_TEXT,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
                CustomCardContainer(
                  onclick: () {
                    AppNavigation.navigateTo(
          context, AppRouteName.DETAILS_SCREEN_ROUTE);
                  },
                  backgroundcolor: AppColors.BLACK,
                  text: AppStrings.THEMED_TEXT,
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            CustomButton(
                text: AppStrings.LOGOUT_BUTTON_TEXT,
                color: AppColors.RED,
                textcolor: AppColors.WHITE,
                onClicked: () async {
                  sharedPreferences = await SharedPreferences.getInstance();
                  print(sharedPreferences.getString("token"));
                  sharedPreferences.remove('token');

                  // ignore: use_build_context_synchronously
                 AppNavigation.navigateTo(
          context, AppRouteName.PRE_LOGIN_SCREEN_ROUTE);
                }),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
