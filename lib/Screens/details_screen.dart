import 'package:flutter/material.dart';
import 'package:spice_marriage/Utils/app_strings.dart';
import 'package:spice_marriage/Utils/asset_paths.dart';
import 'package:spice_marriage/Utils/app_colors.dart';
import 'package:spice_marriage/Widget/custom_appbar.dart';
import 'package:spice_marriage/Widget/custom_button.dart';
import 'package:spice_marriage/Widget/detail_screen_container.dart';
import '../Widget/detail_screen_text.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              AssetPaths.BACKGROUND_SECONDARY_IMAGE,
            ),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: AppColors.TRANSPARENT,
        body: Stack(
          alignment: Alignment.center,
          children: [
            const CustomAppBar(
              isLeading: true,
              title: AppStrings.DETAILS_TEXT,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.18,
              child: DetailScreenContainer(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.11,
                    bottom: MediaQuery.of(context).size.height * 0.03,
                  ),
                  child: Column(
                    children: const [
                      Text(
                        AppStrings.ID_NAME_TEXT,
                        style: TextStyle(
                          fontSize: 37.0,
                        ),
                      ),
                      Text(
                        AppStrings.ID_EMAIL_TEXT,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: AppColors.GREYS,
                        ),
                      ),
                      DetailScreenText(
                        maintext: AppStrings.NAME_FIELD_TEXT,
                        normaltext: AppStrings.ID_NAME_TEXT,
                      ),
                      DetailScreenText(
                        maintext: AppStrings.EMAIL_FIELD_TEXT,
                        normaltext: AppStrings.ID_EMAIL_TEXT,
                      ),
                      DetailScreenText(
                        maintext: AppStrings.PASSWORD_FIELD_TEXT,
                        normaltext: AppStrings.ID_PASSWORD_TEXT,
                      ),
                      CustomButton(
                        text: AppStrings.SAVE_BUTTON_TEXT,
                        color: AppColors.BLACK,
                        textcolor: AppColors.WHITE,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.13,
              child: Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      AssetPaths.AVATAR_IMAGE,
                    ),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(150.0)),
                  border: Border.all(
                    color: AppColors.WHITE,
                    width: MediaQuery.of(context).size.width * 0.015,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
