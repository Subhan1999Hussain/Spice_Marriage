import 'package:flutter/material.dart';
import 'package:spice_marriage/Utils/asset_paths.dart';
import 'package:spice_marriage/Utils/app_colors.dart';
import 'package:spice_marriage/Widget/background.dart';
import 'package:spice_marriage/Widget/custom_appbar.dart';
import 'package:spice_marriage/Widget/custom_button.dart';
import 'package:spice_marriage/Widget/custom_game_setting_container.dart';
import 'package:spice_marriage/Widget/custom_text.dart';
import 'package:spice_marriage/Widget/spice_level.dart';

import '../Utils/app_strings.dart';

class GameSettings extends StatefulWidget {
  const GameSettings({Key? key}) : super(key: key);

  @override
  State<GameSettings> createState() => _GameSettingsState();
}

class _GameSettingsState extends State<GameSettings> {
  final List<String> values = [
    AppStrings.WIFE_TEXT,
    AppStrings.HUSBAND_TEXT,
    AppStrings.BOTH_TEXT
  ];

  String option = AppStrings.WIFE_TEXT;
  String? selectedoption;
  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(
              isLeading: true,
              title: AppStrings.GAME_SETTINGS_TEXT,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            CustomContainer(
              headtext: AppStrings.YOUR_ACTIVITY_TEXT,
              child: Padding(
                padding: EdgeInsets.all(
                  MediaQuery.of(context).size.height * 0.04,
                ),
                child: const Text(
                  AppStrings.LOREM_TEXT,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: AppStrings.NUNITO_FONT,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            CustomContainer(
              headtext: AppStrings.SPICE_LEVEL_TEXT,
              child: Padding(
                padding: EdgeInsets.all(
                  MediaQuery.of(context).size.height * 0.02,
                ),
                child: Column(
                  children: [
                    SpiceLevel(
                      start_image: AssetPaths.SPICE_1_IMAGE,
                      width: MediaQuery.of(context).size.width * 0.07,
                      text: AppStrings.MILD_TEXT,
                      last_image: AssetPaths.SWITCH_ON_IMAGE,
                    ),
                    SpiceLevel(
                      start_image: AssetPaths.SPICE_2_IMAGE,
                      width: MediaQuery.of(context).size.width * 0.09,
                      text: AppStrings.MEDIUM_TEXT,
                      last_image: AssetPaths.SWITCH_OFF_IMAGE,
                    ),
                    SpiceLevel(
                      start_image: AssetPaths.SPICE_3_IMAGE,
                      width: MediaQuery.of(context).size.width * 0.12,
                      text: AppStrings.HOT_TEXT,
                      last_image: AssetPaths.SWITCH_OFF_IMAGE,
                    ),
                    SpiceLevel(
                      start_image: AssetPaths.SPICE_4_IMAGE,
                      width: MediaQuery.of(context).size.width * 0.15,
                      text: AppStrings.EXTRA_TEXT,
                      last_image: AssetPaths.SWITCH_OFF_IMAGE,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    const Text(
                      AppStrings.WHO_PERFORMS_THIS_ACTIVITY_TEXT,
                      style: TextStyle(
                        fontSize: 30.0,
                        color: AppColors.BLACK,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.03,
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.07,
                      ),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.BLACK,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.02,
                            right: MediaQuery.of(context).size.width * 0.02,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: option,
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                              ),
                              elevation: 16,
                              style: const TextStyle(
                                color: AppColors.BLACK,
                              ),
                              onChanged: (String? newItem) {
                                setState(() {
                                  option = newItem!;
                                });
                              },
                              items: <String>[
                                AppStrings.WIFE_TEXT,
                                AppStrings.HUSBAND_TEXT,
                                AppStrings.BOTH_TEXT,
                              ].map<DropdownMenuItem<String>>((String item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 25.0,
                                      fontFamily: AppStrings.MYLOVE_FONT,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.05,
                left: MediaQuery.of(context).size.width * 0.15,
                right: MediaQuery.of(context).size.width * 0.15,
                bottom: MediaQuery.of(context).size.width * 0.01,
              ),
              child: Image.asset(AssetPaths.CLOCK_IMAGE),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CustomText(
                  maintext: AppStrings.MINUTS_TEXT,
                ),
                CustomText(
                  maintext: AppStrings.SECONDS_TEXT,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            const CustomButton(
              text: AppStrings.CONTINUE_BUTTON_TEXT,
              color: AppColors.RED,
              textcolor: AppColors.WHITE,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
