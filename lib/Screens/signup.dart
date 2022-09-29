import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:spice_marriage/Utils/app_strings.dart';
import 'package:spice_marriage/Utils/validation.dart';
import 'package:spice_marriage/Widget/background.dart';
import '../Utils/app_colors.dart';
import '../Utils/app_navigation.dart';
import '../Utils/app_route_name.dart';
import '../Widget/app_logo.dart';
import '../Widget/custom_bottom_container.dart';
import '../Widget/custom_button.dart';
import '../Widget/custom_text.dart';
import '../Widget/custom_text_field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Widget/toast.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypedpasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      child: _isLoading
          ? const Center(
              child: SpinKitFadingCircle(
                color: AppColors.RED,
              ),
            )
          : SingleChildScrollView(
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.11,
                    ),
                    const AppLogo(),
                    const CustomText(
                      maintext: AppStrings.SIGNUP_TEXT,
                      underline: true,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    CustomTextField(
                      texthint: AppStrings.NAME_FIELD_TEXT,
                      fieldcontroller: nameController,
                      fieldvalidator: (val) =>
                          Validation.NameValidation(val: nameController.text),
                    ),
                    spacearea(),
                    CustomTextField(
                      texthint: AppStrings.EMAIL_FIELD_TEXT,
                      fieldcontroller: emailController,
                      fieldvalidator: (val) =>
                          Validation.EmailValidation(val: emailController.text),
                    ),
                    spacearea(),
                    CustomTextField(
                      password_hidden: true,
                      texthint: AppStrings.PASSWORD_FIELD_TEXT,
                      fieldcontroller: passwordController,
                      fieldvalidator: (val) => Validation.PasswordValidation(
                          val: passwordController.text),
                    ),
                    spacearea(),
                    CustomTextField(
                      password_hidden: true,
                      texthint: AppStrings.RETYPE_PASSWORD_FIELD_TEXT,
                      fieldcontroller: retypedpasswordController,
                      fieldvalidator: (val1) =>
                          Validation.MatchPasswordValidation(
                              val1: passwordController.text,
                              val2: retypedpasswordController.text),
                    ),
                    spacearea(),
                    CustomButton(
                      text: AppStrings.SIGNUP_BUTTON_TEXT,
                      color: AppColors.RED,
                      textcolor: AppColors.WHITE,
                      onClicked: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });
                          signup(
                              nameController.text,
                              emailController.text,
                              passwordController.text,
                              retypedpasswordController.text);
                        }
                      },
                    ),
                    CustomBottomContainer(
                      is_padding: true,
                      starttext: AppStrings.ALREADY_HAVE_AN_ACCOUNT_TEXT,
                      endtext: AppStrings.LOGIN_BOTTOM_TEXT,
                      onclick: () {
                        AppNavigation.navigateTo(
                            context, AppRouteName.LOGIN_SCREEN_ROUTE);
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget spacearea() {
    return SizedBox(height: MediaQuery.of(context).size.height * 0.015);
  }

  signup(String name, String email, String password,
      String retypedpassword) async {
    if (password == retypedpassword) {
      Map data = {
        'name': name,
        'email': email,
        'password': password,
        'profilePicture': 'pic',
      };
      var jsondata = null;
      var url = Uri.parse("http://server.appsstaging.com:3079/api/register");
      var response = await http.post(url, body: data);
      if (response.statusCode == 200) {
        print('Registered successfully');
        Toast_Message('Registered Sucessfull');
        jsondata = jsonDecode(response.body);
        setState(() {
          _isLoading = false;
        });
        AppNavigation.navigateTo(context, AppRouteName.LOGIN_SCREEN_ROUTE);
      } else {
        print('ERROR');
        print(response.body);
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      print('Password is no Match');
    }
  }
}
