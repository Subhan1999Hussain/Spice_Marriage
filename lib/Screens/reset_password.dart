import 'package:flutter/material.dart';
import 'package:spice_marriage/Utils/app_colors.dart';
import 'package:spice_marriage/Utils/app_strings.dart';
import 'package:spice_marriage/Utils/validation.dart';
import 'package:spice_marriage/Widget/app_logo.dart';
import 'package:spice_marriage/Widget/background.dart';
import 'package:spice_marriage/Widget/custom_button.dart';
import 'package:spice_marriage/Widget/custom_text.dart';
import 'package:spice_marriage/Widget/custom_text_field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:spice_marriage/Widget/toast.dart';
import '../Utils/app_navigation.dart';
import '../Utils/app_route_name.dart';

class ResetPassword extends StatefulWidget {
  final String? user_id;
  const ResetPassword({Key? key, this.user_id}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController NewPasswordController = TextEditingController();
  TextEditingController ConformPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                  maintext: AppStrings.RESET_PASSWORD_TEXT,
                  underline: true,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                CustomTextField(
                  texthint: AppStrings.ENTER_NEW_PASSWORD_FIELD_TEXT,
                  password_hidden: true,
                  fieldcontroller: NewPasswordController,
                  fieldvalidator: (val) => Validation.PasswordValidation(
                      val: NewPasswordController.text),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                CustomTextField(
                  texthint: AppStrings.CONFORM_PASSWORD_FIELD_TEXT,
                  password_hidden: true,
                  fieldcontroller: ConformPasswordController,
                  fieldvalidator: (val) => Validation.MatchPasswordValidation(
                      val1: NewPasswordController.text,
                      val2: ConformPasswordController.text),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                CustomButton(
                  text: AppStrings.RESET_PASSWORD_BUTTON_TEXT,
                  color: AppColors.RED,
                  textcolor: AppColors.WHITE,
                  onClicked: () {
                    if (_formKey.currentState!.validate()) {
                      print('Filed Required');
                      reset_password(
                        widget.user_id,
                        NewPasswordController.text,
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

  reset_password(String? user_id, String password) async {
    print(user_id);
    print("******************$user_id**************************");

    Map data = {
      'user_id': user_id,
      'new_password': password,
    };
    var jsondata = null;
    var url = Uri.parse("http://server.appsstaging.com:3079/api/resetPassword");
    var response = await http.post(
      url,
      body: data,
    );
    if (response.statusCode == 200) {
      print('Password Update Sucessfull');
      jsondata = jsonDecode(response.body);
      if (jsondata['status'] == 1) {
        Toast_Message("Password Update Sucessfull");

        print('__________________________');

        print(jsondata['status']);

        print(jsondata);

        print('__________________________');

        // ignore: use_build_context_synchronously
        AppNavigation.navigateTo(context, AppRouteName.LOGIN_SCREEN_ROUTE);
      } else {
        print('User is Change');
        print(response.body);
      }
    } else {
      print('ERROR');
      print(response.body);
    }
  }
}
