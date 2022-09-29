import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spice_marriage/Utils/app_strings.dart';
import 'package:spice_marriage/Utils/validation.dart';
import 'package:spice_marriage/Widget/app_logo.dart';
import 'package:spice_marriage/Widget/background.dart';
import 'package:spice_marriage/Widget/custom_bottom_container.dart';
import 'package:spice_marriage/Widget/custom_button.dart';
import 'package:spice_marriage/Widget/custom_text.dart';
import 'package:spice_marriage/Widget/custom_text_field.dart';
import 'package:spice_marriage/Widget/toast.dart';
import '../Utils/app_colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Utils/app_navigation.dart';
import '../Utils/app_route_name.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      child: _isLoading
          ? const Center(
            // child: CircularProgressIndicator(
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
                      height: MediaQuery.of(context).size.height * 0.15,
                    ),
                    const AppLogo(),
                    const CustomText(
                      maintext: AppStrings.LOGIN_TEXT,
                      underline: true,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
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
                    Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.08,
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            AppNavigation.navigateTo(context,
                                AppRouteName.FORGOT_PASSWORD__SCREEN_ROUTE);
                          },
                          child: const Text(
                            AppStrings.FORGOT_YOUR_PASSWORD_TEXT,
                            style: TextStyle(
                              color: AppColors.WHITE,
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    spacearea(),
                    CustomButton(
                      text: AppStrings.LOGIN_BUTTON_TEXT,
                      color: AppColors.RED,
                      textcolor: AppColors.WHITE,
                      onClicked: () {
                        if (_formKey.currentState!.validate()) {
                          print('Filed Required');
                          setState(() {
                            _isLoading = true;
                          });
                          login(
                            emailController.text,
                            passwordController.text,
                          );

                         
                        }
                      },
                    ),
                    CustomBottomContainer(
                      is_padding: true,
                      starttext: AppStrings.DONT_HAVE_AN_ACCOUNT_TEXT,
                      endtext: AppStrings.SIGNUP_BOTTOM_TEXT,
                      onclick: () {
                        AppNavigation.navigateTo(
                            context, AppRouteName.SIGNUP_SCREEN_ROUTE);
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

  login(String email, String password) async {
    Map data = {
      'email': email,
      'password': password,
    };
    var jsonData = null;
    var url = Uri.parse("http://server.appsstaging.com:3079/api/login");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.post(
      url,
      body: data,
    );
    print(response);
    if (response.statusCode == 200) {
    
      jsonData = json.decode(response.body);
      setState(() {
        _isLoading = false;
        sharedPreferences.setString("token", jsonData['token']);
      });
      print("----------------------------------");
      print(jsonData['message']);
      Toast_Message(jsonData['message'].toString());
      print("------------------------------------");

      // ignore: use_build_context_synchronously
      AppNavigation.navigateTo(
          context, AppRouteName.SWIPE_FOR_SELECTION_SCREEN_ROUTE);
    } else {
      setState(() {
        _isLoading = false;
      });
      jsonData = json.decode(response.body);

      Toast_Message(jsonData['message'].toString());
      print(response.body);
    }
  }
}
