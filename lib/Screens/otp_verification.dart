import 'dart:async';
import 'package:flutter/material.dart';
import 'package:spice_marriage/Utils/app_colors.dart';
import 'package:spice_marriage/Utils/app_strings.dart';
import 'package:spice_marriage/Widget/app_logo.dart';
import 'package:spice_marriage/Widget/background.dart';
import 'package:spice_marriage/Widget/custom_bottom_container.dart';
import 'package:spice_marriage/Widget/custom_button.dart';
import 'package:spice_marriage/Widget/custom_text.dart';
import 'package:spice_marriage/Widget/custom_text_field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Utils/app_navigation.dart';
import '../Utils/app_route_name.dart';
import '../Utils/validation.dart';
import '../Widget/toast.dart';

class OtpVerification extends StatefulWidget {
  final String? user_id;
  const OtpVerification({
    Key? key,
    this.user_id,
  }) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  TextEditingController OtpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Timer? _timer;
  bool enabled = false;
  int start = 0;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    start = 15;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (start != 0) {
        setState(() {
          start--;
        });
      } else if (start == 0) {
        setState(() {
          enabled = true;
        });
      }
    });
  }

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
                    maintext: AppStrings.ENTER_OTP_VERIFICATION_TEXT,
                    underline: true,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  CustomTextField(
                    texthint: AppStrings.ENTER_CODE_FIELD_TEXT,
                    fieldcontroller: OtpController,
                    fieldvalidator: (val) =>
                        Validation.OtplValidation(val: OtpController.text),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    children: [
                      CustomBottomContainer(
                        starttext: AppStrings.DIDNT_RECEIVE_CODE_TEXT,
                        endtext: AppStrings.RESEND_TEXT,
                        onclick: () {
                          enabled ? resend(widget.user_id) : null;
                        },
                      ),
                      Text(
                        '00 :$start ',
                        style: const TextStyle(
                          fontSize: 25.0,
                          color: AppColors.WHITE,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  CustomButton(
                    text: AppStrings.CONTINUE_BUTTON_TEXT,
                    color: AppColors.RED,
                    textcolor: AppColors.WHITE,
                    onClicked: () {
                      if (_formKey.currentState!.validate()) {
                        print('Filed Required');
                        otp_verification(
                          widget.user_id,
                          OtpController.text,
                        );
                      }
                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }

  otp_verification(String? userId, String code) async {
    print(
        '========================================$userId=======================');

    Map data = {
      'user_id': userId,
      'verification_code': code,
    };
    var jsondata = null;
    var url = Uri.parse("http://server.appsstaging.com:3079/api/verifyCode");
    var response = await http.post(
      url,
      body: data,
    );
    if (response.statusCode == 200) {
      print('Code Send Sucessfull');
      jsondata = jsonDecode(response.body);
      if (jsondata['status'] == 1) {
        print('__________________________');
        Toast_Message('OTP Verified Sucessfull');
        print(jsondata['status']);

        print(jsondata);

        print('__________________________');
        // ignore: use_build_context_synchronously
        AppNavigation.navigateTo(
            context, AppRouteName.RESET_PASSWORD_SCREEN_ROUTE,
            arguments: userId);
      } else {
        print('Code Does not match');
        print(response.body);
      }
    } else {
      print('ERROR');
      print(response.body);
    }
  }

//RESED
  resend(String? userId) async {
    enabled = false;
    setState(() {
      startTimer();
    });
    Map data = {
      'user_id': userId,
    };
    var jsondata = null;
    var url = Uri.parse("http://server.appsstaging.com:3079/api/resendcode");
    var response = await http.post(
      url,
      body: data,
    );
    if (response.statusCode == 200) {
      jsondata = jsonDecode(response.body);

      if (jsondata['status'] == 1) {
        print('Code Send Sucessfull');
        Toast_Message(jsondata['message'].toString());
      } else {
       
        print(response.body);
      }
    } else {
      print('ERROR');
      print(response.body);
      print(jsondata['status']);
    }
  }
}
