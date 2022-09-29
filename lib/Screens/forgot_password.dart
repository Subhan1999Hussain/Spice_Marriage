import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spice_marriage/Screens/otp_verification.dart';
import 'package:spice_marriage/Screens/splash.dart';
import 'package:spice_marriage/Utils/validation.dart';
import 'package:spice_marriage/Widget/background.dart';
import '../Utils/app_colors.dart';
import '../Utils/app_navigation.dart';
import '../Utils/app_route_name.dart';
import '../Utils/app_strings.dart';
import '../Widget/app_logo.dart';
import '../Widget/custom_button.dart';
import '../Widget/custom_text.dart';
import '../Widget/custom_text_field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Widget/toast.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? user_id;
  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      child: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                const AppLogo(),
                const CustomText(
                  maintext: AppStrings.FORGOT_PASSWORD_TEXT,
                  underline: true,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                CustomTextField(
                  fieldcontroller: emailController,
                  fieldvalidator: (val) =>
                      Validation.EmailValidation(val: emailController.text),
                  texthint: AppStrings.ENTER_EMAIL_FIELD_TEXT,
                ),
                spacearea(),
                CustomButton(
                  text: AppStrings.GET_CODE_BUTTON_TEXT,
                  color: AppColors.RED,
                  textcolor: AppColors.WHITE,
                  onClicked: () {
                    if (_formKey.currentState!.validate()) {
                      print('Filed Required');
                      // setState(() {
                      //   // _isLoading = true;
                      // });
                      forgotpass(
                        emailController.text,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget spacearea() {
    return SizedBox(height: MediaQuery.of(context).size.height * 0.015);
  }

  forgotpass(String email) async {
    Map data = {
      'email': email,
    };
    var jsondata = null;
    var url =
        Uri.parse("http://server.appsstaging.com:3079/api/forgotPassword");
    var response = await http.post(
      url,
      body: data,
    );
    if (response.statusCode == 200) {
      print('Code Send Sucessfull');
      jsondata = jsonDecode(response.body);

      var code = jsondata['data']['code'].toString();
      user_id = jsondata['data']['user_id'].toString();

      print('__________________________');

      print(code);
      print(user_id);

      print('__________________________');

      Toast_Message(code);
      // ignore: use_build_context_synchronously
      AppNavigation.navigateTo(
          context, AppRouteName.OTP_VERIFICATION_SCREEN_ROUTE,
          arguments: user_id);
    } else {
      print('ERROR');
      print(response.body);
    }
  }
}
